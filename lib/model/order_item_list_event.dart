/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_item_model.dart';

abstract class OrderItemListEvent extends Equatable {
  const OrderItemListEvent();
  @override
  List<Object?> get props => [];
}

class LoadOrderItemList extends OrderItemListEvent {}

class NewPage extends OrderItemListEvent {}

class AddOrderItemList extends OrderItemListEvent {
  final OrderItemModel? value;

  const AddOrderItemList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddOrderItemList{ value: $value }';
}

class UpdateOrderItemList extends OrderItemListEvent {
  final OrderItemModel? value;

  const UpdateOrderItemList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateOrderItemList{ value: $value }';
}

class DeleteOrderItemList extends OrderItemListEvent {
  final OrderItemModel? value;

  const DeleteOrderItemList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteOrderItemList{ value: $value }';
}

class OrderItemListUpdated extends OrderItemListEvent {
  final List<OrderItemModel?>? value;
  final bool? mightHaveMore;

  const OrderItemListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'OrderItemListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class OrderItemChangeQuery extends OrderItemListEvent {
  final EliudQuery? newQuery;

  const OrderItemChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'OrderItemChangeQuery{ value: $newQuery }';
}
