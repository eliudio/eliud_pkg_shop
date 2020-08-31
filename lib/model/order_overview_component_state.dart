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

abstract class OrderOverviewState extends Equatable {
  const OrderOverviewState();

  @override
  List<Object> get props => [];
}

class OrderOverviewUninitialized extends OrderOverviewState {}

class OrderOverviewError extends OrderOverviewState {
  final String message;
  OrderOverviewError({ this.message });
}

class OrderOverviewLoaded extends OrderOverviewState {
  final OrderOverviewModel value;

  const OrderOverviewLoaded({ this.value });

  OrderOverviewLoaded copyWith({ OrderOverviewModel copyThis }) {
    return OrderOverviewLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'OrderOverviewModelLoaded { value: $value }';
}


