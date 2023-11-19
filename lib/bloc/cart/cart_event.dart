import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_shop_model/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {}

class AddProduct extends CartEvent {
  final int amount;
  final ProductModel? product;
  final ActionModel? continueShoppingAction;

  AddProduct(this.amount, this.product, this.continueShoppingAction);

  @override
  List<Object?> get props => [amount, product, continueShoppingAction];
}

class SimpleAddProduct extends CartEvent {
  final int amount;
  final ProductModel? product;

  SimpleAddProduct(this.amount, this.product);

  @override
  List<Object?> get props => [amount, product];
}

class RemoveProduct extends CartEvent {
  final int amount;
  final ProductModel product;

  RemoveProduct(this.amount, this.product);

  @override
  List<Object> get props => [amount, product];
}

class EmptyCart extends CartEvent {}
