/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';

abstract class CartItemListEvent extends Equatable {
  const CartItemListEvent();
  @override
  List<Object> get props => [];
}

class LoadCartItemList extends CartItemListEvent {
  final String orderBy;
  final bool descending;

  LoadCartItemList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadCartItemListWithDetails extends CartItemListEvent {}

class AddCartItemList extends CartItemListEvent {
  final CartItemModel value;

  const AddCartItemList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddCartItemList{ value: $value }';
}

class UpdateCartItemList extends CartItemListEvent {
  final CartItemModel value;

  const UpdateCartItemList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateCartItemList{ value: $value }';
}

class DeleteCartItemList extends CartItemListEvent {
  final CartItemModel value;

  const DeleteCartItemList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteCartItemList{ value: $value }';
}

class CartItemListUpdated extends CartItemListEvent {
  final List<CartItemModel> value;

  const CartItemListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'CartItemListUpdated{ value: $value }';
}

