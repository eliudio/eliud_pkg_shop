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

abstract class ShopFrontComponentState extends Equatable {
  const ShopFrontComponentState();

  @override
  List<Object?> get props => [];
}

class ShopFrontComponentUninitialized extends ShopFrontComponentState {}

class ShopFrontComponentError extends ShopFrontComponentState {
  final String? message;
  ShopFrontComponentError({this.message});
}

class ShopFrontComponentPermissionDenied extends ShopFrontComponentState {
  ShopFrontComponentPermissionDenied();
}

class ShopFrontComponentLoaded extends ShopFrontComponentState {
  final ShopFrontModel value;

  const ShopFrontComponentLoaded({required this.value});

  ShopFrontComponentLoaded copyWith({ShopFrontModel? copyThis}) {
    return ShopFrontComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ShopFrontComponentLoaded { value: $value }';
}
