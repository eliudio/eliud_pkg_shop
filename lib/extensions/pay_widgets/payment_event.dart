import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:eliud_model/shared/action_model.dart';
import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CollectOrder extends PaymentEvent {
  final ShopModel shop;

  CollectOrder(this.shop);

  @override
  List<Object> get props => [ shop ];
}

// The user indicated he wants to pay
class PayTheOrder extends PaymentEvent {
  final OrderModel order;

  PayTheOrder(this.order);

  @override
  List<Object> get props => [ order ];
}

// The payment system reported successful payment
class PaymentDoneWithSuccess extends PaymentEvent {
  final OrderModel order;
  final String reference;

  PaymentDoneWithSuccess(this.order, this.reference);

  @override
  List<Object> get props => [ order ];

}

// The payment system reported failure during payment
class PaymentDoneWithFailure extends PaymentEvent {
  final OrderModel order;
  final String msg;

  PaymentDoneWithFailure(this.order, this.msg);

  @override
  List<Object> get props => [ order, msg ];

}