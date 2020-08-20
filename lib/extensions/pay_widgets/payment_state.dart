import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [ ];
}

class PayUninitialised extends PaymentState {

  @override
  String toString() {
    return 'PayUninitialised';
  }
}


// State where user is not logged in and hence no checkout process possible
class NotLoggedOn extends PaymentState {

  @override
  String toString() {
    return 'NotLoggedOn';
  }
}

// State where no items are in the cart and hence no checkout process possible
class NoItemsInCart extends PaymentState {

  @override
  String toString() {
    return 'NoItemsInCart';
  }
}

// State where user is expected to confirm the order
class ConfirmOrder extends PaymentState {
  final OrderModel order;

  const ConfirmOrder(this.order);

  @override
  List<Object> get props => [ order ];

  @override
  String toString() {
    return 'ConfirmOrder{order: $order}';
  }
}

// State where user is expected to pay the order
class PayOrder extends PaymentState {
  final String id = 'PayOrder';
  final OrderModel order;

  const PayOrder({ this.order });

  @override
  List<Object> get props => [ id, order ];

  @override
  String toString() {
    return 'PayOrder{order: $order}';
  }
}

// Not enough stock PaymentState
class LackOfStock extends PaymentState {
  final OrderModel order;

  const LackOfStock({this.order});

  @override
  List<Object> get props => [ order ];

  @override
  String toString() {
    return 'LackOfStock{order: $order}';
  }
}

// State where user is informed he has paid the order
class OrderPaid extends PaymentState {
  final OrderModel order;

  const OrderPaid({this.order});

  @override
  List<Object> get props => [ order ];

  @override
  String toString() {
    return 'OrderPaid{order: $order}';
  }
}

// State where user is informed there was an issue in paying the order
class PaymentFailed extends PaymentState {
  final OrderModel order;
  final String msg;

  const PaymentFailed({this.order, this.msg});

  @override
  List<Object> get props => [ order, msg ];

  @override
  String toString() {
    return 'PaymentFailed{order: $order}';
  }
}
