/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';


@immutable
abstract class ProductDisplayFormEvent extends Equatable {
  const ProductDisplayFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewProductDisplayFormEvent extends ProductDisplayFormEvent {
}


class InitialiseProductDisplayFormEvent extends ProductDisplayFormEvent {
  final ProductDisplayModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseProductDisplayFormEvent({this.value});
}

class InitialiseProductDisplayFormNoLoadEvent extends ProductDisplayFormEvent {
  final ProductDisplayModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseProductDisplayFormNoLoadEvent({this.value});
}

class ChangedProductDisplayDocumentID extends ProductDisplayFormEvent {
  final String? value;

  ChangedProductDisplayDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayDocumentID{ value: $value }';
}

class ChangedProductDisplayAppId extends ProductDisplayFormEvent {
  final String? value;

  ChangedProductDisplayAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayAppId{ value: $value }';
}

class ChangedProductDisplayDescription extends ProductDisplayFormEvent {
  final String? value;

  ChangedProductDisplayDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayDescription{ value: $value }';
}

class ChangedProductDisplayItemDetailBackground extends ProductDisplayFormEvent {
  final BackgroundModel? value;

  ChangedProductDisplayItemDetailBackground({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayItemDetailBackground{ value: $value }';
}

class ChangedProductDisplayAddToBasketText extends ProductDisplayFormEvent {
  final String? value;

  ChangedProductDisplayAddToBasketText({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayAddToBasketText{ value: $value }';
}

class ChangedProductDisplayBuyAction extends ProductDisplayFormEvent {
  final ActionModel? value;

  ChangedProductDisplayBuyAction({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayBuyAction{ value: $value }';
}

class ChangedProductDisplayShop extends ProductDisplayFormEvent {
  final String? value;

  ChangedProductDisplayShop({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayShop{ value: $value }';
}

class ChangedProductDisplayBackground extends ProductDisplayFormEvent {
  final BackgroundModel? value;

  ChangedProductDisplayBackground({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayBackground{ value: $value }';
}

class ChangedProductDisplayConditions extends ProductDisplayFormEvent {
  final StorageConditionsModel? value;

  ChangedProductDisplayConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayConditions{ value: $value }';
}

