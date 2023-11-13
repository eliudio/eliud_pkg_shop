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

/* 
 * OrderOverviewComponentState is the base class for state for OrderOverviewComponentBloc
 */
abstract class OrderOverviewComponentState extends Equatable {
  const OrderOverviewComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * OrderOverviewComponentUninitialized is the uninitialized state of the OrderOverviewComponentBloc 
 */
class OrderOverviewComponentUninitialized extends OrderOverviewComponentState {}

/* 
 * OrderOverviewComponentError is the error state of the OrderOverviewComponentBloc 
 */
class OrderOverviewComponentError extends OrderOverviewComponentState {
  final String? message;
  OrderOverviewComponentError({this.message});
}

/* 
 * OrderOverviewComponentPermissionDenied is to indicate permission denied state of the OrderOverviewComponentBloc 
 */
class OrderOverviewComponentPermissionDenied
    extends OrderOverviewComponentState {
  OrderOverviewComponentPermissionDenied();
}

/* 
 * OrderOverviewComponentLoaded is used to set the state of the OrderOverviewComponentBloc to the loaded state
 */
class OrderOverviewComponentLoaded extends OrderOverviewComponentState {
  final OrderOverviewModel value;

  /* 
   * construct OrderOverviewComponentLoaded
   */
  const OrderOverviewComponentLoaded({required this.value});

  /* 
   * copy method
   */
  OrderOverviewComponentLoaded copyWith({OrderOverviewModel? copyThis}) {
    return OrderOverviewComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'OrderOverviewComponentLoaded { value: $value }';
}
