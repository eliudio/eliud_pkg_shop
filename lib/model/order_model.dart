/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/order_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum OrderStatus {
  Ordered, Paid, PaymentFailed, Shipped, Delivered, Unknown
}


OrderStatus toOrderStatus(int? index) {
  switch (index) {
    case 0: return OrderStatus.Ordered;
    case 1: return OrderStatus.Paid;
    case 2: return OrderStatus.PaymentFailed;
    case 3: return OrderStatus.Shipped;
    case 4: return OrderStatus.Delivered;
  }
  return OrderStatus.Unknown;
}


class OrderModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'orders';

  String documentID;
  String appId;
  MemberModel? customer;
  String? name;
  String? email;
  String? shipStreet1;
  String? shipStreet2;
  String? shipCity;
  String? shipState;
  String? postcode;
  String? country;
  bool? invoiceSame;
  String? invoiceStreet1;
  String? invoiceStreet2;
  String? invoiceCity;
  String? invoiceState;
  String? invoicePostcode;
  String? invoiceCountry;
  List<OrderItemModel>? products;
  double? totalPrice;
  String? currency;
  String? paymentReference;
  String? shipmentReference;
  String? deliveryReference;
  String? paymentNote;
  String? shipmentNote;
  String? deliveryNote;
  OrderStatus? status;
  String? timeStamp;

  OrderModel({required this.documentID, required this.appId, this.customer, this.name, this.email, this.shipStreet1, this.shipStreet2, this.shipCity, this.shipState, this.postcode, this.country, this.invoiceSame, this.invoiceStreet1, this.invoiceStreet2, this.invoiceCity, this.invoiceState, this.invoicePostcode, this.invoiceCountry, this.products, this.totalPrice, this.currency, this.paymentReference, this.shipmentReference, this.deliveryReference, this.paymentNote, this.shipmentNote, this.deliveryNote, this.status, this.timeStamp, })  {
    assert(documentID != null);
  }

  OrderModel copyWith({String? documentID, String? appId, MemberModel? customer, String? name, String? email, String? shipStreet1, String? shipStreet2, String? shipCity, String? shipState, String? postcode, String? country, bool? invoiceSame, String? invoiceStreet1, String? invoiceStreet2, String? invoiceCity, String? invoiceState, String? invoicePostcode, String? invoiceCountry, List<OrderItemModel>? products, double? totalPrice, String? currency, String? paymentReference, String? shipmentReference, String? deliveryReference, String? paymentNote, String? shipmentNote, String? deliveryNote, OrderStatus? status, String? timeStamp, }) {
    return OrderModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, customer: customer ?? this.customer, name: name ?? this.name, email: email ?? this.email, shipStreet1: shipStreet1 ?? this.shipStreet1, shipStreet2: shipStreet2 ?? this.shipStreet2, shipCity: shipCity ?? this.shipCity, shipState: shipState ?? this.shipState, postcode: postcode ?? this.postcode, country: country ?? this.country, invoiceSame: invoiceSame ?? this.invoiceSame, invoiceStreet1: invoiceStreet1 ?? this.invoiceStreet1, invoiceStreet2: invoiceStreet2 ?? this.invoiceStreet2, invoiceCity: invoiceCity ?? this.invoiceCity, invoiceState: invoiceState ?? this.invoiceState, invoicePostcode: invoicePostcode ?? this.invoicePostcode, invoiceCountry: invoiceCountry ?? this.invoiceCountry, products: products ?? this.products, totalPrice: totalPrice ?? this.totalPrice, currency: currency ?? this.currency, paymentReference: paymentReference ?? this.paymentReference, shipmentReference: shipmentReference ?? this.shipmentReference, deliveryReference: deliveryReference ?? this.deliveryReference, paymentNote: paymentNote ?? this.paymentNote, shipmentNote: shipmentNote ?? this.shipmentNote, deliveryNote: deliveryNote ?? this.deliveryNote, status: status ?? this.status, timeStamp: timeStamp ?? this.timeStamp, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ customer.hashCode ^ name.hashCode ^ email.hashCode ^ shipStreet1.hashCode ^ shipStreet2.hashCode ^ shipCity.hashCode ^ shipState.hashCode ^ postcode.hashCode ^ country.hashCode ^ invoiceSame.hashCode ^ invoiceStreet1.hashCode ^ invoiceStreet2.hashCode ^ invoiceCity.hashCode ^ invoiceState.hashCode ^ invoicePostcode.hashCode ^ invoiceCountry.hashCode ^ products.hashCode ^ totalPrice.hashCode ^ currency.hashCode ^ paymentReference.hashCode ^ shipmentReference.hashCode ^ deliveryReference.hashCode ^ paymentNote.hashCode ^ shipmentNote.hashCode ^ deliveryNote.hashCode ^ status.hashCode ^ timeStamp.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is OrderModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          customer == other.customer &&
          name == other.name &&
          email == other.email &&
          shipStreet1 == other.shipStreet1 &&
          shipStreet2 == other.shipStreet2 &&
          shipCity == other.shipCity &&
          shipState == other.shipState &&
          postcode == other.postcode &&
          country == other.country &&
          invoiceSame == other.invoiceSame &&
          invoiceStreet1 == other.invoiceStreet1 &&
          invoiceStreet2 == other.invoiceStreet2 &&
          invoiceCity == other.invoiceCity &&
          invoiceState == other.invoiceState &&
          invoicePostcode == other.invoicePostcode &&
          invoiceCountry == other.invoiceCountry &&
          ListEquality().equals(products, other.products) &&
          totalPrice == other.totalPrice &&
          currency == other.currency &&
          paymentReference == other.paymentReference &&
          shipmentReference == other.shipmentReference &&
          deliveryReference == other.deliveryReference &&
          paymentNote == other.paymentNote &&
          shipmentNote == other.shipmentNote &&
          deliveryNote == other.deliveryNote &&
          status == other.status &&
          timeStamp == other.timeStamp;

  @override
  String toString() {
    String productsCsv = (products == null) ? '' : products!.join(', ');

    return 'OrderModel{documentID: $documentID, appId: $appId, customer: $customer, name: $name, email: $email, shipStreet1: $shipStreet1, shipStreet2: $shipStreet2, shipCity: $shipCity, shipState: $shipState, postcode: $postcode, country: $country, invoiceSame: $invoiceSame, invoiceStreet1: $invoiceStreet1, invoiceStreet2: $invoiceStreet2, invoiceCity: $invoiceCity, invoiceState: $invoiceState, invoicePostcode: $invoicePostcode, invoiceCountry: $invoiceCountry, products: OrderItem[] { $productsCsv }, totalPrice: $totalPrice, currency: $currency, paymentReference: $paymentReference, shipmentReference: $shipmentReference, deliveryReference: $deliveryReference, paymentNote: $paymentNote, shipmentNote: $shipmentNote, deliveryNote: $deliveryNote, status: $status, timeStamp: $timeStamp}';
  }

  OrderEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
      if (customer != null) referencesCollector.add(ModelReference(MemberModel.packageName, MemberModel.id, customer!));
    }
    return OrderEntity(
          appId: (appId != null) ? appId : null, 
          customerId: (customer != null) ? customer!.documentID : null, 
          name: (name != null) ? name : null, 
          email: (email != null) ? email : null, 
          shipStreet1: (shipStreet1 != null) ? shipStreet1 : null, 
          shipStreet2: (shipStreet2 != null) ? shipStreet2 : null, 
          shipCity: (shipCity != null) ? shipCity : null, 
          shipState: (shipState != null) ? shipState : null, 
          postcode: (postcode != null) ? postcode : null, 
          country: (country != null) ? country : null, 
          invoiceSame: (invoiceSame != null) ? invoiceSame : null, 
          invoiceStreet1: (invoiceStreet1 != null) ? invoiceStreet1 : null, 
          invoiceStreet2: (invoiceStreet2 != null) ? invoiceStreet2 : null, 
          invoiceCity: (invoiceCity != null) ? invoiceCity : null, 
          invoiceState: (invoiceState != null) ? invoiceState : null, 
          invoicePostcode: (invoicePostcode != null) ? invoicePostcode : null, 
          invoiceCountry: (invoiceCountry != null) ? invoiceCountry : null, 
          products: (products != null) ? products
            !.map((item) => item.toEntity(appId: appId, referencesCollector: referencesCollector))
            .toList() : null, 
          totalPrice: (totalPrice != null) ? totalPrice : null, 
          currency: (currency != null) ? currency : null, 
          paymentReference: (paymentReference != null) ? paymentReference : null, 
          shipmentReference: (shipmentReference != null) ? shipmentReference : null, 
          deliveryReference: (deliveryReference != null) ? deliveryReference : null, 
          paymentNote: (paymentNote != null) ? paymentNote : null, 
          shipmentNote: (shipmentNote != null) ? shipmentNote : null, 
          deliveryNote: (deliveryNote != null) ? deliveryNote : null, 
          status: (status != null) ? status!.index : null, 
          timeStamp: (timeStamp != null) ? timeStamp : null, 
    );
  }

  static Future<OrderModel?> fromEntity(String documentID, OrderEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return OrderModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          email: entity.email, 
          shipStreet1: entity.shipStreet1, 
          shipStreet2: entity.shipStreet2, 
          shipCity: entity.shipCity, 
          shipState: entity.shipState, 
          postcode: entity.postcode, 
          country: entity.country, 
          invoiceSame: entity.invoiceSame, 
          invoiceStreet1: entity.invoiceStreet1, 
          invoiceStreet2: entity.invoiceStreet2, 
          invoiceCity: entity.invoiceCity, 
          invoiceState: entity.invoiceState, 
          invoicePostcode: entity.invoicePostcode, 
          invoiceCountry: entity.invoiceCountry, 
          products: 
            entity.products == null ? null : List<OrderItemModel>.from(await Future.wait(entity. products
            !.map((item) {
            counter++;
              return OrderItemModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          totalPrice: entity.totalPrice, 
          currency: entity.currency, 
          paymentReference: entity.paymentReference, 
          shipmentReference: entity.shipmentReference, 
          deliveryReference: entity.deliveryReference, 
          paymentNote: entity.paymentNote, 
          shipmentNote: entity.shipmentNote, 
          deliveryNote: entity.deliveryNote, 
          status: toOrderStatus(entity.status), 
          timeStamp: entity.timeStamp, 
    );
  }

  static Future<OrderModel?> fromEntityPlus(String documentID, OrderEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MemberModel? customerHolder;
    if (entity.customerId != null) {
      try {
          customerHolder = await memberRepository(appId: appId)!.get(entity.customerId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise customer');
        print('Error whilst retrieving member with id ${entity.customerId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return OrderModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          customer: customerHolder, 
          name: entity.name, 
          email: entity.email, 
          shipStreet1: entity.shipStreet1, 
          shipStreet2: entity.shipStreet2, 
          shipCity: entity.shipCity, 
          shipState: entity.shipState, 
          postcode: entity.postcode, 
          country: entity.country, 
          invoiceSame: entity.invoiceSame, 
          invoiceStreet1: entity.invoiceStreet1, 
          invoiceStreet2: entity.invoiceStreet2, 
          invoiceCity: entity.invoiceCity, 
          invoiceState: entity.invoiceState, 
          invoicePostcode: entity.invoicePostcode, 
          invoiceCountry: entity.invoiceCountry, 
          products: 
            entity. products == null ? null : List<OrderItemModel>.from(await Future.wait(entity. products
            !.map((item) {
            counter++;
            return OrderItemModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          totalPrice: entity.totalPrice, 
          currency: entity.currency, 
          paymentReference: entity.paymentReference, 
          shipmentReference: entity.shipmentReference, 
          deliveryReference: entity.deliveryReference, 
          paymentNote: entity.paymentNote, 
          shipmentNote: entity.shipmentNote, 
          deliveryNote: entity.deliveryNote, 
          status: toOrderStatus(entity.status), 
          timeStamp: entity.timeStamp, 
    );
  }

}

