/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';

abstract class ProductDisplayComponentState extends Equatable {
  const ProductDisplayComponentState();

  @override
  List<Object?> get props => [];
}

class ProductDisplayComponentUninitialized
    extends ProductDisplayComponentState {}

class ProductDisplayComponentError extends ProductDisplayComponentState {
  final String? message;
  ProductDisplayComponentError({this.message});
}

class ProductDisplayComponentPermissionDenied
    extends ProductDisplayComponentState {
  ProductDisplayComponentPermissionDenied();
}

class ProductDisplayComponentLoaded extends ProductDisplayComponentState {
  final ProductDisplayModel value;

  const ProductDisplayComponentLoaded({required this.value});

  ProductDisplayComponentLoaded copyWith({ProductDisplayModel? copyThis}) {
    return ProductDisplayComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ProductDisplayComponentLoaded { value: $value }';
}
