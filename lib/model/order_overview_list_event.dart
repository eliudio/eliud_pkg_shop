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

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';

abstract class OrderOverviewListEvent extends Equatable {
  const OrderOverviewListEvent();
  @override
  List<Object> get props => [];
}

class LoadOrderOverviewList extends OrderOverviewListEvent {
  final String orderBy;
  final bool descending;

  LoadOrderOverviewList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadOrderOverviewListWithDetails extends OrderOverviewListEvent {}

class AddOrderOverviewList extends OrderOverviewListEvent {
  final OrderOverviewModel value;

  const AddOrderOverviewList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddOrderOverviewList{ value: $value }';
}

class UpdateOrderOverviewList extends OrderOverviewListEvent {
  final OrderOverviewModel value;

  const UpdateOrderOverviewList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateOrderOverviewList{ value: $value }';
}

class DeleteOrderOverviewList extends OrderOverviewListEvent {
  final OrderOverviewModel value;

  const DeleteOrderOverviewList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteOrderOverviewList{ value: $value }';
}

class OrderOverviewListUpdated extends OrderOverviewListEvent {
  final List<OrderOverviewModel> value;

  const OrderOverviewListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'OrderOverviewListUpdated{ value: $value }';
}

