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

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderUninitialized extends OrderState {}

class OrderError extends OrderState {
  final String message;
  OrderError({ this.message });
}

class OrderLoaded extends OrderState {
  final OrderModel value;

  const OrderLoaded({ this.value });

  OrderLoaded copyWith({ OrderModel copyThis }) {
    return OrderLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'OrderModelLoaded { value: $value }';
}


