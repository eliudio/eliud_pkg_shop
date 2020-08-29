/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class ShopFormEvent extends Equatable {
  const ShopFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewShopFormEvent extends ShopFormEvent {
}


class InitialiseShopFormEvent extends ShopFormEvent {
  final ShopModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseShopFormEvent({this.value});
}

class InitialiseShopFormNoLoadEvent extends ShopFormEvent {
  final ShopModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseShopFormNoLoadEvent({this.value});
}

class ChangedShopDocumentID extends ShopFormEvent {
  final String value;

  ChangedShopDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShopDocumentID{ value: $value }';
}

class ChangedShopAppId extends ShopFormEvent {
  final String value;

  ChangedShopAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShopAppId{ value: $value }';
}

class ChangedShopDescription extends ShopFormEvent {
  final String value;

  ChangedShopDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShopDescription{ value: $value }';
}

class ChangedShopShortDescription extends ShopFormEvent {
  final String value;

  ChangedShopShortDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShopShortDescription{ value: $value }';
}

class ChangedShopCurrency extends ShopFormEvent {
  final String value;

  ChangedShopCurrency({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedShopCurrency{ value: $value }';
}

