/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';

/* 
 * CartComponentState is the base class for state for CartComponentBloc
 */
abstract class CartComponentState extends Equatable {
  const CartComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * CartComponentUninitialized is the uninitialized state of the CartComponentBloc 
 */
class CartComponentUninitialized extends CartComponentState {}

/* 
 * CartComponentError is the error state of the CartComponentBloc 
 */
class CartComponentError extends CartComponentState {
  final String? message;
  CartComponentError({this.message});
}

/* 
 * CartComponentPermissionDenied is to indicate permission denied state of the CartComponentBloc 
 */
class CartComponentPermissionDenied extends CartComponentState {
  CartComponentPermissionDenied();
}

/* 
 * CartComponentLoaded is used to set the state of the CartComponentBloc to the loaded state
 */
class CartComponentLoaded extends CartComponentState {
  final CartModel value;

  /* 
   * construct CartComponentLoaded
   */
  const CartComponentLoaded({required this.value});

  /* 
   * copy method
   */
  CartComponentLoaded copyWith({CartModel? copyThis}) {
    return CartComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'CartComponentLoaded { value: $value }';
}
