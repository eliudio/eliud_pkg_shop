/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'shop_front_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShopFrontFormState extends Equatable {
  const ShopFrontFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ShopFrontFormUninitialized extends ShopFrontFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''ShopFrontFormState()''';
  }
}

// ShopFrontModel has been initialised and hence ShopFrontModel is available
class ShopFrontFormInitialized extends ShopFrontFormState {
  final ShopFrontModel? value;

  @override
  List<Object?> get props => [value];

  const ShopFrontFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class ShopFrontFormError extends ShopFrontFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const ShopFrontFormError({this.message, super.value});

  @override
  String toString() {
    return '''ShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDShopFrontFormError extends ShopFrontFormError {
  const DocumentIDShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdShopFrontFormError extends ShopFrontFormError {
  const AppIdShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TitleShopFrontFormError extends ShopFrontFormError {
  const TitleShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TitleShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionShopFrontFormError extends ShopFrontFormError {
  const DescriptionShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShopShopFrontFormError extends ShopFrontFormError {
  const ShopShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShopShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SizeShopFrontFormError extends ShopFrontFormError {
  const SizeShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SizeShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CardElevationShopFrontFormError extends ShopFrontFormError {
  const CardElevationShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CardElevationShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CardAxisSpacingShopFrontFormError extends ShopFrontFormError {
  const CardAxisSpacingShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CardAxisSpacingShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ItemCardBackgroundShopFrontFormError extends ShopFrontFormError {
  const ItemCardBackgroundShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ItemCardBackgroundShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AddToCartColorShopFrontFormError extends ShopFrontFormError {
  const AddToCartColorShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AddToCartColorShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ScrollDirectionShopFrontFormError extends ShopFrontFormError {
  const ScrollDirectionShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ScrollDirectionShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BuyActionShopFrontFormError extends ShopFrontFormError {
  const BuyActionShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BuyActionShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class OpenProductActionShopFrontFormError extends ShopFrontFormError {
  const OpenProductActionShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''OpenProductActionShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PaddingShopFrontFormError extends ShopFrontFormError {
  const PaddingShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PaddingShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsShopFrontFormError extends ShopFrontFormError {
  const ConditionsShopFrontFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShopFrontFormLoaded extends ShopFrontFormInitialized {
  const ShopFrontFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''ShopFrontFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableShopFrontForm extends ShopFrontFormInitialized {
  const SubmittableShopFrontForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableShopFrontForm {
      value: $value,
    }''';
  }
}
