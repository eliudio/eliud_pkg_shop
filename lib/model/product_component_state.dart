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
import 'product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductUninitialized extends ProductState {}

class ProductError extends ProductState {
  final String message;
  ProductError({ this.message });
}

class ProductLoaded extends ProductState {
  final ProductModel value;

  const ProductLoaded({ this.value });

  ProductLoaded copyWith({ ProductModel copyThis }) {
    return ProductLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'ProductModelLoaded { value: $value }';
}


