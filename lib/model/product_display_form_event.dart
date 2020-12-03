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
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


@immutable
abstract class ProductDisplayFormEvent extends Equatable {
  const ProductDisplayFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewProductDisplayFormEvent extends ProductDisplayFormEvent {
}


class InitialiseProductDisplayFormEvent extends ProductDisplayFormEvent {
  final ProductDisplayModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseProductDisplayFormEvent({this.value});
}

class InitialiseProductDisplayFormNoLoadEvent extends ProductDisplayFormEvent {
  final ProductDisplayModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseProductDisplayFormNoLoadEvent({this.value});
}

class ChangedProductDisplayDocumentID extends ProductDisplayFormEvent {
  final String value;

  ChangedProductDisplayDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayDocumentID{ value: $value }';
}

class ChangedProductDisplayAppId extends ProductDisplayFormEvent {
  final String value;

  ChangedProductDisplayAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayAppId{ value: $value }';
}

class ChangedProductDisplayTitle extends ProductDisplayFormEvent {
  final String value;

  ChangedProductDisplayTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayTitle{ value: $value }';
}

class ChangedProductDisplayItemDetailBackground extends ProductDisplayFormEvent {
  final String value;

  ChangedProductDisplayItemDetailBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayItemDetailBackground{ value: $value }';
}

class ChangedProductDisplayAddToBasketText extends ProductDisplayFormEvent {
  final String value;

  ChangedProductDisplayAddToBasketText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayAddToBasketText{ value: $value }';
}

class ChangedProductDisplayBuyAction extends ProductDisplayFormEvent {
  final ActionModel value;

  ChangedProductDisplayBuyAction({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayBuyAction{ value: $value }';
}

class ChangedProductDisplayShop extends ProductDisplayFormEvent {
  final String value;

  ChangedProductDisplayShop({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedProductDisplayShop{ value: $value }';
}

