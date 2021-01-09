/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'pay_confirmation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PayConfirmationFormState extends Equatable {
  const PayConfirmationFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PayConfirmationFormUninitialized extends PayConfirmationFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''PayConfirmationFormState()''';
  }
}

// PayConfirmationModel has been initialised and hence PayConfirmationModel is available
class PayConfirmationFormInitialized extends PayConfirmationFormState {
  final PayConfirmationModel value;

  @override
  List<Object> get props => [ value ];

  const PayConfirmationFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class PayConfirmationFormError extends PayConfirmationFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const PayConfirmationFormError({this.message, PayConfirmationModel value }) : super(value: value);

  @override
  String toString() {
    return '''PayConfirmationFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDPayConfirmationFormError extends PayConfirmationFormError { 
  const DocumentIDPayConfirmationFormError({ String message, PayConfirmationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDPayConfirmationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdPayConfirmationFormError extends PayConfirmationFormError { 
  const AppIdPayConfirmationFormError({ String message, PayConfirmationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdPayConfirmationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitlePayConfirmationFormError extends PayConfirmationFormError { 
  const TitlePayConfirmationFormError({ String message, PayConfirmationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TitlePayConfirmationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ShopPayConfirmationFormError extends PayConfirmationFormError { 
  const ShopPayConfirmationFormError({ String message, PayConfirmationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ShopPayConfirmationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BackToShopActionPayConfirmationFormError extends PayConfirmationFormError { 
  const BackToShopActionPayConfirmationFormError({ String message, PayConfirmationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''BackToShopActionPayConfirmationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ConditionsPayConfirmationFormError extends PayConfirmationFormError { 
  const ConditionsPayConfirmationFormError({ String message, PayConfirmationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ConditionsPayConfirmationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class PayConfirmationFormLoaded extends PayConfirmationFormInitialized { 
  const PayConfirmationFormLoaded({ PayConfirmationModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''PayConfirmationFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittablePayConfirmationForm extends PayConfirmationFormInitialized { 
  const SubmittablePayConfirmationForm({ PayConfirmationModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittablePayConfirmationForm {
      value: $value,
    }''';
  }
}


