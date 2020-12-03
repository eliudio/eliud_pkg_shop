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
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ShopFrontFormUninitialized extends ShopFrontFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''ShopFrontFormState()''';
  }
}

// ShopFrontModel has been initialised and hence ShopFrontModel is available
class ShopFrontFormInitialized extends ShopFrontFormState {
  final ShopFrontModel value;

  @override
  List<Object> get props => [ value ];

  const ShopFrontFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class ShopFrontFormError extends ShopFrontFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const ShopFrontFormError({this.message, ShopFrontModel value }) : super(value: value);

  @override
  String toString() {
    return '''ShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDShopFrontFormError extends ShopFrontFormError { 
  const DocumentIDShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdShopFrontFormError extends ShopFrontFormError { 
  const AppIdShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitleShopFrontFormError extends ShopFrontFormError { 
  const TitleShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TitleShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionShopFrontFormError extends ShopFrontFormError { 
  const DescriptionShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ShopShopFrontFormError extends ShopFrontFormError { 
  const ShopShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ShopShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class SizeShopFrontFormError extends ShopFrontFormError { 
  const SizeShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''SizeShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class CardElevationShopFrontFormError extends ShopFrontFormError { 
  const CardElevationShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''CardElevationShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class CardAxisSpacingShopFrontFormError extends ShopFrontFormError { 
  const CardAxisSpacingShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''CardAxisSpacingShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ItemCardBackgroundShopFrontFormError extends ShopFrontFormError { 
  const ItemCardBackgroundShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ItemCardBackgroundShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AddToCartColorShopFrontFormError extends ShopFrontFormError { 
  const AddToCartColorShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AddToCartColorShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ViewShopFrontFormError extends ShopFrontFormError { 
  const ViewShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ViewShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ScrollDirectionShopFrontFormError extends ShopFrontFormError { 
  const ScrollDirectionShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ScrollDirectionShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class BuyActionShopFrontFormError extends ShopFrontFormError { 
  const BuyActionShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''BuyActionShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class OpenProductActionShopFrontFormError extends ShopFrontFormError { 
  const OpenProductActionShopFrontFormError({ String message, ShopFrontModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''OpenProductActionShopFrontFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ShopFrontFormLoaded extends ShopFrontFormInitialized { 
  const ShopFrontFormLoaded({ ShopFrontModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''ShopFrontFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableShopFrontForm extends ShopFrontFormInitialized { 
  const SubmittableShopFrontForm({ ShopFrontModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableShopFrontForm {
      value: $value,
    }''';
  }
}


