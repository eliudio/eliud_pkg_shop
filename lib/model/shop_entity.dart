/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class ShopEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? shortDescription;
  final String? currency;
  final StorageConditionsEntity? conditions;

  ShopEntity({
    required this.appId,
    this.description,
    this.shortDescription,
    this.currency,
    this.conditions,
  });

  ShopEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? shortDescription,
    String? currency,
    StorageConditionsEntity? conditions,
  }) {
    return ShopEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      currency: currency ?? this.currency,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        shortDescription,
        currency,
        conditions,
      ];

  @override
  String toString() {
    return 'ShopEntity{appId: $appId, description: $description, shortDescription: $shortDescription, currency: $currency, conditions: $conditions}';
  }

  static ShopEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return ShopEntity(
      appId: map['appId'],
      description: map['description'],
      shortDescription: map['shortDescription'],
      currency: map['currency'],
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (shortDescription != null) {
      theDocument["shortDescription"] = shortDescription;
    } else {
      theDocument["shortDescription"] = null;
    }
    if (currency != null) {
      theDocument["currency"] = currency;
    } else {
      theDocument["currency"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  ShopEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static ShopEntity? fromJsonString(String json,
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
