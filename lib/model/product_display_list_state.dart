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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';

abstract class ProductDisplayListState extends Equatable {
  const ProductDisplayListState();

  @override
  List<Object?> get props => [];
}

class ProductDisplayListLoading extends ProductDisplayListState {}

class ProductDisplayListLoaded extends ProductDisplayListState {
  final List<ProductDisplayModel?>? values;
  final bool? mightHaveMore;

  const ProductDisplayListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'ProductDisplayListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is ProductDisplayListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class ProductDisplayNotLoaded extends ProductDisplayListState {}
