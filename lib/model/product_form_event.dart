/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';


@immutable
abstract class ProductFormEvent extends Equatable {
  const ProductFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewProductFormEvent extends ProductFormEvent {
}


class InitialiseProductFormEvent extends ProductFormEvent {
  final ProductModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseProductFormEvent({this.value});
}

class InitialiseProductFormNoLoadEvent extends ProductFormEvent {
  final ProductModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseProductFormNoLoadEvent({this.value});
}

class ChangedProductDocumentID extends ProductFormEvent {
  final String? value;

  ChangedProductDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDocumentID{ value: $value }';
}

class ChangedProductAppId extends ProductFormEvent {
  final String? value;

  ChangedProductAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductAppId{ value: $value }';
}

class ChangedProductTitle extends ProductFormEvent {
  final String? value;

  ChangedProductTitle({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductTitle{ value: $value }';
}

class ChangedProductAbout extends ProductFormEvent {
  final String? value;

  ChangedProductAbout({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductAbout{ value: $value }';
}

class ChangedProductPrice extends ProductFormEvent {
  final String? value;

  ChangedProductPrice({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductPrice{ value: $value }';
}

class ChangedProductWeight extends ProductFormEvent {
  final String? value;

  ChangedProductWeight({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductWeight{ value: $value }';
}

class ChangedProductShop extends ProductFormEvent {
  final String? value;

  ChangedProductShop({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductShop{ value: $value }';
}

class ChangedProductImages extends ProductFormEvent {
  final List<ProductImageModel>? value;

  ChangedProductImages({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductImages{ value: $value }';
}

class ChangedProductPosSize extends ProductFormEvent {
  final PosSizeModel? value;

  ChangedProductPosSize({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductPosSize{ value: $value }';
}

