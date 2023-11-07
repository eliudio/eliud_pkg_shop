import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PaymentState extends Equatable {
  const PaymentState();
}

class PayUninitialised extends PaymentState {
  @override
  String toString() {
    return 'PayUninitialised';
  }

  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayUninitialised && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

// State where user is not logged in and hence no checkout process possible
class NotLoggedOn extends PaymentState {
  @override
  String toString() {
    return 'NotLoggedOn';
  }

  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotLoggedOn && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

// State where no items are in the cart and hence no checkout process possible
class NoItemsInCart extends PaymentState {
  @override
  String toString() {
    return 'NoItemsInCart';
  }

  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoItemsInCart && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

// State where user is expected to confirm the order
class ConfirmOrder extends PaymentState {
  final OrderModel order;

  const ConfirmOrder(this.order);

  @override
  String toString() {
    return 'ConfirmOrder{order: $order}';
  }

  @override
  List<Object> get props => [order];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfirmOrder &&
          runtimeType == other.runtimeType &&
          order == other.order;

  @override
  int get hashCode => order.hashCode;
}

// State where user is expected to pay the order
class PayOrder extends PaymentState {
  final String id = 'PayOrder';
  final OrderModel? order;

  const PayOrder({this.order});

  @override
  String toString() {
    return 'PayOrder{order: $order}';
  }

  @override
  List<Object?> get props => [id, order];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayOrder &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          order == other.order;

  @override
  int get hashCode => order == null ? 0 : order.hashCode;
}

// Not enough stock PaymentState
class LackOfStock extends PaymentState {
  final OrderModel? order;

  const LackOfStock({this.order});

  @override
  String toString() {
    return 'LackOfStock{order: $order}';
  }

  @override
  List<Object?> get props => [order];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LackOfStock &&
          runtimeType == other.runtimeType &&
          order == other.order;

  @override
  int get hashCode => order == null ? 0 : order.hashCode;
}

// State where user is informed he has paid the order
class OrderPaid extends PaymentState {
  final OrderModel? order;

  const OrderPaid({this.order});

  @override
  String toString() {
    return 'OrderPaid{order: $order}';
  }

  @override
  List<Object?> get props => [order];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderPaid &&
          runtimeType == other.runtimeType &&
          order == other.order;

  @override
  int get hashCode => order == null ? 0 : order.hashCode;
}

// State where user is informed there was an issue in paying the order
class PaymentFailed extends PaymentState {
  final OrderModel? order;
  final String? msg;

  const PaymentFailed({this.order, this.msg});

  @override
  String toString() {
    return 'PaymentFailed{order: $order}';
  }

  @override
  List<Object?> get props => [order, msg];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentFailed &&
          runtimeType == other.runtimeType &&
          order == other.order &&
          msg == other.msg;

  @override
  int get hashCode => order == null ? 0 : order.hashCode;
}
