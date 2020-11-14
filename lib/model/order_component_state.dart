/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';

abstract class OrderComponentState extends Equatable {
  const OrderComponentState();

  @override
  List<Object> get props => [];
}

class OrderComponentUninitialized extends OrderComponentState {}

class OrderComponentError extends OrderComponentState {
  final String message;
  OrderComponentError({ this.message });
}

class OrderComponentLoaded extends OrderComponentState {
  final OrderModel value;

  const OrderComponentLoaded({ this.value });

  OrderComponentLoaded copyWith({ OrderModel copyThis }) {
    return OrderComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'OrderComponentLoaded { value: $value }';
}


