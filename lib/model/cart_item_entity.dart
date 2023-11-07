/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';

class CartItemEntity implements EntityBase {
  final int? amount;
  final String? appId;
  final String? productId;

  CartItemEntity({
    this.amount,
    required this.appId,
    this.productId,
  });

  CartItemEntity copyWith({
    String? documentID,
    int? amount,
    String? appId,
    String? productId,
  }) {
    return CartItemEntity(
      amount: amount ?? this.amount,
      appId: appId ?? this.appId,
      productId: productId ?? this.productId,
    );
  }

  List<Object?> get props => [
        amount,
        appId,
        productId,
      ];

  @override
  String toString() {
    return 'CartItemEntity{amount: $amount, appId: $appId, productId: $productId}';
  }

  static CartItemEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return CartItemEntity(
      amount: int.tryParse(map['amount'].toString()),
      appId: map['appId'],
      productId: map['productId'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (amount != null) {
      theDocument["amount"] = amount;
    } else {
      theDocument["amount"] = null;
    }
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (productId != null) {
      theDocument["productId"] = productId;
    } else {
      theDocument["productId"] = null;
    }
    return theDocument;
  }

  @override
  CartItemEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static CartItemEntity? fromJsonString(String json,
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
