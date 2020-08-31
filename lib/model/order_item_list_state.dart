/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_item_model.dart';

abstract class OrderItemListState extends Equatable {
  const OrderItemListState();

  @override
  List<Object> get props => [];
}

class OrderItemListLoading extends OrderItemListState {}

class OrderItemListLoaded extends OrderItemListState {
  final List<OrderItemModel> values;

  const OrderItemListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'OrderItemListLoaded { values: $values }';
}

class OrderItemNotLoaded extends OrderItemListState {}

