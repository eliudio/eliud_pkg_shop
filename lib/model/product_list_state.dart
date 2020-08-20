/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'product_model.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final List<ProductModel> values;

  const ProductListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'ProductListLoaded { values: $values }';
}

class ProductNotLoaded extends ProductListState {}

