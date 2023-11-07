/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'order_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OrderFormState extends Equatable {
  const OrderFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class OrderFormUninitialized extends OrderFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''OrderFormState()''';
  }
}

// OrderModel has been initialised and hence OrderModel is available
class OrderFormInitialized extends OrderFormState {
  final OrderModel? value;

  @override
  List<Object?> get props => [value];

  const OrderFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class OrderFormError extends OrderFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const OrderFormError({this.message, super.value});

  @override
  String toString() {
    return '''OrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDOrderFormError extends OrderFormError {
  const DocumentIDOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdOrderFormError extends OrderFormError {
  const AppIdOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CustomerOrderFormError extends OrderFormError {
  const CustomerOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CustomerOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameOrderFormError extends OrderFormError {
  const NameOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class EmailOrderFormError extends OrderFormError {
  const EmailOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''EmailOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipStreet1OrderFormError extends OrderFormError {
  const ShipStreet1OrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipStreet1OrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipStreet2OrderFormError extends OrderFormError {
  const ShipStreet2OrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipStreet2OrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipCityOrderFormError extends OrderFormError {
  const ShipCityOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipCityOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipStateOrderFormError extends OrderFormError {
  const ShipStateOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipStateOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostcodeOrderFormError extends OrderFormError {
  const PostcodeOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PostcodeOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CountryOrderFormError extends OrderFormError {
  const CountryOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CountryOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceSameOrderFormError extends OrderFormError {
  const InvoiceSameOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceSameOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceStreet1OrderFormError extends OrderFormError {
  const InvoiceStreet1OrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceStreet1OrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceStreet2OrderFormError extends OrderFormError {
  const InvoiceStreet2OrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceStreet2OrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceCityOrderFormError extends OrderFormError {
  const InvoiceCityOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceCityOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceStateOrderFormError extends OrderFormError {
  const InvoiceStateOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceStateOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoicePostcodeOrderFormError extends OrderFormError {
  const InvoicePostcodeOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoicePostcodeOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class InvoiceCountryOrderFormError extends OrderFormError {
  const InvoiceCountryOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''InvoiceCountryOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ProductsOrderFormError extends OrderFormError {
  const ProductsOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ProductsOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TotalPriceOrderFormError extends OrderFormError {
  const TotalPriceOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TotalPriceOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CurrencyOrderFormError extends OrderFormError {
  const CurrencyOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CurrencyOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PaymentReferenceOrderFormError extends OrderFormError {
  const PaymentReferenceOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PaymentReferenceOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipmentReferenceOrderFormError extends OrderFormError {
  const ShipmentReferenceOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipmentReferenceOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DeliveryReferenceOrderFormError extends OrderFormError {
  const DeliveryReferenceOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DeliveryReferenceOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PaymentNoteOrderFormError extends OrderFormError {
  const PaymentNoteOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PaymentNoteOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ShipmentNoteOrderFormError extends OrderFormError {
  const ShipmentNoteOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ShipmentNoteOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DeliveryNoteOrderFormError extends OrderFormError {
  const DeliveryNoteOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DeliveryNoteOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class StatusOrderFormError extends OrderFormError {
  const StatusOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''StatusOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TimeStampOrderFormError extends OrderFormError {
  const TimeStampOrderFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TimeStampOrderFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class OrderFormLoaded extends OrderFormInitialized {
  const OrderFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''OrderFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableOrderForm extends OrderFormInitialized {
  const SubmittableOrderForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableOrderForm {
      value: $value,
    }''';
  }
}
