/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';

abstract class OrderOverviewComponentState extends Equatable {
  const OrderOverviewComponentState();

  @override
  List<Object> get props => [];
}

class OrderOverviewComponentUninitialized extends OrderOverviewComponentState {}

class OrderOverviewComponentError extends OrderOverviewComponentState {
  final String message;
  OrderOverviewComponentError({ this.message });
}

class OrderOverviewComponentPermissionDenied extends OrderOverviewComponentState {
  OrderOverviewComponentPermissionDenied();
}

class OrderOverviewComponentLoaded extends OrderOverviewComponentState {
  final OrderOverviewModel value;

  const OrderOverviewComponentLoaded({ this.value });

  OrderOverviewComponentLoaded copyWith({ OrderOverviewModel copyThis }) {
    return OrderOverviewComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'OrderOverviewComponentLoaded { value: $value }';
}

