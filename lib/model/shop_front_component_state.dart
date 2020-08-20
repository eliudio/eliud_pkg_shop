/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'shop_front_model.dart';

abstract class ShopFrontState extends Equatable {
  const ShopFrontState();

  @override
  List<Object> get props => [];
}

class ShopFrontUninitialized extends ShopFrontState {}

class ShopFrontError extends ShopFrontState {
  final String message;
  ShopFrontError({ this.message });
}

class ShopFrontLoaded extends ShopFrontState {
  final ShopFrontModel value;

  const ShopFrontLoaded({ this.value });

  ShopFrontLoaded copyWith({ ShopFrontModel copyThis }) {
    return ShopFrontLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'ShopFrontModelLoaded { value: $value }';
}


