/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'pay_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_model/shared/action_model.dart';
import 'shop_model.dart';

@immutable
abstract class PayFormEvent extends Equatable {
  const PayFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewPayFormEvent extends PayFormEvent {
}


class InitialisePayFormEvent extends PayFormEvent {
  final PayModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePayFormEvent({this.value});
}

class InitialisePayFormNoLoadEvent extends PayFormEvent {
  final PayModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePayFormNoLoadEvent({this.value});
}

class ChangedPayDocumentID extends PayFormEvent {
  final String value;

  ChangedPayDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPayDocumentID{ value: $value }';
}

class ChangedPayAppId extends PayFormEvent {
  final String value;

  ChangedPayAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPayAppId{ value: $value }';
}

class ChangedPayTitle extends PayFormEvent {
  final String value;

  ChangedPayTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPayTitle{ value: $value }';
}

class ChangedPaySucceeded extends PayFormEvent {
  final ActionModel value;

  ChangedPaySucceeded({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPaySucceeded{ value: $value }';
}

class ChangedPayShop extends PayFormEvent {
  final String value;

  ChangedPayShop({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPayShop{ value: $value }';
}

