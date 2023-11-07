/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductFormState extends Equatable {
  const ProductFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ProductFormUninitialized extends ProductFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''ProductFormState()''';
  }
}

// ProductModel has been initialised and hence ProductModel is available
class ProductFormInitialized extends ProductFormState {
  final ProductModel? value;

  @override
  List<Object?> get props => [value];

  const ProductFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class ProductFormError extends ProductFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const ProductFormError({this.message, super.value});

  @override
  String toString() {
    return '''ProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDProductFormError extends ProductFormError {
  const DocumentIDProductFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdProductFormError extends ProductFormError {
  const AppIdProductFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TitleProductFormError extends ProductFormError {
  const TitleProductFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TitleProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AboutProductFormError extends ProductFormError {
  const AboutProductFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AboutProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PriceProductFormError extends ProductFormError {
  const PriceProductFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PriceProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class WeightProductFormError extends ProductFormError {
  const WeightProductFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''WeightProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShopProductFormError extends ProductFormError {
  const ShopProductFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShopProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImagesProductFormError extends ProductFormError {
  const ImagesProductFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImagesProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PosSizeProductFormError extends ProductFormError {
  const PosSizeProductFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PosSizeProductFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ProductFormLoaded extends ProductFormInitialized {
  const ProductFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''ProductFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableProductForm extends ProductFormInitialized {
  const SubmittableProductForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableProductForm {
      value: $value,
    }''';
  }
}
