/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'cart_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CartItemFormState extends Equatable {
  const CartItemFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class CartItemFormUninitialized extends CartItemFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''CartItemFormState()''';
  }
}

// CartItemModel has been initialised and hence CartItemModel is available
class CartItemFormInitialized extends CartItemFormState {
  final CartItemModel value;

  @override
  List<Object> get props => [ value ];

  const CartItemFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class CartItemFormError extends CartItemFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const CartItemFormError({this.message, CartItemModel value }) : super(value: value);

  @override
  String toString() {
    return '''CartItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDCartItemFormError extends CartItemFormError { 
  const DocumentIDCartItemFormError({ String message, CartItemModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDCartItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AmountCartItemFormError extends CartItemFormError { 
  const AmountCartItemFormError({ String message, CartItemModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AmountCartItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdCartItemFormError extends CartItemFormError { 
  const AppIdCartItemFormError({ String message, CartItemModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdCartItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ProductCartItemFormError extends CartItemFormError { 
  const ProductCartItemFormError({ String message, CartItemModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ProductCartItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class CartItemFormLoaded extends CartItemFormInitialized { 
  const CartItemFormLoaded({ CartItemModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''CartItemFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableCartItemForm extends CartItemFormInitialized { 
  const SubmittableCartItemForm({ CartItemModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableCartItemForm {
      value: $value,
    }''';
  }
}


