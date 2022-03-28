/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_image_model.dart';

abstract class ProductImageListEvent extends Equatable {
  const ProductImageListEvent();
  @override
  List<Object?> get props => [];
}

class LoadProductImageList extends ProductImageListEvent {}

class NewPage extends ProductImageListEvent {}

class AddProductImageList extends ProductImageListEvent {
  final ProductImageModel? value;

  const AddProductImageList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddProductImageList{ value: $value }';
}

class UpdateProductImageList extends ProductImageListEvent {
  final ProductImageModel? value;

  const UpdateProductImageList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateProductImageList{ value: $value }';
}

class DeleteProductImageList extends ProductImageListEvent {
  final ProductImageModel? value;

  const DeleteProductImageList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteProductImageList{ value: $value }';
}

class ProductImageListUpdated extends ProductImageListEvent {
  final List<ProductImageModel?>? value;
  final bool? mightHaveMore;

  const ProductImageListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'ProductImageListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class ProductImageChangeQuery extends ProductImageListEvent {
  final EliudQuery newQuery;

  const ProductImageChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'ProductImageChangeQuery{ value: $newQuery }';
}

