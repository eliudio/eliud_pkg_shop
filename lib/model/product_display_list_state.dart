/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';

abstract class ProductDisplayListState extends Equatable {
  const ProductDisplayListState();

  @override
  List<Object> get props => [];
}

class ProductDisplayListLoading extends ProductDisplayListState {}

class ProductDisplayListLoaded extends ProductDisplayListState {
  final List<ProductDisplayModel> values;

  const ProductDisplayListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'ProductDisplayListLoaded { values: $values }';
}

class ProductDisplayNotLoaded extends ProductDisplayListState {}
