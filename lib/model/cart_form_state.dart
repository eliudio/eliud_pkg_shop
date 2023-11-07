/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CartFormState extends Equatable {
  const CartFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class CartFormUninitialized extends CartFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''CartFormState()''';
  }
}

// CartModel has been initialised and hence CartModel is available
class CartFormInitialized extends CartFormState {
  final CartModel? value;

  @override
  List<Object?> get props => [value];

  const CartFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class CartFormError extends CartFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const CartFormError({this.message, super.value});

  @override
  String toString() {
    return '''CartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDCartFormError extends CartFormError {
  const DocumentIDCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdCartFormError extends CartFormError {
  const AppIdCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TitleCartFormError extends CartFormError {
  const TitleCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TitleCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionCartFormError extends CartFormError {
  const DescriptionCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CheckoutTextCartFormError extends CartFormError {
  const CheckoutTextCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CheckoutTextCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShopCartFormError extends CartFormError {
  const ShopCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShopCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ItemImageBackgroundCartFormError extends CartFormError {
  const ItemImageBackgroundCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ItemImageBackgroundCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ItemDetailBackgroundCartFormError extends CartFormError {
  const ItemDetailBackgroundCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ItemDetailBackgroundCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CheckoutActionCartFormError extends CartFormError {
  const CheckoutActionCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CheckoutActionCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BackToShopActionCartFormError extends CartFormError {
  const BackToShopActionCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BackToShopActionCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class OpenProductActionCartFormError extends CartFormError {
  const OpenProductActionCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''OpenProductActionCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsCartFormError extends CartFormError {
  const ConditionsCartFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsCartFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CartFormLoaded extends CartFormInitialized {
  const CartFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''CartFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableCartForm extends CartFormInitialized {
  const SubmittableCartForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableCartForm {
      value: $value,
    }''';
  }
}
