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
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class OrderEntity implements EntityBase {
  final String? appId;
  final String? customerId;
  final String? name;
  final String? email;
  final String? shipStreet1;
  final String? shipStreet2;
  final String? shipCity;
  final String? shipState;
  final String? postcode;
  final String? country;
  final bool? invoiceSame;
  final String? invoiceStreet1;
  final String? invoiceStreet2;
  final String? invoiceCity;
  final String? invoiceState;
  final String? invoicePostcode;
  final String? invoiceCountry;
  final List<OrderItemEntity>? products;
  final double? totalPrice;
  final String? currency;
  final String? paymentReference;
  final String? shipmentReference;
  final String? deliveryReference;
  final String? paymentNote;
  final String? shipmentNote;
  final String? deliveryNote;
  final int? status;
  final String? timeStamp;

  OrderEntity({
    required this.appId,
    this.customerId,
    this.name,
    this.email,
    this.shipStreet1,
    this.shipStreet2,
    this.shipCity,
    this.shipState,
    this.postcode,
    this.country,
    this.invoiceSame,
    this.invoiceStreet1,
    this.invoiceStreet2,
    this.invoiceCity,
    this.invoiceState,
    this.invoicePostcode,
    this.invoiceCountry,
    this.products,
    this.totalPrice,
    this.currency,
    this.paymentReference,
    this.shipmentReference,
    this.deliveryReference,
    this.paymentNote,
    this.shipmentNote,
    this.deliveryNote,
    this.status,
    this.timeStamp,
  });

  OrderEntity copyWith({
    String? documentID,
    String? appId,
    String? customerId,
    String? name,
    String? email,
    String? shipStreet1,
    String? shipStreet2,
    String? shipCity,
    String? shipState,
    String? postcode,
    String? country,
    bool? invoiceSame,
    String? invoiceStreet1,
    String? invoiceStreet2,
    String? invoiceCity,
    String? invoiceState,
    String? invoicePostcode,
    String? invoiceCountry,
    List<OrderItemEntity>? products,
    double? totalPrice,
    String? currency,
    String? paymentReference,
    String? shipmentReference,
    String? deliveryReference,
    String? paymentNote,
    String? shipmentNote,
    String? deliveryNote,
    int? status,
    String? timeStamp,
  }) {
    return OrderEntity(
      appId: appId ?? this.appId,
      customerId: customerId ?? this.customerId,
      name: name ?? this.name,
      email: email ?? this.email,
      shipStreet1: shipStreet1 ?? this.shipStreet1,
      shipStreet2: shipStreet2 ?? this.shipStreet2,
      shipCity: shipCity ?? this.shipCity,
      shipState: shipState ?? this.shipState,
      postcode: postcode ?? this.postcode,
      country: country ?? this.country,
      invoiceSame: invoiceSame ?? this.invoiceSame,
      invoiceStreet1: invoiceStreet1 ?? this.invoiceStreet1,
      invoiceStreet2: invoiceStreet2 ?? this.invoiceStreet2,
      invoiceCity: invoiceCity ?? this.invoiceCity,
      invoiceState: invoiceState ?? this.invoiceState,
      invoicePostcode: invoicePostcode ?? this.invoicePostcode,
      invoiceCountry: invoiceCountry ?? this.invoiceCountry,
      products: products ?? this.products,
      totalPrice: totalPrice ?? this.totalPrice,
      currency: currency ?? this.currency,
      paymentReference: paymentReference ?? this.paymentReference,
      shipmentReference: shipmentReference ?? this.shipmentReference,
      deliveryReference: deliveryReference ?? this.deliveryReference,
      paymentNote: paymentNote ?? this.paymentNote,
      shipmentNote: shipmentNote ?? this.shipmentNote,
      deliveryNote: deliveryNote ?? this.deliveryNote,
      status: status ?? this.status,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  List<Object?> get props => [
        appId,
        customerId,
        name,
        email,
        shipStreet1,
        shipStreet2,
        shipCity,
        shipState,
        postcode,
        country,
        invoiceSame,
        invoiceStreet1,
        invoiceStreet2,
        invoiceCity,
        invoiceState,
        invoicePostcode,
        invoiceCountry,
        products,
        totalPrice,
        currency,
        paymentReference,
        shipmentReference,
        deliveryReference,
        paymentNote,
        shipmentNote,
        deliveryNote,
        status,
        timeStamp,
      ];

  @override
  String toString() {
    String productsCsv = (products == null) ? '' : products!.join(', ');

    return 'OrderEntity{appId: $appId, customerId: $customerId, name: $name, email: $email, shipStreet1: $shipStreet1, shipStreet2: $shipStreet2, shipCity: $shipCity, shipState: $shipState, postcode: $postcode, country: $country, invoiceSame: $invoiceSame, invoiceStreet1: $invoiceStreet1, invoiceStreet2: $invoiceStreet2, invoiceCity: $invoiceCity, invoiceState: $invoiceState, invoicePostcode: $invoicePostcode, invoiceCountry: $invoiceCountry, products: OrderItem[] { $productsCsv }, totalPrice: $totalPrice, currency: $currency, paymentReference: $paymentReference, shipmentReference: $shipmentReference, deliveryReference: $deliveryReference, paymentNote: $paymentNote, shipmentNote: $shipmentNote, deliveryNote: $deliveryNote, status: $status, timeStamp: $timeStamp}';
  }

  static OrderEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var productsFromMap = map['products'];
    List<OrderItemEntity> productsList;
    if (productsFromMap != null) {
      productsList = (map['products'] as List<dynamic>)
          .map((dynamic item) => OrderItemEntity.fromMap(item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      productsList = [];
    }

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
      country: map['country'],
      invoiceSame: map['invoiceSame'],
      invoiceStreet1: map['invoiceStreet1'],
      invoiceStreet2: map['invoiceStreet2'],
      invoiceCity: map['invoiceCity'],
      invoiceState: map['invoiceState'],
      invoicePostcode: map['invoicePostcode'],
      invoiceCountry: map['invoiceCountry'],
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

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? productsListMap = products != null
        ? products!.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (customerId != null) {
      theDocument["customerId"] = customerId;
    } else {
      theDocument["customerId"] = null;
    }
    if (name != null) {
      theDocument["name"] = name;
    } else {
      theDocument["name"] = null;
    }
    if (email != null) {
      theDocument["email"] = email;
    } else {
      theDocument["email"] = null;
    }
    if (shipStreet1 != null) {
      theDocument["shipStreet1"] = shipStreet1;
    } else {
      theDocument["shipStreet1"] = null;
    }
    if (shipStreet2 != null) {
      theDocument["shipStreet2"] = shipStreet2;
    } else {
      theDocument["shipStreet2"] = null;
    }
    if (shipCity != null) {
      theDocument["shipCity"] = shipCity;
    } else {
      theDocument["shipCity"] = null;
    }
    if (shipState != null) {
      theDocument["shipState"] = shipState;
    } else {
      theDocument["shipState"] = null;
    }
    if (postcode != null) {
      theDocument["postcode"] = postcode;
    } else {
      theDocument["postcode"] = null;
    }
    if (country != null) {
      theDocument["country"] = country;
    } else {
      theDocument["country"] = null;
    }
    if (invoiceSame != null) {
      theDocument["invoiceSame"] = invoiceSame;
    } else {
      theDocument["invoiceSame"] = null;
    }
    if (invoiceStreet1 != null) {
      theDocument["invoiceStreet1"] = invoiceStreet1;
    } else {
      theDocument["invoiceStreet1"] = null;
    }
    if (invoiceStreet2 != null) {
      theDocument["invoiceStreet2"] = invoiceStreet2;
    } else {
      theDocument["invoiceStreet2"] = null;
    }
    if (invoiceCity != null) {
      theDocument["invoiceCity"] = invoiceCity;
    } else {
      theDocument["invoiceCity"] = null;
    }
    if (invoiceState != null) {
      theDocument["invoiceState"] = invoiceState;
    } else {
      theDocument["invoiceState"] = null;
    }
    if (invoicePostcode != null) {
      theDocument["invoicePostcode"] = invoicePostcode;
    } else {
      theDocument["invoicePostcode"] = null;
    }
    if (invoiceCountry != null) {
      theDocument["invoiceCountry"] = invoiceCountry;
    } else {
      theDocument["invoiceCountry"] = null;
    }
    if (products != null) {
      theDocument["products"] = productsListMap;
    } else {
      theDocument["products"] = null;
    }
    if (totalPrice != null) {
      theDocument["totalPrice"] = totalPrice;
    } else {
      theDocument["totalPrice"] = null;
    }
    if (currency != null) {
      theDocument["currency"] = currency;
    } else {
      theDocument["currency"] = null;
    }
    if (paymentReference != null) {
      theDocument["paymentReference"] = paymentReference;
    } else {
      theDocument["paymentReference"] = null;
    }
    if (shipmentReference != null) {
      theDocument["shipmentReference"] = shipmentReference;
    } else {
      theDocument["shipmentReference"] = null;
    }
    if (deliveryReference != null) {
      theDocument["deliveryReference"] = deliveryReference;
    } else {
      theDocument["deliveryReference"] = null;
    }
    if (paymentNote != null) {
      theDocument["paymentNote"] = paymentNote;
    } else {
      theDocument["paymentNote"] = null;
    }
    if (shipmentNote != null) {
      theDocument["shipmentNote"] = shipmentNote;
    } else {
      theDocument["shipmentNote"] = null;
    }
    if (deliveryNote != null) {
      theDocument["deliveryNote"] = deliveryNote;
    } else {
      theDocument["deliveryNote"] = null;
    }
    if (status != null) {
      theDocument["status"] = status;
    } else {
      theDocument["status"] = null;
    }
    if (timeStamp != null) {
      theDocument["timeStamp"] = timeStamp;
    } else {
      theDocument["timeStamp"] = null;
    }
    return theDocument;
  }

  @override
  OrderEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static OrderEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
