/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'cart_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartUninitialized extends CartState {}

class CartError extends CartState {
  final String message;
  CartError({ this.message });
}

class CartLoaded extends CartState {
  final CartModel value;

  const CartLoaded({ this.value });

  CartLoaded copyWith({ CartModel copyThis }) {
    return CartLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'CartModelLoaded { value: $value }';
}


