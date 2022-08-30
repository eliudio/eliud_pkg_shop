/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class OrderItemEntity implements EntityBase {
  final int? amount;
  final String? appId;
  final double? soldPrice;
  final String? productId;

  OrderItemEntity({this.amount, required this.appId, this.soldPrice, this.productId, });

  OrderItemEntity copyWith({String? documentID, int? amount, String? appId, double? soldPrice, String? productId, }) {
    return OrderItemEntity(amount : amount ?? this.amount, appId : appId ?? this.appId, soldPrice : soldPrice ?? this.soldPrice, productId : productId ?? this.productId, );
  }
  List<Object?> get props => [amount, appId, soldPrice, productId, ];

  @override
  String toString() {
    return 'OrderItemEntity{amount: $amount, appId: $appId, soldPrice: $soldPrice, productId: $productId}';
  }

  static OrderItemEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return OrderItemEntity(
      amount: int.tryParse(map['amount'].toString()), 
      appId: map['appId'], 
      soldPrice: double.tryParse(map['soldPrice'].toString()), 
      productId: map['productId'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (amount != null) theDocument["amount"] = amount;
      else theDocument["amount"] = null;
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (soldPrice != null) theDocument["soldPrice"] = soldPrice;
      else theDocument["soldPrice"] = null;
    if (productId != null) theDocument["productId"] = productId;
      else theDocument["productId"] = null;
    return theDocument;
  }

  @override
  OrderItemEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static OrderItemEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

