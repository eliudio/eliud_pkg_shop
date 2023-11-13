/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';

/* 
 * OrderComponentState is the base class for state for OrderComponentBloc
 */
abstract class OrderComponentState extends Equatable {
  const OrderComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * OrderComponentUninitialized is the uninitialized state of the OrderComponentBloc 
 */
class OrderComponentUninitialized extends OrderComponentState {}

/* 
 * OrderComponentError is the error state of the OrderComponentBloc 
 */
class OrderComponentError extends OrderComponentState {
  final String? message;
  OrderComponentError({this.message});
}

/* 
 * OrderComponentPermissionDenied is to indicate permission denied state of the OrderComponentBloc 
 */
class OrderComponentPermissionDenied extends OrderComponentState {
  OrderComponentPermissionDenied();
}

/* 
 * OrderComponentLoaded is used to set the state of the OrderComponentBloc to the loaded state
 */
class OrderComponentLoaded extends OrderComponentState {
  final OrderModel value;

  /* 
   * construct OrderComponentLoaded
   */
  const OrderComponentLoaded({required this.value});

  /* 
   * copy method
   */
  OrderComponentLoaded copyWith({OrderModel? copyThis}) {
    return OrderComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'OrderComponentLoaded { value: $value }';
}
