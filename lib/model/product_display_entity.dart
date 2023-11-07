/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';

class ProductDisplayEntity implements EntityBase {
  final String? appId;
  final String? description;
  final BackgroundEntity? itemDetailBackground;
  final String? addToBasketText;
  final ActionEntity? buyAction;
  final String? shopId;
  final BackgroundEntity? background;
  final StorageConditionsEntity? conditions;

  ProductDisplayEntity({
    required this.appId,
    this.description,
    this.itemDetailBackground,
    this.addToBasketText,
    this.buyAction,
    this.shopId,
    this.background,
    this.conditions,
  });

  ProductDisplayEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    BackgroundEntity? itemDetailBackground,
    String? addToBasketText,
    ActionEntity? buyAction,
    String? shopId,
    BackgroundEntity? background,
    StorageConditionsEntity? conditions,
  }) {
    return ProductDisplayEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground,
      addToBasketText: addToBasketText ?? this.addToBasketText,
      buyAction: buyAction ?? this.buyAction,
      shopId: shopId ?? this.shopId,
      background: background ?? this.background,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        itemDetailBackground,
        addToBasketText,
        buyAction,
        shopId,
        background,
        conditions,
      ];

  @override
  String toString() {
    return 'ProductDisplayEntity{appId: $appId, description: $description, itemDetailBackground: $itemDetailBackground, addToBasketText: $addToBasketText, buyAction: $buyAction, shopId: $shopId, background: $background, conditions: $conditions}';
  }

  static ProductDisplayEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var itemDetailBackgroundFromMap = map['itemDetailBackground'];
    if (itemDetailBackgroundFromMap != null) {
      itemDetailBackgroundFromMap = BackgroundEntity.fromMap(
          itemDetailBackgroundFromMap,
          newDocumentIds: newDocumentIds);
    }
    var buyActionFromMap = map['buyAction'];
    if (buyActionFromMap != null) {
      buyActionFromMap = ActionEntity.fromMap(buyActionFromMap,
          newDocumentIds: newDocumentIds);
    }
    var backgroundFromMap = map['background'];
    if (backgroundFromMap != null) {
      backgroundFromMap = BackgroundEntity.fromMap(backgroundFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return ProductDisplayEntity(
      appId: map['appId'],
      description: map['description'],
      itemDetailBackground: itemDetailBackgroundFromMap,
      addToBasketText: map['addToBasketText'],
      buyAction: buyActionFromMap,
      shopId: map['shopId'],
      background: backgroundFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? itemDetailBackgroundMap =
        itemDetailBackground != null
            ? itemDetailBackground!.toDocument()
            : null;
    final Map<String, dynamic>? buyActionMap =
        buyAction != null ? buyAction!.toDocument() : null;
    final Map<String, dynamic>? backgroundMap =
        background != null ? background!.toDocument() : null;
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
    if (itemDetailBackground != null) {
      theDocument["itemDetailBackground"] = itemDetailBackgroundMap;
    } else {
      theDocument["itemDetailBackground"] = null;
    }
    if (addToBasketText != null) {
      theDocument["addToBasketText"] = addToBasketText;
    } else {
      theDocument["addToBasketText"] = null;
    }
    if (buyAction != null) {
      theDocument["buyAction"] = buyActionMap;
    } else {
      theDocument["buyAction"] = null;
    }
    if (shopId != null) {
      theDocument["shopId"] = shopId;
    } else {
      theDocument["shopId"] = null;
    }
    if (background != null) {
      theDocument["background"] = backgroundMap;
    } else {
      theDocument["background"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  ProductDisplayEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static ProductDisplayEntity? fromJsonString(String json,
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
