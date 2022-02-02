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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class ShopFrontEntity {
  final String? appId;
  final String? title;
  final String? description;
  final String? shopId;
  final double? size;
  final double? cardElevation;
  final double? cardAxisSpacing;
  final BackgroundEntity? itemCardBackground;
  final RgbEntity? addToCartColor;
  final int? view;
  final int? scrollDirection;
  final ActionEntity? buyAction;
  final ActionEntity? openProductAction;
  final StorageConditionsEntity? conditions;

  ShopFrontEntity({this.appId, this.title, this.description, this.shopId, this.size, this.cardElevation, this.cardAxisSpacing, this.itemCardBackground, this.addToCartColor, this.view, this.scrollDirection, this.buyAction, this.openProductAction, this.conditions, });


  List<Object?> get props => [appId, title, description, shopId, size, cardElevation, cardAxisSpacing, itemCardBackground, addToCartColor, view, scrollDirection, buyAction, openProductAction, conditions, ];

  @override
  String toString() {
    return 'ShopFrontEntity{appId: $appId, title: $title, description: $description, shopId: $shopId, size: $size, cardElevation: $cardElevation, cardAxisSpacing: $cardAxisSpacing, itemCardBackground: $itemCardBackground, addToCartColor: $addToCartColor, view: $view, scrollDirection: $scrollDirection, buyAction: $buyAction, openProductAction: $openProductAction, conditions: $conditions}';
  }

  static ShopFrontEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var itemCardBackgroundFromMap;
    itemCardBackgroundFromMap = map['itemCardBackground'];
    if (itemCardBackgroundFromMap != null)
      itemCardBackgroundFromMap = BackgroundEntity.fromMap(itemCardBackgroundFromMap);
    var addToCartColorFromMap;
    addToCartColorFromMap = map['addToCartColor'];
    if (addToCartColorFromMap != null)
      addToCartColorFromMap = RgbEntity.fromMap(addToCartColorFromMap);
    var buyActionFromMap;
    buyActionFromMap = map['buyAction'];
    if (buyActionFromMap != null)
      buyActionFromMap = ActionEntity.fromMap(buyActionFromMap);
    var openProductActionFromMap;
    openProductActionFromMap = map['openProductAction'];
    if (openProductActionFromMap != null)
      openProductActionFromMap = ActionEntity.fromMap(openProductActionFromMap);
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

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
      view: map['view'], 
      scrollDirection: map['scrollDirection'], 
      buyAction: buyActionFromMap, 
      openProductAction: openProductActionFromMap, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? itemCardBackgroundMap = itemCardBackground != null 
        ? itemCardBackground!.toDocument()
        : null;
    final Map<String, dynamic>? addToCartColorMap = addToCartColor != null 
        ? addToCartColor!.toDocument()
        : null;
    final Map<String, dynamic>? buyActionMap = buyAction != null 
        ? buyAction!.toDocument()
        : null;
    final Map<String, dynamic>? openProductActionMap = openProductAction != null 
        ? openProductAction!.toDocument()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    if (size != null) theDocument["size"] = size;
      else theDocument["size"] = null;
    if (cardElevation != null) theDocument["cardElevation"] = cardElevation;
      else theDocument["cardElevation"] = null;
    if (cardAxisSpacing != null) theDocument["cardAxisSpacing"] = cardAxisSpacing;
      else theDocument["cardAxisSpacing"] = null;
    if (itemCardBackground != null) theDocument["itemCardBackground"] = itemCardBackgroundMap;
      else theDocument["itemCardBackground"] = null;
    if (addToCartColor != null) theDocument["addToCartColor"] = addToCartColorMap;
      else theDocument["addToCartColor"] = null;
    if (view != null) theDocument["view"] = view;
      else theDocument["view"] = null;
    if (scrollDirection != null) theDocument["scrollDirection"] = scrollDirection;
      else theDocument["scrollDirection"] = null;
    if (buyAction != null) theDocument["buyAction"] = buyActionMap;
      else theDocument["buyAction"] = null;
    if (openProductAction != null) theDocument["openProductAction"] = openProductActionMap;
      else theDocument["openProductAction"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static ShopFrontEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

