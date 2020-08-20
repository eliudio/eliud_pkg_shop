/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'cart_item_model.dart';

abstract class CartItemListState extends Equatable {
  const CartItemListState();

  @override
  List<Object> get props => [];
}

class CartItemListLoading extends CartItemListState {}

class CartItemListLoaded extends CartItemListState {
  final List<CartItemModel> values;

  const CartItemListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'CartItemListLoaded { values: $values }';
}

class CartItemNotLoaded extends CartItemListState {}

