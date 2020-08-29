import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/router.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/payment_bloc.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/payment_event.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/payment_state.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_shop/platform/payment_platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_helper.dart';

// ignore: must_be_immutable
class PayWidget extends StatefulWidget {
  final PayModel pay;

  PayWidget(this.pay);

  @override
  State<StatefulWidget> createState() {
    return PayState();
  }
}

class PayState extends State<PayWidget> {
  void handle(OrderModel order, PaymentStatus status) {
    var paymentBloc = BlocProvider.of<PaymentBloc>(context);
    if (status is PaymentFailure) {
      paymentBloc.add(PaymentDoneWithFailure(order, status.error));
    } else if (status is PaymentSucceeded) {
      paymentBloc.add(PaymentDoneWithSuccess(order, status.reference));
    }
  }

  Widget _getButton(OrderModel order) {
    var paymentBloc = BlocProvider.of<PaymentBloc>(context);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RaisedButton(
          color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
          onPressed: () {
            paymentBloc.add(PayTheOrder(order));
          },
          child: Text('Pay')),
      SizedBox(
        width: 50,
        child: null,
      ),
      RaisedButton(
          color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Back'))
    ]);
  }

  Widget _overviewAndPay(OrderModel order,
      {String message, String subMessage, Widget trailing}) {
    var widgets = <Widget>[];
    if (message != null) {
      widgets.add(ListTile(
          trailing: trailing,
          title: message != null ? Text(message) : null,
          subtitle: subMessage != null ? Text(subMessage) : null));
    }
    OrderHelper.addOrderOverviewBeforePayment(widgets, order, context);
    widgets.add(_getButton(order));
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

  @override
  Widget build(BuildContext context) {
    debugPrint('build payment widget');
    return BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
      if (state is NotLoggedOn) {
        debugPrint('not logged on');
        return Text('Not logged on');
      } else {
        debugPrint('Evaluate ' + state.toString());
        if (state is PayOrder) {
          debugPrint('state is ayOrder');
          AbstractPaymentPlatform.platform
              .startPaymentProcess(context, handle, state.order);
          return _overviewAndPay(state.order,
              message: 'Please review your order.',
              subMessage: "If you're happy with it, then press Pay",
              trailing: Icon(
                Icons.remove_red_eye,
                color: Colors.black,
                size: 50.0,
                semanticLabel: 'Contact',
              ));
        } else if (state is NoItemsInCart) {
          debugPrint('state is NoItemsInCart');

          return Text('No items in cart');
        } else if (state is ConfirmOrder) {
          debugPrint('state is ConfirmOrder');
          return _overviewAndPay(state.order,
              message: 'Please review your order.',
              subMessage: "If you're happy with it, then press Pay",
              trailing: Icon(
                Icons.remove_red_eye,
                color: Colors.black,
                size: 50.0,
                semanticLabel: 'Contact',
              ));
        } else if (state is LackOfStock) {
          debugPrint('state is LackOfStock');
          return _overviewAndPay(state.order,
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
          var parameters = <String, String> { 'orderId': state.order.documentID };
          Router.navigateTo(context, widget.pay.succeeded, parameters: parameters);
        } else if (state is PaymentFailed) {
          debugPrint('state is PaymentFailed');
          return _overviewAndPay(state.order,
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
      return CircularProgressIndicator();
    });
  }
}
