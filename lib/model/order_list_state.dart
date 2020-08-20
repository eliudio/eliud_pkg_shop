/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'order_model.dart';

abstract class OrderListState extends Equatable {
  const OrderListState();

  @override
  List<Object> get props => [];
}

class OrderListLoading extends OrderListState {}

class OrderListLoaded extends OrderListState {
  final List<OrderModel> values;

  const OrderListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'OrderListLoaded { values: $values }';
}

class OrderNotLoaded extends OrderListState {}

