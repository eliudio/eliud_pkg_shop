/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';

class ShopFrontEntity implements EntityBase {
  final String? appId;
  final String? title;
  final String? description;
  final String? shopId;
  final double? size;
  final double? cardElevation;
  final double? cardAxisSpacing;
  final BackgroundEntity? itemCardBackground;
  final RgbEntity? addToCartColor;
  final int? scrollDirection;
  final ActionEntity? buyAction;
  final ActionEntity? openProductAction;
  final EdgeInsetsGeometryEntity? padding;
  final StorageConditionsEntity? conditions;

  ShopFrontEntity({
    required this.appId,
    this.title,
    this.description,
    this.shopId,
    this.size,
    this.cardElevation,
    this.cardAxisSpacing,
    this.itemCardBackground,
    this.addToCartColor,
    this.scrollDirection,
    this.buyAction,
    this.openProductAction,
    this.padding,
    this.conditions,
  });

  ShopFrontEntity copyWith({
    String? documentID,
    String? appId,
    String? title,
    String? description,
    String? shopId,
    double? size,
    double? cardElevation,
    double? cardAxisSpacing,
    BackgroundEntity? itemCardBackground,
    RgbEntity? addToCartColor,
    int? scrollDirection,
    ActionEntity? buyAction,
    ActionEntity? openProductAction,
    EdgeInsetsGeometryEntity? padding,
    StorageConditionsEntity? conditions,
  }) {
    return ShopFrontEntity(
      appId: appId ?? this.appId,
      title: title ?? this.title,
      description: description ?? this.description,
      shopId: shopId ?? this.shopId,
      size: size ?? this.size,
      cardElevation: cardElevation ?? this.cardElevation,
      cardAxisSpacing: cardAxisSpacing ?? this.cardAxisSpacing,
      itemCardBackground: itemCardBackground ?? this.itemCardBackground,
      addToCartColor: addToCartColor ?? this.addToCartColor,
      scrollDirection: scrollDirection ?? this.scrollDirection,
      buyAction: buyAction ?? this.buyAction,
      openProductAction: openProductAction ?? this.openProductAction,
      padding: padding ?? this.padding,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        title,
        description,
        shopId,
        size,
        cardElevation,
        cardAxisSpacing,
        itemCardBackground,
        addToCartColor,
        scrollDirection,
        buyAction,
        openProductAction,
        padding,
        conditions,
      ];

  @override
  String toString() {
    return 'ShopFrontEntity{appId: $appId, title: $title, description: $description, shopId: $shopId, size: $size, cardElevation: $cardElevation, cardAxisSpacing: $cardAxisSpacing, itemCardBackground: $itemCardBackground, addToCartColor: $addToCartColor, scrollDirection: $scrollDirection, buyAction: $buyAction, openProductAction: $openProductAction, padding: $padding, conditions: $conditions}';
  }

  static ShopFrontEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var itemCardBackgroundFromMap = map['itemCardBackground'];
    if (itemCardBackgroundFromMap != null) {
      itemCardBackgroundFromMap = BackgroundEntity.fromMap(
          itemCardBackgroundFromMap,
          newDocumentIds: newDocumentIds);
    }
    var addToCartColorFromMap = map['addToCartColor'];
    if (addToCartColorFromMap != null) {
      addToCartColorFromMap = RgbEntity.fromMap(addToCartColorFromMap,
          newDocumentIds: newDocumentIds);
    }
    var buyActionFromMap = map['buyAction'];
    if (buyActionFromMap != null) {
      buyActionFromMap = ActionEntity.fromMap(buyActionFromMap,
          newDocumentIds: newDocumentIds);
    }
    var openProductActionFromMap = map['openProductAction'];
    if (openProductActionFromMap != null) {
      openProductActionFromMap = ActionEntity.fromMap(openProductActionFromMap,
          newDocumentIds: newDocumentIds);
    }
    var paddingFromMap = map['padding'];
    if (paddingFromMap != null) {
      paddingFromMap = EdgeInsetsGeometryEntity.fromMap(paddingFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return ShopFrontEntity(
      appId: map['appId'],
      title: map['title'],
      description: map['description'],
      shopId: map['shopId'],
      size: double.tryParse(map['size'].toString()),
      cardElevation: double.tryParse(map['cardElevation'].toString()),
      cardAxisSpacing: double.tryParse(map['cardAxisSpacing'].toString()),
      itemCardBackground: itemCardBackgroundFromMap,
      addToCartColor: addToCartColorFromMap,
      scrollDirection: map['scrollDirection'],
      buyAction: buyActionFromMap,
      openProductAction: openProductActionFromMap,
      padding: paddingFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? itemCardBackgroundMap =
        itemCardBackground != null ? itemCardBackground!.toDocument() : null;
    final Map<String, dynamic>? addToCartColorMap =
        addToCartColor != null ? addToCartColor!.toDocument() : null;
    final Map<String, dynamic>? buyActionMap =
        buyAction != null ? buyAction!.toDocument() : null;
    final Map<String, dynamic>? openProductActionMap =
        openProductAction != null ? openProductAction!.toDocument() : null;
    final Map<String, dynamic>? paddingMap =
        padding != null ? padding!.toDocument() : null;
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
    if (shopId != null) {
      theDocument["shopId"] = shopId;
    } else {
      theDocument["shopId"] = null;
    }
    if (size != null) {
      theDocument["size"] = size;
    } else {
      theDocument["size"] = null;
    }
    if (cardElevation != null) {
      theDocument["cardElevation"] = cardElevation;
    } else {
      theDocument["cardElevation"] = null;
    }
    if (cardAxisSpacing != null) {
      theDocument["cardAxisSpacing"] = cardAxisSpacing;
    } else {
      theDocument["cardAxisSpacing"] = null;
    }
    if (itemCardBackground != null) {
      theDocument["itemCardBackground"] = itemCardBackgroundMap;
    } else {
      theDocument["itemCardBackground"] = null;
    }
    if (addToCartColor != null) {
      theDocument["addToCartColor"] = addToCartColorMap;
    } else {
      theDocument["addToCartColor"] = null;
    }
    if (scrollDirection != null) {
      theDocument["scrollDirection"] = scrollDirection;
    } else {
      theDocument["scrollDirection"] = null;
    }
    if (buyAction != null) {
      theDocument["buyAction"] = buyActionMap;
    } else {
      theDocument["buyAction"] = null;
    }
    if (openProductAction != null) {
      theDocument["openProductAction"] = openProductActionMap;
    } else {
      theDocument["openProductAction"] = null;
    }
    if (padding != null) {
      theDocument["padding"] = paddingMap;
    } else {
      theDocument["padding"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  ShopFrontEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    newEntity = newEntity.copyWith(
        buyAction:
            buyAction == null ? null : buyAction!.copyWith(appId: newAppId),
        openProductAction: openProductAction == null
            ? null
            : openProductAction!.copyWith(appId: newAppId));
    return newEntity;
  }

  static ShopFrontEntity? fromJsonString(String json,
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
