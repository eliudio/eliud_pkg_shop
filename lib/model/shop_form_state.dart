/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'shop_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShopFormState extends Equatable {
  const ShopFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ShopFormUninitialized extends ShopFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''ShopFormState()''';
  }
}

// ShopModel has been initialised and hence ShopModel is available
class ShopFormInitialized extends ShopFormState {
  final ShopModel? value;

  @override
  List<Object?> get props => [value];

  const ShopFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class ShopFormError extends ShopFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const ShopFormError({this.message, super.value});

  @override
  String toString() {
    return '''ShopFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDShopFormError extends ShopFormError {
  const DocumentIDShopFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDShopFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdShopFormError extends ShopFormError {
  const AppIdShopFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdShopFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionShopFormError extends ShopFormError {
  const DescriptionShopFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionShopFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShortDescriptionShopFormError extends ShopFormError {
  const ShortDescriptionShopFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShortDescriptionShopFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CurrencyShopFormError extends ShopFormError {
  const CurrencyShopFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CurrencyShopFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsShopFormError extends ShopFormError {
  const ConditionsShopFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsShopFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShopFormLoaded extends ShopFormInitialized {
  const ShopFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''ShopFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableShopForm extends ShopFormInitialized {
  const SubmittableShopForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableShopForm {
      value: $value,
    }''';
  }
}
