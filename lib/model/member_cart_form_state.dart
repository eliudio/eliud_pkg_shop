/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'member_cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MemberCartFormState extends Equatable {
  const MemberCartFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MemberCartFormUninitialized extends MemberCartFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''MemberCartFormState()''';
  }
}

// MemberCartModel has been initialised and hence MemberCartModel is available
class MemberCartFormInitialized extends MemberCartFormState {
  final MemberCartModel value;

  @override
  List<Object> get props => [ value ];

  const MemberCartFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class MemberCartFormError extends MemberCartFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const MemberCartFormError({this.message, MemberCartModel value }) : super(value: value);

  @override
  String toString() {
    return '''MemberCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDMemberCartFormError extends MemberCartFormError { 
  const DocumentIDMemberCartFormError({ String message, MemberCartModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDMemberCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ItemsMemberCartFormError extends MemberCartFormError { 
  const ItemsMemberCartFormError({ String message, MemberCartModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ItemsMemberCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MemberCartFormLoaded extends MemberCartFormInitialized { 
  const MemberCartFormLoaded({ MemberCartModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''MemberCartFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableMemberCartForm extends MemberCartFormInitialized { 
  const SubmittableMemberCartForm({ MemberCartModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableMemberCartForm {
      value: $value,
    }''';
  }
}


