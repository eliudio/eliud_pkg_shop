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

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';

abstract class ProductDisplayListEvent extends Equatable {
  const ProductDisplayListEvent();
  @override
  List<Object> get props => [];
}

class LoadProductDisplayList extends ProductDisplayListEvent {
  final String orderBy;
  final bool descending;

  LoadProductDisplayList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadProductDisplayListWithDetails extends ProductDisplayListEvent {}

class AddProductDisplayList extends ProductDisplayListEvent {
  final ProductDisplayModel value;

  const AddProductDisplayList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddProductDisplayList{ value: $value }';
}

class UpdateProductDisplayList extends ProductDisplayListEvent {
  final ProductDisplayModel value;

  const UpdateProductDisplayList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateProductDisplayList{ value: $value }';
}

class DeleteProductDisplayList extends ProductDisplayListEvent {
  final ProductDisplayModel value;

  const DeleteProductDisplayList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteProductDisplayList{ value: $value }';
}

class ProductDisplayListUpdated extends ProductDisplayListEvent {
  final List<ProductDisplayModel> value;

  const ProductDisplayListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ProductDisplayListUpdated{ value: $value }';
}

