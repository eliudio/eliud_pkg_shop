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
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';


@immutable
abstract class PayConfirmationFormEvent extends Equatable {
  const PayConfirmationFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewPayConfirmationFormEvent extends PayConfirmationFormEvent {
}


class InitialisePayConfirmationFormEvent extends PayConfirmationFormEvent {
  final PayConfirmationModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePayConfirmationFormEvent({this.value});
}

class InitialisePayConfirmationFormNoLoadEvent extends PayConfirmationFormEvent {
  final PayConfirmationModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePayConfirmationFormNoLoadEvent({this.value});
}

class ChangedPayConfirmationDocumentID extends PayConfirmationFormEvent {
  final String? value;

  ChangedPayConfirmationDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationDocumentID{ value: $value }';
}

class ChangedPayConfirmationAppId extends PayConfirmationFormEvent {
  final String? value;

  ChangedPayConfirmationAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationAppId{ value: $value }';
}

class ChangedPayConfirmationDescription extends PayConfirmationFormEvent {
  final String? value;

  ChangedPayConfirmationDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationDescription{ value: $value }';
}

class ChangedPayConfirmationShop extends PayConfirmationFormEvent {
  final String? value;

  ChangedPayConfirmationShop({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationShop{ value: $value }';
}

class ChangedPayConfirmationBackToShopAction extends PayConfirmationFormEvent {
  final ActionModel? value;

  ChangedPayConfirmationBackToShopAction({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationBackToShopAction{ value: $value }';
}

class ChangedPayConfirmationConditions extends PayConfirmationFormEvent {
  final StorageConditionsModel? value;

  ChangedPayConfirmationConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPayConfirmationConditions{ value: $value }';
}

