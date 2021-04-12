/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';

abstract class ProductComponentState extends Equatable {
  const ProductComponentState();

  @override
  List<Object?> get props => [];
}

class ProductComponentUninitialized extends ProductComponentState {}

class ProductComponentError extends ProductComponentState {
  final String? message;
  ProductComponentError({ this.message });
}

class ProductComponentPermissionDenied extends ProductComponentState {
  ProductComponentPermissionDenied();
}

class ProductComponentLoaded extends ProductComponentState {
  final ProductModel? value;

  const ProductComponentLoaded({ this.value });

  ProductComponentLoaded copyWith({ ProductModel? copyThis }) {
    return ProductComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ProductComponentLoaded { value: $value }';
}

