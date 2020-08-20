/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'order_overview_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OrderOverviewFormState extends Equatable {
  const OrderOverviewFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class OrderOverviewFormUninitialized extends OrderOverviewFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''OrderOverviewFormState()''';
  }
}

// OrderOverviewModel has been initialised and hence OrderOverviewModel is available
class OrderOverviewFormInitialized extends OrderOverviewFormState {
  final OrderOverviewModel value;

  @override
  List<Object> get props => [ value ];

  const OrderOverviewFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class OrderOverviewFormError extends OrderOverviewFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const OrderOverviewFormError({this.message, OrderOverviewModel value }) : super(value: value);

  @override
  String toString() {
    return '''OrderOverviewFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDOrderOverviewFormError extends OrderOverviewFormError { 
  const DocumentIDOrderOverviewFormError({ String message, OrderOverviewModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDOrderOverviewFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdOrderOverviewFormError extends OrderOverviewFormError { 
  const AppIdOrderOverviewFormError({ String message, OrderOverviewModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdOrderOverviewFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TitleOrderOverviewFormError extends OrderOverviewFormError { 
  const TitleOrderOverviewFormError({ String message, OrderOverviewModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TitleOrderOverviewFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ShopOrderOverviewFormError extends OrderOverviewFormError { 
  const ShopOrderOverviewFormError({ String message, OrderOverviewModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ShopOrderOverviewFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ItemImageBackgroundOrderOverviewFormError extends OrderOverviewFormError { 
  const ItemImageBackgroundOrderOverviewFormError({ String message, OrderOverviewModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ItemImageBackgroundOrderOverviewFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ItemDetailBackgroundOrderOverviewFormError extends OrderOverviewFormError { 
  const ItemDetailBackgroundOrderOverviewFormError({ String message, OrderOverviewModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ItemDetailBackgroundOrderOverviewFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class OrderOverviewFormLoaded extends OrderOverviewFormInitialized { 
  const OrderOverviewFormLoaded({ OrderOverviewModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''OrderOverviewFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableOrderOverviewForm extends OrderOverviewFormInitialized { 
  const SubmittableOrderOverviewForm({ OrderOverviewModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableOrderOverviewForm {
      value: $value,
    }''';
  }
}


