/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'product_display_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductDisplayFormState extends Equatable {
  const ProductDisplayFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ProductDisplayFormUninitialized extends ProductDisplayFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''ProductDisplayFormState()''';
  }
}

// ProductDisplayModel has been initialised and hence ProductDisplayModel is available
class ProductDisplayFormInitialized extends ProductDisplayFormState {
  final ProductDisplayModel value;

  @override
  List<Object> get props => [ value ];

  const ProductDisplayFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class ProductDisplayFormError extends ProductDisplayFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const ProductDisplayFormError({this.message, ProductDisplayModel value }) : super(value: value);

  @override
  String toString() {
    return '''ProductDisplayFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDProductDisplayFormError extends ProductDisplayFormError { 
  const DocumentIDProductDisplayFormError({ String message, ProductDisplayModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDProductDisplayFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdProductDisplayFormError extends ProductDisplayFormError { 
  const AppIdProductDisplayFormError({ String message, ProductDisplayModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdProductDisplayFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitleProductDisplayFormError extends ProductDisplayFormError { 
  const TitleProductDisplayFormError({ String message, ProductDisplayModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TitleProductDisplayFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ItemDetailBackgroundProductDisplayFormError extends ProductDisplayFormError { 
  const ItemDetailBackgroundProductDisplayFormError({ String message, ProductDisplayModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ItemDetailBackgroundProductDisplayFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AddToBasketTextProductDisplayFormError extends ProductDisplayFormError { 
  const AddToBasketTextProductDisplayFormError({ String message, ProductDisplayModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AddToBasketTextProductDisplayFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BuyActionProductDisplayFormError extends ProductDisplayFormError { 
  const BuyActionProductDisplayFormError({ String message, ProductDisplayModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''BuyActionProductDisplayFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ShopProductDisplayFormError extends ProductDisplayFormError { 
  const ShopProductDisplayFormError({ String message, ProductDisplayModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ShopProductDisplayFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ProductDisplayFormLoaded extends ProductDisplayFormInitialized { 
  const ProductDisplayFormLoaded({ ProductDisplayModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''ProductDisplayFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableProductDisplayForm extends ProductDisplayFormInitialized { 
  const SubmittableProductDisplayForm({ ProductDisplayModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableProductDisplayForm {
      value: $value,
    }''';
  }
}


