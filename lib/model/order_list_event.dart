/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';

abstract class OrderListEvent extends Equatable {
  const OrderListEvent();
  @override
  List<Object?> get props => [];
}

class LoadOrderList extends OrderListEvent {}

class NewPage extends OrderListEvent {}

class AddOrderList extends OrderListEvent {
  final OrderModel? value;

  const AddOrderList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddOrderList{ value: $value }';
}

class UpdateOrderList extends OrderListEvent {
  final OrderModel? value;

  const UpdateOrderList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateOrderList{ value: $value }';
}

class DeleteOrderList extends OrderListEvent {
  final OrderModel? value;

  const DeleteOrderList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteOrderList{ value: $value }';
}

class OrderListUpdated extends OrderListEvent {
  final List<OrderModel?>? value;
  final bool? mightHaveMore;

  const OrderListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'OrderListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class OrderChangeQuery extends OrderListEvent {
  final EliudQuery? newQuery;

  const OrderChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'OrderChangeQuery{ value: $newQuery }';
}
