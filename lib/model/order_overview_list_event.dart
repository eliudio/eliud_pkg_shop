/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';

abstract class OrderOverviewListEvent extends Equatable {
  const OrderOverviewListEvent();
  @override
  List<Object?> get props => [];
}

class LoadOrderOverviewList extends OrderOverviewListEvent {}

class NewPage extends OrderOverviewListEvent {}

class AddOrderOverviewList extends OrderOverviewListEvent {
  final OrderOverviewModel? value;

  const AddOrderOverviewList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddOrderOverviewList{ value: $value }';
}

class UpdateOrderOverviewList extends OrderOverviewListEvent {
  final OrderOverviewModel? value;

  const UpdateOrderOverviewList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateOrderOverviewList{ value: $value }';
}

class DeleteOrderOverviewList extends OrderOverviewListEvent {
  final OrderOverviewModel? value;

  const DeleteOrderOverviewList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteOrderOverviewList{ value: $value }';
}

class OrderOverviewListUpdated extends OrderOverviewListEvent {
  final List<OrderOverviewModel?>? value;
  final bool? mightHaveMore;

  const OrderOverviewListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'OrderOverviewListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class OrderOverviewChangeQuery extends OrderOverviewListEvent {
  final EliudQuery? newQuery;

  const OrderOverviewChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'OrderOverviewChangeQuery{ value: $newQuery }';
}
