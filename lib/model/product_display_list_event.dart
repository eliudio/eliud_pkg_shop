/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';

abstract class ProductDisplayListEvent extends Equatable {
  const ProductDisplayListEvent();
  @override
  List<Object?> get props => [];
}

class LoadProductDisplayList extends ProductDisplayListEvent {}

class NewPage extends ProductDisplayListEvent {}

class AddProductDisplayList extends ProductDisplayListEvent {
  final ProductDisplayModel? value;

  const AddProductDisplayList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddProductDisplayList{ value: $value }';
}

class UpdateProductDisplayList extends ProductDisplayListEvent {
  final ProductDisplayModel? value;

  const UpdateProductDisplayList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateProductDisplayList{ value: $value }';
}

class DeleteProductDisplayList extends ProductDisplayListEvent {
  final ProductDisplayModel? value;

  const DeleteProductDisplayList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteProductDisplayList{ value: $value }';
}

class ProductDisplayListUpdated extends ProductDisplayListEvent {
  final List<ProductDisplayModel?>? value;
  final bool? mightHaveMore;

  const ProductDisplayListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'ProductDisplayListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class ProductDisplayChangeQuery extends ProductDisplayListEvent {
  final EliudQuery? newQuery;

  const ProductDisplayChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'ProductDisplayChangeQuery{ value: $newQuery }';
}
