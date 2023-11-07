import 'package:eliud_pkg_shop/bloc/cart/cart_helper.dart';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartUninitialised extends CartState {}

class CartInitialised extends CartState {
  final int timestamp;
  final List<CartItemModel>? items;

  CartInitialised(this.items)
      : timestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object?> get props => [timestamp, items];

  double totalValue() => CartHelper.totalValue(items!);

  int? amountOfProducts() => CartHelper.amountOfProducts(items);
}
