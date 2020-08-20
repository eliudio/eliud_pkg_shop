import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'payment_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

class MobilePaymentPlatform extends AbstractPaymentPlatform {
  MobilePaymentPlatform();

  final HttpsCallable INTENT = CloudFunctions.instance
      .getHttpsCallable(functionName: 'createPaymentIntent');

  @override
  void startPaymentProcess(BuildContext context, HandlePayment handlePayment, OrderModel order) {
    var ccy = order.currency;
    var cents = (order.totalPrice * 100).toInt();
    StripePayment.setOptions(StripeOptions(
        publishableKey: 'pk_test_51GxyTUCM4yYbbMk8IvFWz65Lp5aCXN16iZcQsr0Z1VYQPlrwe7GhoJ4ZTdF571VYTzOrzHAvr0Q5LKdTCZ3naaYo00T4RFwif7',
        androidPayMode: 'test'));

    var prefilledInformation  = PrefilledInformation(
        billingAddress: BillingAddress(
        ));
    var options = CardFormPaymentRequest(requiredBillingAddressFields: 'full', prefilledInformation: prefilledInformation);

    StripePayment.paymentRequestWithCardForm(options)
        .then((paymentMethod) {
      var amount = cents.toDouble();
      INTENT.call(<String, dynamic>{'amount': amount,'currency':ccy}).then((response) {
        confirmDialog(context, response.data['client_secret'], paymentMethod, handlePayment, order); //function for confirmation for payment
      });
    });
  }

  void confirmDialog(BuildContext context, String clientSecret, PaymentMethod paymentMethod, HandlePayment handlePayment, OrderModel order) {
    var confirm = AlertDialog(
      title: Text('Confirm Payement'),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Make Payment',
              // style: TextStyle(fontSize: 25),
            ),
            Text('Charge amount:' + order.totalPrice.toString() + " " + order.currency)
          ],
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
            final snackBar = SnackBar(content: Text('Payment Cancelled'),);
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
        RaisedButton(
          child: Text('Confirm'),
          onPressed: () {
            Navigator.of(context).pop();
            confirmPayment(clientSecret, paymentMethod, handlePayment, order); // function to confirm Payment
          },
        ),
      ],
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return confirm;
        });
  }

  void confirmPayment(String sec, PaymentMethod paymentMethod, HandlePayment handlePayment, OrderModel order) {
    StripePayment.confirmPaymentIntent(
      PaymentIntent(clientSecret: sec, paymentMethodId: paymentMethod.id),
    ).then((val) {
      if (val.status == 'succeeded') {
        handlePayment(order, PaymentSucceeded(val.paymentIntentId));
      } else {
        handlePayment(order, PaymentFailure(val.status, jsonEncode(val.toJson())));
      }
    }).catchError((onError) {
      handlePayment(order, PaymentFailure(onError, ''));
    });
  }
}
