/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


@immutable
abstract class CartItemFormEvent extends Equatable {
  const CartItemFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewCartItemFormEvent extends CartItemFormEvent {
}


class InitialiseCartItemFormEvent extends CartItemFormEvent {
  final CartItemModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseCartItemFormEvent({this.value});
}

class InitialiseCartItemFormNoLoadEvent extends CartItemFormEvent {
  final CartItemModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseCartItemFormNoLoadEvent({this.value});
}

class ChangedCartItemDocumentID extends CartItemFormEvent {
  final String value;

  ChangedCartItemDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemDocumentID{ value: $value }';
}

class ChangedCartItemAmount extends CartItemFormEvent {
  final String value;

  ChangedCartItemAmount({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemAmount{ value: $value }';
}

class ChangedCartItemAppId extends CartItemFormEvent {
  final String value;

  ChangedCartItemAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemAppId{ value: $value }';
}

class ChangedCartItemProduct extends CartItemFormEvent {
  final String value;

  ChangedCartItemProduct({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemProduct{ value: $value }';
}

