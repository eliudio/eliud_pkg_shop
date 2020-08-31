/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


@immutable
abstract class CartFormEvent extends Equatable {
  const CartFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewCartFormEvent extends CartFormEvent {
}


class InitialiseCartFormEvent extends CartFormEvent {
  final CartModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseCartFormEvent({this.value});
}

class InitialiseCartFormNoLoadEvent extends CartFormEvent {
  final CartModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseCartFormNoLoadEvent({this.value});
}

class ChangedCartDocumentID extends CartFormEvent {
  final String value;

  ChangedCartDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartDocumentID{ value: $value }';
}

class ChangedCartAppId extends CartFormEvent {
  final String value;

  ChangedCartAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartAppId{ value: $value }';
}

class ChangedCartTitle extends CartFormEvent {
  final String value;

  ChangedCartTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartTitle{ value: $value }';
}

class ChangedCartDescription extends CartFormEvent {
  final String value;

  ChangedCartDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartDescription{ value: $value }';
}

class ChangedCartCheckoutText extends CartFormEvent {
  final String value;

  ChangedCartCheckoutText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartCheckoutText{ value: $value }';
}

class ChangedCartShop extends CartFormEvent {
  final String value;

  ChangedCartShop({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartShop{ value: $value }';
}

class ChangedCartItemImageBackground extends CartFormEvent {
  final String value;

  ChangedCartItemImageBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemImageBackground{ value: $value }';
}

class ChangedCartItemDetailBackground extends CartFormEvent {
  final String value;

  ChangedCartItemDetailBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemDetailBackground{ value: $value }';
}

class ChangedCartCheckoutAction extends CartFormEvent {
  final ActionModel value;

  ChangedCartCheckoutAction({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartCheckoutAction{ value: $value }';
}

class ChangedCartBackToShopAction extends CartFormEvent {
  final ActionModel value;

  ChangedCartBackToShopAction({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartBackToShopAction{ value: $value }';
}

