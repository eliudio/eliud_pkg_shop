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
import 'package:eliud_pkg_shop/model/cart_model.dart';

abstract class CartComponentState extends Equatable {
  const CartComponentState();

  @override
  List<Object> get props => [];
}

class CartComponentUninitialized extends CartComponentState {}

class CartComponentError extends CartComponentState {
  final String message;
  CartComponentError({ this.message });
}

class CartComponentLoaded extends CartComponentState {
  final CartModel value;

  const CartComponentLoaded({ this.value });

  CartComponentLoaded copyWith({ CartModel copyThis }) {
    return CartComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'CartComponentLoaded { value: $value }';
}


