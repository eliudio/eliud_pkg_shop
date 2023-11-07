/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'order_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OrderItemFormState extends Equatable {
  const OrderItemFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class OrderItemFormUninitialized extends OrderItemFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''OrderItemFormState()''';
  }
}

// OrderItemModel has been initialised and hence OrderItemModel is available
class OrderItemFormInitialized extends OrderItemFormState {
  final OrderItemModel? value;

  @override
  List<Object?> get props => [value];

  const OrderItemFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class OrderItemFormError extends OrderItemFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const OrderItemFormError({this.message, super.value});

  @override
  String toString() {
    return '''OrderItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDOrderItemFormError extends OrderItemFormError {
  const DocumentIDOrderItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDOrderItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AmountOrderItemFormError extends OrderItemFormError {
  const AmountOrderItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AmountOrderItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdOrderItemFormError extends OrderItemFormError {
  const AppIdOrderItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdOrderItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SoldPriceOrderItemFormError extends OrderItemFormError {
  const SoldPriceOrderItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SoldPriceOrderItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ProductOrderItemFormError extends OrderItemFormError {
  const ProductOrderItemFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ProductOrderItemFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class OrderItemFormLoaded extends OrderItemFormInitialized {
  const OrderItemFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''OrderItemFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableOrderItemForm extends OrderItemFormInitialized {
  const SubmittableOrderItemForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableOrderItemForm {
      value: $value,
    }''';
  }
}
