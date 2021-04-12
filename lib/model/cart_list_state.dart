/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';

abstract class CartListState extends Equatable {
  const CartListState();

  @override
  List<Object?> get props => [];
}

class CartListLoading extends CartListState {}

class CartListLoaded extends CartListState {
  final List<CartModel?>? values;
  final bool? mightHaveMore;

  const CartListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'CartListLoaded { values: $values }';
}

class CartNotLoaded extends CartListState {}

