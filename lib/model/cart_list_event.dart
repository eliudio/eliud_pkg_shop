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

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';

abstract class CartListEvent extends Equatable {
  const CartListEvent();
  @override
  List<Object?> get props => [];
}

class LoadCartList extends CartListEvent {}

class NewPage extends CartListEvent {}

class AddCartList extends CartListEvent {
  final CartModel? value;

  const AddCartList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddCartList{ value: $value }';
}

class UpdateCartList extends CartListEvent {
  final CartModel? value;

  const UpdateCartList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateCartList{ value: $value }';
}

class DeleteCartList extends CartListEvent {
  final CartModel? value;

  const DeleteCartList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteCartList{ value: $value }';
}

class CartListUpdated extends CartListEvent {
  final List<CartModel?>? value;
  final bool? mightHaveMore;

  const CartListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'CartListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class CartChangeQuery extends CartListEvent {
  final EliudQuery? newQuery;

  const CartChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'CartChangeQuery{ value: $newQuery }';
}

