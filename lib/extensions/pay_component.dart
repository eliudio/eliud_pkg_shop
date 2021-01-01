import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:eliud_pkg_pay/platform/payment_platform.dart';
import 'package:eliud_pkg_pay/tools/task/pay_task_model.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/bloc/payment_bloc.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/bloc/payment_event.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/bloc/payment_state.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/order_helper.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/pay_component.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';
import 'package:eliud_pkg_shop/model/pay_repository.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/assignment_model.dart';
import 'package:eliud_pkg_workflow/tools/helper/assignment_helper.dart';
import 'package:eliud_pkg_workflow/tools/workflow_action_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_pkg_pay/tools/bloc/pay_event.dart';
import 'package:eliud_pkg_pay/tools/bloc/pay_state.dart';
import 'package:eliud_pkg_pay/tools/bloc/pay_bloc.dart';

class PayComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, Object> parameters}) {
    return PayProfileComponent(id: id);
  }
}

class PayProfileComponent extends AbstractPayComponent {
  PaymentBloc paymentBloc;
  PayProfileComponent({String id}) : super(payID: id);

  @override
  Widget yourWidget(BuildContext context, PayModel pay) {
    var cartBloc = BlocProvider.of<CartBloc>(context);
    var accessBloc = AccessBloc.getBloc(context);
    return BlocProvider<PaymentBloc>(
        create: (context) =>
            PaymentBloc(cartBloc, accessBloc)..add(CollectOrder(pay.shop)),
        child:
            BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
          return _paymentWidget(context, pay);
        }));
  }

  void something(bool success, AssignmentModel assignmentModel) {
    if (success) {
      handle(PaymentSucceeded(AssignmentHelper.getResultFor(
          assignmentModel, PayTaskModel.PAY_TASK_FIELD_PAYMENT_REFERENCE)));
    } else {
      handle(PaymentFailure(
          AssignmentHelper.getResultFor(
              assignmentModel, PayTaskModel.PAY_TASK_FIELD_PAYMENT_REFERENCE),
          AssignmentHelper.getResultFor(
              assignmentModel, PayTaskModel.PAY_TASK_FIELD_ERROR)));
    }
  }

  Widget _paymentWidget(BuildContext context, PayModel pay) {
    var appState = AccessBloc.getState(context);
    if (appState is AppLoaded) {
      return BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
        if (state is NotLoggedOn) {
          return Text('Not logged on');
        } else {
          if (state is PayOrder) {
            return BlocProvider<PayBloc>(
                create: (context) =>
                    PayBloc()..add(InitPayEvent(state.order.currency, state.order.totalPrice, state.order.documentID)),
                child: BlocBuilder<PayBloc, PayState>(
                    builder: (pay_context, pay_state) {
                  if (pay_state is InitializedPayState) {
                    paymentBloc = BlocProvider.of<PaymentBloc>(context);
                    order = state.order;
                    WorkflowActionHandler.executeWorkflow(
                        pay_context, pay.payAction,
                        finaliseWorkflow: something);
                  }
                  return _overviewAndPay(context, appState.app, state.order,
                      message: 'Please review your order.',
                      subMessage: "If you're happy with it, then press Pay",
                      trailing: Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                        size: 50.0,
                        semanticLabel: 'Contact',
                      ));
                }));
            // initialise paymentBloc so that 'handle' can access it
          } else if (state is NoItemsInCart) {
            return Text('No items in cart');
          } else if (state is ConfirmOrder) {
            return _overviewAndPay(context, appState.app, state.order,
                message: 'Please review your order.',
                subMessage: "If you're happy with it, then press Pay",
                trailing: Icon(
                  Icons.remove_red_eye,
                  color: Colors.black,
                  size: 50.0,
                  semanticLabel: 'Contact',
                ));
          } else if (state is LackOfStock) {
            return _overviewAndPay(context, appState.app, state.order,
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
            var parameters = <String, Object>{
              'orderId': state.order.documentID
            };
            eliudrouter.Router.navigateTo(context, pay.succeeded,
                parameters: parameters);
          } else if (state is PaymentFailed) {
            return _overviewAndPay(context, appState.app, state.order,
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
        return DelayedCircularProgressIndicator();
      });
    } else {
      return Text('App not loaded');
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  PayRepository getPayRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .payRepository(AccessBloc.appId(context));
  }

  OrderModel order;

  void handle(PaymentStatus status) {
    if (status is PaymentFailure) {
      paymentBloc.add(PaymentDoneWithFailure(order, status.error));
    } else if (status is PaymentSucceeded) {
      paymentBloc.add(PaymentDoneWithSuccess(order, status.reference));
    }
  }

  Widget _getButton(BuildContext context, AppModel app, OrderModel order) {
    var paymentBloc = BlocProvider.of<PaymentBloc>(context);
    return Row(
//      alignment: WrapAlignment.spaceAround, // set your alignment
      children: <Widget>[
        Spacer(),
        RaisedButton(
            color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        Spacer(),
        RaisedButton(
            color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
            onPressed: () {
              paymentBloc.add(PayTheOrder(order));
            },
            child: Text('Continue')),
        Spacer(),
      ],
    );
  }

  Widget _overviewAndPay(BuildContext context, AppModel app, OrderModel order,
      {String message, String subMessage, Widget trailing}) {
    var widgets = <Widget>[];
    if (message != null) {
      widgets.add(ListTile(
          trailing: trailing,
          title: message != null ? Text(message) : null,
          subtitle: subMessage != null ? Text(subMessage) : null));
    }
    OrderHelper.addOrderOverviewBeforePayment(widgets, order, context);
    widgets.add(Divider());
    widgets.add(_getButton(context, app, order));
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: widgets,
    );
  }

  Widget getRow(String title, String value, {Widget trailing}) => ListTile(
        trailing: trailing,
        title: Text(title),
        subtitle: value != null ? Text(value) : null,
      );
}
