/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';

import 'order_item_entity.dart';
class OrderEntity {
  final String appId;
  final String customerId;
  final String name;
  final String email;
  final String shipStreet1;
  final String shipStreet2;
  final String shipCity;
  final String shipState;
  final String postcode;
  final String countryId;
  final bool invoiceSame;
  final String invoiceStreet1;
  final String invoiceStreet2;
  final String invoiceCity;
  final String invoiceState;
  final String invoicePostcode;
  final String invoiceCountryId;
  final List<OrderItemEntity> products;
  final double totalPrice;
  final String currency;
  final String paymentReference;
  final String shipmentReference;
  final String deliveryReference;
  final String paymentNote;
  final String shipmentNote;
  final String deliveryNote;
  final int status;
  final String timeStamp;

  OrderEntity({this.appId, this.customerId, this.name, this.email, this.shipStreet1, this.shipStreet2, this.shipCity, this.shipState, this.postcode, this.countryId, this.invoiceSame, this.invoiceStreet1, this.invoiceStreet2, this.invoiceCity, this.invoiceState, this.invoicePostcode, this.invoiceCountryId, this.products, this.totalPrice, this.currency, this.paymentReference, this.shipmentReference, this.deliveryReference, this.paymentNote, this.shipmentNote, this.deliveryNote, this.status, this.timeStamp, });

  List<Object> get props => [appId, customerId, name, email, shipStreet1, shipStreet2, shipCity, shipState, postcode, countryId, invoiceSame, invoiceStreet1, invoiceStreet2, invoiceCity, invoiceState, invoicePostcode, invoiceCountryId, products, totalPrice, currency, paymentReference, shipmentReference, deliveryReference, paymentNote, shipmentNote, deliveryNote, status, timeStamp, ];

  @override
  String toString() {
    String productsCsv = (products == null) ? '' : products.join(', ');

    return 'OrderEntity{appId: $appId, customerId: $customerId, name: $name, email: $email, shipStreet1: $shipStreet1, shipStreet2: $shipStreet2, shipCity: $shipCity, shipState: $shipState, postcode: $postcode, countryId: $countryId, invoiceSame: $invoiceSame, invoiceStreet1: $invoiceStreet1, invoiceStreet2: $invoiceStreet2, invoiceCity: $invoiceCity, invoiceState: $invoiceState, invoicePostcode: $invoicePostcode, invoiceCountryId: $invoiceCountryId, products: OrderItem[] { $productsCsv }, totalPrice: $totalPrice, currency: $currency, paymentReference: $paymentReference, shipmentReference: $shipmentReference, deliveryReference: $deliveryReference, paymentNote: $paymentNote, shipmentNote: $shipmentNote, deliveryNote: $deliveryNote, status: $status, timeStamp: $timeStamp}';
  }

  static OrderEntity fromMap(Map map) {
    if (map == null) return null;

    final productsList = (map['products'] as List<dynamic>)
        .map((dynamic item) =>
        OrderItemEntity.fromMap(item as Map))
        .toList();

    return OrderEntity(
      appId: map['appId'], 
      customerId: map['customerId'], 
      name: map['name'], 
      email: map['email'], 
      shipStreet1: map['shipStreet1'], 
      shipStreet2: map['shipStreet2'], 
      shipCity: map['shipCity'], 
      shipState: map['shipState'], 
      postcode: map['postcode'], 
      countryId: map['countryId'], 
      invoiceSame: map['invoiceSame'], 
      invoiceStreet1: map['invoiceStreet1'], 
      invoiceStreet2: map['invoiceStreet2'], 
      invoiceCity: map['invoiceCity'], 
      invoiceState: map['invoiceState'], 
      invoicePostcode: map['invoicePostcode'], 
      invoiceCountryId: map['invoiceCountryId'], 
      products: productsList, 
      totalPrice: double.tryParse(map['totalPrice'].toString()), 
      currency: map['currency'], 
      paymentReference: map['paymentReference'], 
      shipmentReference: map['shipmentReference'], 
      deliveryReference: map['deliveryReference'], 
      paymentNote: map['paymentNote'], 
      shipmentNote: map['shipmentNote'], 
      deliveryNote: map['deliveryNote'], 
      status: map['status'], 
      timeStamp: map['timeStamp'], 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> productsListMap = products != null 
        ? products.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (customerId != null) theDocument["customerId"] = customerId;
      else theDocument["customerId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (email != null) theDocument["email"] = email;
      else theDocument["email"] = null;
    if (shipStreet1 != null) theDocument["shipStreet1"] = shipStreet1;
      else theDocument["shipStreet1"] = null;
    if (shipStreet2 != null) theDocument["shipStreet2"] = shipStreet2;
      else theDocument["shipStreet2"] = null;
    if (shipCity != null) theDocument["shipCity"] = shipCity;
      else theDocument["shipCity"] = null;
    if (shipState != null) theDocument["shipState"] = shipState;
      else theDocument["shipState"] = null;
    if (postcode != null) theDocument["postcode"] = postcode;
      else theDocument["postcode"] = null;
    if (countryId != null) theDocument["countryId"] = countryId;
      else theDocument["countryId"] = null;
    if (invoiceSame != null) theDocument["invoiceSame"] = invoiceSame;
      else theDocument["invoiceSame"] = null;
    if (invoiceStreet1 != null) theDocument["invoiceStreet1"] = invoiceStreet1;
      else theDocument["invoiceStreet1"] = null;
    if (invoiceStreet2 != null) theDocument["invoiceStreet2"] = invoiceStreet2;
      else theDocument["invoiceStreet2"] = null;
    if (invoiceCity != null) theDocument["invoiceCity"] = invoiceCity;
      else theDocument["invoiceCity"] = null;
    if (invoiceState != null) theDocument["invoiceState"] = invoiceState;
      else theDocument["invoiceState"] = null;
    if (invoicePostcode != null) theDocument["invoicePostcode"] = invoicePostcode;
      else theDocument["invoicePostcode"] = null;
    if (invoiceCountryId != null) theDocument["invoiceCountryId"] = invoiceCountryId;
      else theDocument["invoiceCountryId"] = null;
    if (products != null) theDocument["products"] = productsListMap;
      else theDocument["products"] = null;
    if (totalPrice != null) theDocument["totalPrice"] = totalPrice;
      else theDocument["totalPrice"] = null;
    if (currency != null) theDocument["currency"] = currency;
      else theDocument["currency"] = null;
    if (paymentReference != null) theDocument["paymentReference"] = paymentReference;
      else theDocument["paymentReference"] = null;
    if (shipmentReference != null) theDocument["shipmentReference"] = shipmentReference;
      else theDocument["shipmentReference"] = null;
    if (deliveryReference != null) theDocument["deliveryReference"] = deliveryReference;
      else theDocument["deliveryReference"] = null;
    if (paymentNote != null) theDocument["paymentNote"] = paymentNote;
      else theDocument["paymentNote"] = null;
    if (shipmentNote != null) theDocument["shipmentNote"] = shipmentNote;
      else theDocument["shipmentNote"] = null;
    if (deliveryNote != null) theDocument["deliveryNote"] = deliveryNote;
      else theDocument["deliveryNote"] = null;
    if (status != null) theDocument["status"] = status;
      else theDocument["status"] = null;
    if (timeStamp != null) theDocument["timeStamp"] = timeStamp;
      else theDocument["timeStamp"] = null;
    return theDocument;
  }

  static OrderEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

