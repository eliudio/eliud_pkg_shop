/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';

class CartEntity implements EntityBase {
  final String? appId;
  final String? title;
  final String? description;
  final String? checkoutText;
  final String? shopId;
  final BackgroundEntity? itemImageBackground;
  final BackgroundEntity? itemDetailBackground;
  final ActionEntity? checkoutAction;
  final ActionEntity? backToShopAction;
  final ActionEntity? openProductAction;
  final StorageConditionsEntity? conditions;

  CartEntity({
    required this.appId,
    this.title,
    this.description,
    this.checkoutText,
    this.shopId,
    this.itemImageBackground,
    this.itemDetailBackground,
    this.checkoutAction,
    this.backToShopAction,
    this.openProductAction,
    this.conditions,
  });

  CartEntity copyWith({
    String? documentID,
    String? appId,
    String? title,
    String? description,
    String? checkoutText,
    String? shopId,
    BackgroundEntity? itemImageBackground,
    BackgroundEntity? itemDetailBackground,
    ActionEntity? checkoutAction,
    ActionEntity? backToShopAction,
    ActionEntity? openProductAction,
    StorageConditionsEntity? conditions,
  }) {
    return CartEntity(
      appId: appId ?? this.appId,
      title: title ?? this.title,
      description: description ?? this.description,
      checkoutText: checkoutText ?? this.checkoutText,
      shopId: shopId ?? this.shopId,
      itemImageBackground: itemImageBackground ?? this.itemImageBackground,
      itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground,
      checkoutAction: checkoutAction ?? this.checkoutAction,
      backToShopAction: backToShopAction ?? this.backToShopAction,
      openProductAction: openProductAction ?? this.openProductAction,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        title,
        description,
        checkoutText,
        shopId,
        itemImageBackground,
        itemDetailBackground,
        checkoutAction,
        backToShopAction,
        openProductAction,
        conditions,
      ];

  @override
  String toString() {
    return 'CartEntity{appId: $appId, title: $title, description: $description, checkoutText: $checkoutText, shopId: $shopId, itemImageBackground: $itemImageBackground, itemDetailBackground: $itemDetailBackground, checkoutAction: $checkoutAction, backToShopAction: $backToShopAction, openProductAction: $openProductAction, conditions: $conditions}';
  }

  static CartEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
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
    var checkoutActionFromMap = map['checkoutAction'];
    if (checkoutActionFromMap != null) {
      checkoutActionFromMap = ActionEntity.fromMap(checkoutActionFromMap,
          newDocumentIds: newDocumentIds);
    }
    var backToShopActionFromMap = map['backToShopAction'];
    if (backToShopActionFromMap != null) {
      backToShopActionFromMap = ActionEntity.fromMap(backToShopActionFromMap,
          newDocumentIds: newDocumentIds);
    }
    var openProductActionFromMap = map['openProductAction'];
    if (openProductActionFromMap != null) {
      openProductActionFromMap = ActionEntity.fromMap(openProductActionFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return CartEntity(
      appId: map['appId'],
      title: map['title'],
      description: map['description'],
      checkoutText: map['checkoutText'],
      shopId: map['shopId'],
      itemImageBackground: itemImageBackgroundFromMap,
      itemDetailBackground: itemDetailBackgroundFromMap,
      checkoutAction: checkoutActionFromMap,
      backToShopAction: backToShopActionFromMap,
      openProductAction: openProductActionFromMap,
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
    final Map<String, dynamic>? checkoutActionMap =
        checkoutAction != null ? checkoutAction!.toDocument() : null;
    final Map<String, dynamic>? backToShopActionMap =
        backToShopAction != null ? backToShopAction!.toDocument() : null;
    final Map<String, dynamic>? openProductActionMap =
        openProductAction != null ? openProductAction!.toDocument() : null;
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (title != null) {
      theDocument["title"] = title;
    } else {
      theDocument["title"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (checkoutText != null) {
      theDocument["checkoutText"] = checkoutText;
    } else {
      theDocument["checkoutText"] = null;
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
    if (checkoutAction != null) {
      theDocument["checkoutAction"] = checkoutActionMap;
    } else {
      theDocument["checkoutAction"] = null;
    }
    if (backToShopAction != null) {
      theDocument["backToShopAction"] = backToShopActionMap;
    } else {
      theDocument["backToShopAction"] = null;
    }
    if (openProductAction != null) {
      theDocument["openProductAction"] = openProductActionMap;
    } else {
      theDocument["openProductAction"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  CartEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static CartEntity? fromJsonString(String json,
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
