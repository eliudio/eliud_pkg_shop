import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:flutter/cupertino.dart';

typedef void HandlePayment(OrderModel order, PaymentStatus status);

abstract class PaymentStatus {}

class PaymentSucceeded extends PaymentStatus {
  final String reference;

  PaymentSucceeded(this.reference);
}

class PaymentFailure extends PaymentStatus {
  final String error;
  final String reference;

  PaymentFailure(this.error, this.reference);
}

abstract class AbstractPaymentPlatform {
  static AbstractPaymentPlatform platform;

  void startPaymentProcess(BuildContext context, HandlePayment handlePayment, OrderModel orderModel, );
}
