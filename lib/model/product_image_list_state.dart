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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_image_model.dart';

abstract class ProductImageListState extends Equatable {
  const ProductImageListState();

  @override
  List<Object?> get props => [];
}

class ProductImageListLoading extends ProductImageListState {}

class ProductImageListLoaded extends ProductImageListState {
  final List<ProductImageModel?>? values;
  final bool? mightHaveMore;

  const ProductImageListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'ProductImageListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is ProductImageListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class ProductImageNotLoaded extends ProductImageListState {}

