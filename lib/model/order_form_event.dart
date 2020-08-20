/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'order_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'member_model.dart';
import 'country_model.dart';
import 'country_model.dart';
import 'order_item_model.dart';

@immutable
abstract class OrderFormEvent extends Equatable {
  const OrderFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewOrderFormEvent extends OrderFormEvent {
}


class InitialiseOrderFormEvent extends OrderFormEvent {
  final OrderModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseOrderFormEvent({this.value});
}

class InitialiseOrderFormNoLoadEvent extends OrderFormEvent {
  final OrderModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseOrderFormNoLoadEvent({this.value});
}

class ChangedOrderDocumentID extends OrderFormEvent {
  final String value;

  ChangedOrderDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderDocumentID{ value: $value }';
}

class ChangedOrderAppId extends OrderFormEvent {
  final String value;

  ChangedOrderAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderAppId{ value: $value }';
}

class ChangedOrderCustomer extends OrderFormEvent {
  final String value;

  ChangedOrderCustomer({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderCustomer{ value: $value }';
}

class ChangedOrderName extends OrderFormEvent {
  final String value;

  ChangedOrderName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderName{ value: $value }';
}

class ChangedOrderEmail extends OrderFormEvent {
  final String value;

  ChangedOrderEmail({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderEmail{ value: $value }';
}

class ChangedOrderShipStreet1 extends OrderFormEvent {
  final String value;

  ChangedOrderShipStreet1({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderShipStreet1{ value: $value }';
}

class ChangedOrderShipStreet2 extends OrderFormEvent {
  final String value;

  ChangedOrderShipStreet2({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderShipStreet2{ value: $value }';
}

class ChangedOrderShipCity extends OrderFormEvent {
  final String value;

  ChangedOrderShipCity({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderShipCity{ value: $value }';
}

class ChangedOrderShipState extends OrderFormEvent {
  final String value;

  ChangedOrderShipState({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderShipState{ value: $value }';
}

class ChangedOrderPostcode extends OrderFormEvent {
  final String value;

  ChangedOrderPostcode({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderPostcode{ value: $value }';
}

class ChangedOrderCountry extends OrderFormEvent {
  final String value;

  ChangedOrderCountry({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderCountry{ value: $value }';
}

class ChangedOrderInvoiceSame extends OrderFormEvent {
  final bool value;

  ChangedOrderInvoiceSame({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderInvoiceSame{ value: $value }';
}

class ChangedOrderInvoiceStreet1 extends OrderFormEvent {
  final String value;

  ChangedOrderInvoiceStreet1({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderInvoiceStreet1{ value: $value }';
}

class ChangedOrderInvoiceStreet2 extends OrderFormEvent {
  final String value;

  ChangedOrderInvoiceStreet2({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderInvoiceStreet2{ value: $value }';
}

class ChangedOrderInvoiceCity extends OrderFormEvent {
  final String value;

  ChangedOrderInvoiceCity({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderInvoiceCity{ value: $value }';
}

class ChangedOrderInvoiceState extends OrderFormEvent {
  final String value;

  ChangedOrderInvoiceState({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderInvoiceState{ value: $value }';
}

class ChangedOrderInvoicePostcode extends OrderFormEvent {
  final String value;

  ChangedOrderInvoicePostcode({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderInvoicePostcode{ value: $value }';
}

class ChangedOrderInvoiceCountry extends OrderFormEvent {
  final String value;

  ChangedOrderInvoiceCountry({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderInvoiceCountry{ value: $value }';
}

class ChangedOrderProducts extends OrderFormEvent {
  final List<OrderItemModel> value;

  ChangedOrderProducts({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderProducts{ value: $value }';
}

class ChangedOrderTotalPrice extends OrderFormEvent {
  final String value;

  ChangedOrderTotalPrice({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderTotalPrice{ value: $value }';
}

class ChangedOrderCurrency extends OrderFormEvent {
  final String value;

  ChangedOrderCurrency({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderCurrency{ value: $value }';
}

class ChangedOrderPaymentReference extends OrderFormEvent {
  final String value;

  ChangedOrderPaymentReference({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderPaymentReference{ value: $value }';
}

class ChangedOrderShipmentReference extends OrderFormEvent {
  final String value;

  ChangedOrderShipmentReference({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderShipmentReference{ value: $value }';
}

class ChangedOrderDeliveryReference extends OrderFormEvent {
  final String value;

  ChangedOrderDeliveryReference({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderDeliveryReference{ value: $value }';
}

class ChangedOrderPaymentNote extends OrderFormEvent {
  final String value;

  ChangedOrderPaymentNote({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderPaymentNote{ value: $value }';
}

class ChangedOrderShipmentNote extends OrderFormEvent {
  final String value;

  ChangedOrderShipmentNote({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderShipmentNote{ value: $value }';
}

class ChangedOrderDeliveryNote extends OrderFormEvent {
  final String value;

  ChangedOrderDeliveryNote({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderDeliveryNote{ value: $value }';
}

class ChangedOrderStatus extends OrderFormEvent {
  final OrderStatus value;

  ChangedOrderStatus({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderStatus{ value: $value }';
}

class ChangedOrderTimeStamp extends OrderFormEvent {
  final String value;

  ChangedOrderTimeStamp({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderTimeStamp{ value: $value }';
}

