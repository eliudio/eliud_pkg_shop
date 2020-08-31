/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_image_model.dart';

abstract class ProductImageListState extends Equatable {
  const ProductImageListState();

  @override
  List<Object> get props => [];
}

class ProductImageListLoading extends ProductImageListState {}

class ProductImageListLoaded extends ProductImageListState {
  final List<ProductImageModel> values;

  const ProductImageListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'ProductImageListLoaded { values: $values }';
}

class ProductImageNotLoaded extends ProductImageListState {}

