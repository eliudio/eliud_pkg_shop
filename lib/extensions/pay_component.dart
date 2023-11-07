import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_pay/tasks/bloc/pay_bloc.dart';
import 'package:eliud_pkg_pay/tasks/bloc/pay_event.dart';
import 'package:eliud_pkg_pay/tasks/bloc/pay_state.dart';
import 'package:eliud_pkg_pay/tasks/pay_task_model.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/bloc/payment_bloc.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/bloc/payment_event.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/bloc/payment_state.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/order_helper.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/pay_component.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_handler.dart';
import 'package:eliud_pkg_workflow/tools/helper/assignment_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return PayProfileComponent(key: key, app: app, id: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await payRepository(appId: app.documentID)!.get(id);
}

class PayProfileComponent extends AbstractPayComponent {
  PayProfileComponent({super.key, required super.app, required String id})
      : super(payId: id);

  @override
  Widget yourWidget(BuildContext context, PayModel? value) {
    if (value == null) return Text("pay is null");
    var cartBloc = BlocProvider.of<CartBloc>(context);
    var accessBloc = AccessBloc.getBloc(context);
    return BlocProvider<PaymentBloc>(
        create: (context) =>
            PaymentBloc(app, cartBloc, accessBloc, value.succeeded)
              ..add(CollectOrder(value.shop)),
        child:
            BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
          return _paymentWidget(context, value);
        }));
  }

  Widget _paymentWidget(BuildContext context, PayModel? pay) {
    var appState = AccessBloc.getState(context);
    if (appState is AccessDetermined) {
      return BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
        if (state is NotLoggedOn) {
          return text(app, context, 'Not logged on');
        } else {
          if (state is PayOrder) {
            return BlocProvider<PayBloc>(
                create: (context) => PayBloc()
                  ..add(InitPayEvent(state.order!.currency!,
                      state.order!.totalPrice!, state.order!.documentID)),
                child: BlocListener<PayBloc, PayState>(
                    listener: (payContext, payState) {
                      if (payState is InitializedPayState) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          eliudrouter.Router.navigateTo(
                              payContext, pay!.payAction!, parameters: {
                            WorkflowActionHandler.finaliseWorkflow:
                                handlePayment
                          });
                        });
                      }
                    },
                    child: _overviewAndPay(context, state.order!,
                        message: 'Please review your order.',
                        subMessage: "If you're happy with it, then press Pay",
                        trailing: Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                          size: 50.0,
                          semanticLabel: 'Contact',
                        ))));
          } else if (state is NoItemsInCart) {
            return text(app, context, 'No items in cart');
          } else if (state is ConfirmOrder) {
            return _overviewAndPay(context, state.order,
                message: 'Please review your order.',
                subMessage: "If you're happy with it, then press Pay",
                trailing: Icon(
                  Icons.remove_red_eye,
                  color: Colors.black,
                  size: 50.0,
                  semanticLabel: 'Contact',
                ));
          } else if (state is LackOfStock) {
            return _overviewAndPay(context, state.order!,
                message:
                    'Unfortunatly during checkout some items in your bag seem to have been sold to another customer.',
                subMessage:
                    'This item has been removed from your order and the new order is now updated below. Please verify and if you like to continue with the purchase, please press Pay.',
                trailing: Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 50.0,
                  semanticLabel: 'Contact',
                ));
          } else if (state is OrderPaid) {
          } else if (state is PaymentFailed) {
            return _overviewAndPay(context, state.order!,
                trailing: Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 50.0,
                  semanticLabel: 'Failure',
                ),
                message:
                    'Purchase failed unfortunatly. Something went wrong during payment. ',
                subMessage: state.msg);
          }
        }
        // in all other cases:
        return progressIndicator(app, context);
      });
    } else {
      return Text('App not loaded');
    }
  }

  void handlePayment(
      BuildContext context, bool success, AssignmentModel assignmentModel) {
    var myPaymentBloc = BlocProvider.of<PaymentBloc>(context);
    var myState = myPaymentBloc.state;
    if (myState is PayOrder) {
      var myOrder = myState.order;
      if (success) {
        String? value = AssignmentHelper.getResultFor(
            assignmentModel, PayTaskModel.payTaskFieldPaymentReference);
        if (value != null) {
          myPaymentBloc.add(PaymentDoneWithSuccess(myOrder, value));
        } else {
          print("No result found for payment");
        }
      } else {
        String? value = AssignmentHelper.getResultFor(
            assignmentModel, PayTaskModel.payTaskFieldError);
        if (value != null) {
          myPaymentBloc.add(PaymentDoneWithFailure(myOrder, value));
        } else {
          print("No result found for payment");
        }
      }
    }
  }

  Widget _getButton(BuildContext context, OrderModel order) {
    var paymentBloc = BlocProvider.of<PaymentBloc>(context);
    return Row(
//      alignment: WrapAlignment.spaceAround, // set your alignment
      children: <Widget>[
        Spacer(),
        button(
          app,
          context,
          label: 'Cancel',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Spacer(),
        button(
          app,
          context,
          label: 'Continue',
          onPressed: () {
            paymentBloc.add(PayTheOrder(order));
          },
        ),
        Spacer(),
      ],
    );
  }

  Widget _overviewAndPay(BuildContext context, OrderModel order,
      {String? message, String? subMessage, Widget? trailing}) {
    var widgets = <Widget>[];
    if (message != null) {
      widgets.add(ListTile(
        trailing: trailing,
        title: h4(app, context, message),
        subtitle: subMessage != null ? h4(app, context, subMessage) : null,
      ));
    }
    OrderHelper.addOrderOverviewBeforePayment(app, widgets, order, context);
    widgets.add(Divider());
    widgets.add(_getButton(context, order));
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: widgets,
    );
  }
}
