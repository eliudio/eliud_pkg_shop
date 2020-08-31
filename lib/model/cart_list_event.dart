/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';

abstract class CartListEvent extends Equatable {
  const CartListEvent();
  @override
  List<Object> get props => [];
}

class LoadCartList extends CartListEvent {}
class LoadCartListWithDetails extends CartListEvent {}

class AddCartList extends CartListEvent {
  final CartModel value;

  const AddCartList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddCartList{ value: $value }';
}

class UpdateCartList extends CartListEvent {
  final CartModel value;

  const UpdateCartList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateCartList{ value: $value }';
}

class DeleteCartList extends CartListEvent {
  final CartModel value;

  const DeleteCartList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteCartList{ value: $value }';
}

class CartListUpdated extends CartListEvent {
  final List<CartModel> value;

  const CartListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'CartListUpdated{ value: $value }';
}

