/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'pay_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PayFormState extends Equatable {
  const PayFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PayFormUninitialized extends PayFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PayFormState()''';
  }
}

// PayModel has been initialised and hence PayModel is available
class PayFormInitialized extends PayFormState {
  final PayModel? value;

  @override
  List<Object?> get props => [value];

  const PayFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class PayFormError extends PayFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const PayFormError({this.message, super.value});

  @override
  String toString() {
    return '''PayFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDPayFormError extends PayFormError {
  const DocumentIDPayFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDPayFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdPayFormError extends PayFormError {
  const AppIdPayFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdPayFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionPayFormError extends PayFormError {
  const DescriptionPayFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionPayFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SucceededPayFormError extends PayFormError {
  const SucceededPayFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SucceededPayFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PayActionPayFormError extends PayFormError {
  const PayActionPayFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PayActionPayFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShopPayFormError extends PayFormError {
  const ShopPayFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShopPayFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsPayFormError extends PayFormError {
  const ConditionsPayFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsPayFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PayFormLoaded extends PayFormInitialized {
  const PayFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''PayFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittablePayForm extends PayFormInitialized {
  const SubmittablePayForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittablePayForm {
      value: $value,
    }''';
  }
}
