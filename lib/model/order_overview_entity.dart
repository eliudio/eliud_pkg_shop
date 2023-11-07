/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class OrderOverviewEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? shopId;
  final BackgroundEntity? itemImageBackground;
  final BackgroundEntity? itemDetailBackground;
  final StorageConditionsEntity? conditions;

  OrderOverviewEntity({
    required this.appId,
    this.description,
    this.shopId,
    this.itemImageBackground,
    this.itemDetailBackground,
    this.conditions,
  });

  OrderOverviewEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? shopId,
    BackgroundEntity? itemImageBackground,
    BackgroundEntity? itemDetailBackground,
    StorageConditionsEntity? conditions,
  }) {
    return OrderOverviewEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      shopId: shopId ?? this.shopId,
      itemImageBackground: itemImageBackground ?? this.itemImageBackground,
      itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        shopId,
        itemImageBackground,
        itemDetailBackground,
        conditions,
      ];

  @override
  String toString() {
    return 'OrderOverviewEntity{appId: $appId, description: $description, shopId: $shopId, itemImageBackground: $itemImageBackground, itemDetailBackground: $itemDetailBackground, conditions: $conditions}';
  }

  static OrderOverviewEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var itemImageBackgroundFromMap = map['itemImageBackground'];
    if (itemImageBackgroundFromMap != null) {
      itemImageBackgroundFromMap = BackgroundEntity.fromMap(
          itemImageBackgroundFromMap,
          newDocumentIds: newDocumentIds);
    }
    var itemDetailBackgroundFromMap = map['itemDetailBackground'];
    if (itemDetailBackgroundFromMap != null) {
      itemDetailBackgroundFromMap = BackgroundEntity.fromMap(
          itemDetailBackgroundFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return OrderOverviewEntity(
      appId: map['appId'],
      description: map['description'],
      shopId: map['shopId'],
      itemImageBackground: itemImageBackgroundFromMap,
      itemDetailBackground: itemDetailBackgroundFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? itemImageBackgroundMap =
        itemImageBackground != null ? itemImageBackground!.toDocument() : null;
    final Map<String, dynamic>? itemDetailBackgroundMap =
        itemDetailBackground != null
            ? itemDetailBackground!.toDocument()
            : null;
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
    if (shopId != null) {
      theDocument["shopId"] = shopId;
    } else {
      theDocument["shopId"] = null;
    }
    if (itemImageBackground != null) {
      theDocument["itemImageBackground"] = itemImageBackgroundMap;
    } else {
      theDocument["itemImageBackground"] = null;
    }
    if (itemDetailBackground != null) {
      theDocument["itemDetailBackground"] = itemDetailBackgroundMap;
    } else {
      theDocument["itemDetailBackground"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  OrderOverviewEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static OrderOverviewEntity? fromJsonString(String json,
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
