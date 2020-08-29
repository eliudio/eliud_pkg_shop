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
import 'entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';
class ShopFrontEntity {
  final String appId;
  final String title;
  final String description;
  final String addToBasketText;
  final String shopId;
  final double size;
  final double cardElevation;
  final double cardAxisSpacing;
  final String itemCardBackgroundId;
  final String itemDetailBackgroundId;
  final RgbEntity addToCartColor;
  final int view;
  final int scrollDirection;
  final ActionEntity buyAction;

  ShopFrontEntity({this.appId, this.title, this.description, this.addToBasketText, this.shopId, this.size, this.cardElevation, this.cardAxisSpacing, this.itemCardBackgroundId, this.itemDetailBackgroundId, this.addToCartColor, this.view, this.scrollDirection, this.buyAction, });

  List<Object> get props => [appId, title, description, addToBasketText, shopId, size, cardElevation, cardAxisSpacing, itemCardBackgroundId, itemDetailBackgroundId, addToCartColor, view, scrollDirection, buyAction, ];

  @override
  String toString() {
    return 'ShopFrontEntity{appId: $appId, title: $title, description: $description, addToBasketText: $addToBasketText, shopId: $shopId, size: $size, cardElevation: $cardElevation, cardAxisSpacing: $cardAxisSpacing, itemCardBackgroundId: $itemCardBackgroundId, itemDetailBackgroundId: $itemDetailBackgroundId, addToCartColor: $addToCartColor, view: $view, scrollDirection: $scrollDirection, buyAction: $buyAction}';
  }

  static ShopFrontEntity fromMap(Map map) {
    if (map == null) return null;

    var addToCartColorFromMap;
    addToCartColorFromMap = map['addToCartColor'];
    if (addToCartColorFromMap != null)
      addToCartColorFromMap = RgbEntity.fromMap(addToCartColorFromMap);
    var buyActionFromMap;
    buyActionFromMap = map['buyAction'];
    if (buyActionFromMap != null)
      buyActionFromMap = ActionEntity.fromMap(buyActionFromMap);

    return ShopFrontEntity(
      appId: map['appId'], 
      title: map['title'], 
      description: map['description'], 
      addToBasketText: map['addToBasketText'], 
      shopId: map['shopId'], 
      size: double.tryParse(map['size'].toString()), 
      cardElevation: double.tryParse(map['cardElevation'].toString()), 
      cardAxisSpacing: double.tryParse(map['cardAxisSpacing'].toString()), 
      itemCardBackgroundId: map['itemCardBackgroundId'], 
      itemDetailBackgroundId: map['itemDetailBackgroundId'], 
      addToCartColor: addToCartColorFromMap, 
      view: map['view'], 
      scrollDirection: map['scrollDirection'], 
      buyAction: buyActionFromMap, 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> addToCartColorMap = addToCartColor != null 
        ? addToCartColor.toDocument()
        : null;
    final Map<String, dynamic> buyActionMap = buyAction != null 
        ? buyAction.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (addToBasketText != null) theDocument["addToBasketText"] = addToBasketText;
      else theDocument["addToBasketText"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    if (size != null) theDocument["size"] = size;
      else theDocument["size"] = null;
    if (cardElevation != null) theDocument["cardElevation"] = cardElevation;
      else theDocument["cardElevation"] = null;
    if (cardAxisSpacing != null) theDocument["cardAxisSpacing"] = cardAxisSpacing;
      else theDocument["cardAxisSpacing"] = null;
    if (itemCardBackgroundId != null) theDocument["itemCardBackgroundId"] = itemCardBackgroundId;
      else theDocument["itemCardBackgroundId"] = null;
    if (itemDetailBackgroundId != null) theDocument["itemDetailBackgroundId"] = itemDetailBackgroundId;
      else theDocument["itemDetailBackgroundId"] = null;
    if (addToCartColor != null) theDocument["addToCartColor"] = addToCartColorMap;
      else theDocument["addToCartColor"] = null;
    if (view != null) theDocument["view"] = view;
      else theDocument["view"] = null;
    if (scrollDirection != null) theDocument["scrollDirection"] = scrollDirection;
      else theDocument["scrollDirection"] = null;
    if (buyAction != null) theDocument["buyAction"] = buyActionMap;
      else theDocument["buyAction"] = null;
    return theDocument;
  }

  static ShopFrontEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

