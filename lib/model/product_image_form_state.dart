/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'product_image_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductImageFormState extends Equatable {
  const ProductImageFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ProductImageFormUninitialized extends ProductImageFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''ProductImageFormState()''';
  }
}

// ProductImageModel has been initialised and hence ProductImageModel is available
class ProductImageFormInitialized extends ProductImageFormState {
  final ProductImageModel? value;

  @override
  List<Object?> get props => [value];

  const ProductImageFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class ProductImageFormError extends ProductImageFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const ProductImageFormError({this.message, super.value});

  @override
  String toString() {
    return '''ProductImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDProductImageFormError extends ProductImageFormError {
  const DocumentIDProductImageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDProductImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ImageProductImageFormError extends ProductImageFormError {
  const ImageProductImageFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ImageProductImageFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ProductImageFormLoaded extends ProductImageFormInitialized {
  const ProductImageFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''ProductImageFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableProductImageForm extends ProductImageFormInitialized {
  const SubmittableProductImageForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableProductImageForm {
      value: $value,
    }''';
  }
}
