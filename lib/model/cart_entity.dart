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
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class CartEntity {
  final String appId;
  final String title;
  final String description;
  final String checkoutText;
  final String shopId;
  final String itemImageBackgroundId;
  final String itemDetailBackgroundId;
  final ActionEntity checkoutAction;
  final ActionEntity backToShopAction;
  final ActionEntity openProductAction;

  CartEntity({this.appId, this.title, this.description, this.checkoutText, this.shopId, this.itemImageBackgroundId, this.itemDetailBackgroundId, this.checkoutAction, this.backToShopAction, this.openProductAction, });

  List<Object> get props => [appId, title, description, checkoutText, shopId, itemImageBackgroundId, itemDetailBackgroundId, checkoutAction, backToShopAction, openProductAction, ];

  @override
  String toString() {
    return 'CartEntity{appId: $appId, title: $title, description: $description, checkoutText: $checkoutText, shopId: $shopId, itemImageBackgroundId: $itemImageBackgroundId, itemDetailBackgroundId: $itemDetailBackgroundId, checkoutAction: $checkoutAction, backToShopAction: $backToShopAction, openProductAction: $openProductAction}';
  }

  static CartEntity fromMap(Map map) {
    if (map == null) return null;

    var checkoutActionFromMap;
    checkoutActionFromMap = map['checkoutAction'];
    if (checkoutActionFromMap != null)
      checkoutActionFromMap = ActionEntity.fromMap(checkoutActionFromMap);
    var backToShopActionFromMap;
    backToShopActionFromMap = map['backToShopAction'];
    if (backToShopActionFromMap != null)
      backToShopActionFromMap = ActionEntity.fromMap(backToShopActionFromMap);
    var openProductActionFromMap;
    openProductActionFromMap = map['openProductAction'];
    if (openProductActionFromMap != null)
      openProductActionFromMap = ActionEntity.fromMap(openProductActionFromMap);

    return CartEntity(
      appId: map['appId'], 
      title: map['title'], 
      description: map['description'], 
      checkoutText: map['checkoutText'], 
      shopId: map['shopId'], 
      itemImageBackgroundId: map['itemImageBackgroundId'], 
      itemDetailBackgroundId: map['itemDetailBackgroundId'], 
      checkoutAction: checkoutActionFromMap, 
      backToShopAction: backToShopActionFromMap, 
      openProductAction: openProductActionFromMap, 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> checkoutActionMap = checkoutAction != null 
        ? checkoutAction.toDocument()
        : null;
    final Map<String, dynamic> backToShopActionMap = backToShopAction != null 
        ? backToShopAction.toDocument()
        : null;
    final Map<String, dynamic> openProductActionMap = openProductAction != null 
        ? openProductAction.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (checkoutText != null) theDocument["checkoutText"] = checkoutText;
      else theDocument["checkoutText"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    if (itemImageBackgroundId != null) theDocument["itemImageBackgroundId"] = itemImageBackgroundId;
      else theDocument["itemImageBackgroundId"] = null;
    if (itemDetailBackgroundId != null) theDocument["itemDetailBackgroundId"] = itemDetailBackgroundId;
      else theDocument["itemDetailBackgroundId"] = null;
    if (checkoutAction != null) theDocument["checkoutAction"] = checkoutActionMap;
      else theDocument["checkoutAction"] = null;
    if (backToShopAction != null) theDocument["backToShopAction"] = backToShopActionMap;
      else theDocument["backToShopAction"] = null;
    if (openProductAction != null) theDocument["openProductAction"] = openProductActionMap;
      else theDocument["openProductAction"] = null;
    return theDocument;
  }

  static CartEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

