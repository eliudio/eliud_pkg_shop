/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'member_cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'cart_item_model.dart';

@immutable
abstract class MemberCartFormEvent extends Equatable {
  const MemberCartFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewMemberCartFormEvent extends MemberCartFormEvent {
}


class InitialiseMemberCartFormEvent extends MemberCartFormEvent {
  final MemberCartModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberCartFormEvent({this.value});
}

class InitialiseMemberCartFormNoLoadEvent extends MemberCartFormEvent {
  final MemberCartModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseMemberCartFormNoLoadEvent({this.value});
}

class ChangedMemberCartDocumentID extends MemberCartFormEvent {
  final String value;

  ChangedMemberCartDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberCartDocumentID{ value: $value }';
}

class ChangedMemberCartItems extends MemberCartFormEvent {
  final List<CartItemModel> value;

  ChangedMemberCartItems({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedMemberCartItems{ value: $value }';
}

