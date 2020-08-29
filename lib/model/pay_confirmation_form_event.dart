/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_form_event.dart
                       
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
abstract class PayConfirmationFormEvent extends Equatable {
  const PayConfirmationFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewPayConfirmationFormEvent extends PayConfirmationFormEvent {
}


class InitialisePayConfirmationFormEvent extends PayConfirmationFormEvent {
  final PayConfirmationModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePayConfirmationFormEvent({this.value});
}

class InitialisePayConfirmationFormNoLoadEvent extends PayConfirmationFormEvent {
  final PayConfirmationModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePayConfirmationFormNoLoadEvent({this.value});
}

class ChangedPayConfirmationDocumentID extends PayConfirmationFormEvent {
  final String value;

  ChangedPayConfirmationDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationDocumentID{ value: $value }';
}

class ChangedPayConfirmationAppId extends PayConfirmationFormEvent {
  final String value;

  ChangedPayConfirmationAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationAppId{ value: $value }';
}

class ChangedPayConfirmationTitle extends PayConfirmationFormEvent {
  final String value;

  ChangedPayConfirmationTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationTitle{ value: $value }';
}

class ChangedPayConfirmationShop extends PayConfirmationFormEvent {
  final String value;

  ChangedPayConfirmationShop({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationShop{ value: $value }';
}

class ChangedPayConfirmationBackToShopAction extends PayConfirmationFormEvent {
  final ActionModel value;

  ChangedPayConfirmationBackToShopAction({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationBackToShopAction{ value: $value }';
}

