import 'package:eliud_pkg_shop/model/order_model.dart';

import 'payment_platform.dart';
import 'package:eliud_model/model/abstract_repository_singleton.dart';
import 'package:eliud_model/model/js_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'web_stripe_elements.dart';

class WebPaymentPlatform extends AbstractPaymentPlatform {
  @override
  void startPaymentProcess(
      BuildContext context, HandlePayment handlePayment, OrderModel order) {
    debugPrint("startPaymentProcess");
    var ccy = order.currency;
    var cents = (order.totalPrice * 100).toInt();
    var name = order.name;
    debugPrint("before showDialog");
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: 400.0,
                height: 100.0,
                child: WebStripeElements(
                    ccy: ccy,
                    name: name,
                    cents: cents,
                    order: order,
                    handlePayment: handlePayment)),
          );
        });
  }
}
