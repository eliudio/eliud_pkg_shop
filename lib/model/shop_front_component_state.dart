/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';

/* 
 * ShopFrontComponentState is the base class for state for ShopFrontComponentBloc
 */
abstract class ShopFrontComponentState extends Equatable {
  const ShopFrontComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * ShopFrontComponentUninitialized is the uninitialized state of the ShopFrontComponentBloc 
 */
class ShopFrontComponentUninitialized extends ShopFrontComponentState {}

/* 
 * ShopFrontComponentError is the error state of the ShopFrontComponentBloc 
 */
class ShopFrontComponentError extends ShopFrontComponentState {
  final String? message;
  ShopFrontComponentError({this.message});
}

/* 
 * ShopFrontComponentPermissionDenied is to indicate permission denied state of the ShopFrontComponentBloc 
 */
class ShopFrontComponentPermissionDenied extends ShopFrontComponentState {
  ShopFrontComponentPermissionDenied();
}

/* 
 * ShopFrontComponentLoaded is used to set the state of the ShopFrontComponentBloc to the loaded state
 */
class ShopFrontComponentLoaded extends ShopFrontComponentState {
  final ShopFrontModel value;

  /* 
   * construct ShopFrontComponentLoaded
   */
  const ShopFrontComponentLoaded({required this.value});

  /* 
   * copy method
   */
  ShopFrontComponentLoaded copyWith({ShopFrontModel? copyThis}) {
    return ShopFrontComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ShopFrontComponentLoaded { value: $value }';
}
