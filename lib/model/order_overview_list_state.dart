/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'order_overview_model.dart';

abstract class OrderOverviewListState extends Equatable {
  const OrderOverviewListState();

  @override
  List<Object> get props => [];
}

class OrderOverviewListLoading extends OrderOverviewListState {}

class OrderOverviewListLoaded extends OrderOverviewListState {
  final List<OrderOverviewModel> values;

  const OrderOverviewListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'OrderOverviewListLoaded { values: $values }';
}

class OrderOverviewNotLoaded extends OrderOverviewListState {}

