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
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class ProductDisplayEntity {
  final String appId;
  final String title;
  final String itemDetailBackgroundId;
  final String addToBasketText;
  final ActionEntity buyAction;
  final String shopId;

  ProductDisplayEntity({this.appId, this.title, this.itemDetailBackgroundId, this.addToBasketText, this.buyAction, this.shopId, });


  List<Object> get props => [appId, title, itemDetailBackgroundId, addToBasketText, buyAction, shopId, ];

  @override
  String toString() {
    return 'ProductDisplayEntity{appId: $appId, title: $title, itemDetailBackgroundId: $itemDetailBackgroundId, addToBasketText: $addToBasketText, buyAction: $buyAction, shopId: $shopId}';
  }

  static ProductDisplayEntity fromMap(Map map) {
    if (map == null) return null;

    var buyActionFromMap;
    buyActionFromMap = map['buyAction'];
    if (buyActionFromMap != null)
      buyActionFromMap = ActionEntity.fromMap(buyActionFromMap);

    return ProductDisplayEntity(
      appId: map['appId'], 
      title: map['title'], 
      itemDetailBackgroundId: map['itemDetailBackgroundId'], 
      addToBasketText: map['addToBasketText'], 
      buyAction: buyActionFromMap, 
      shopId: map['shopId'], 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> buyActionMap = buyAction != null 
        ? buyAction.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (itemDetailBackgroundId != null) theDocument["itemDetailBackgroundId"] = itemDetailBackgroundId;
      else theDocument["itemDetailBackgroundId"] = null;
    if (addToBasketText != null) theDocument["addToBasketText"] = addToBasketText;
      else theDocument["addToBasketText"] = null;
    if (buyAction != null) theDocument["buyAction"] = buyActionMap;
      else theDocument["buyAction"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    return theDocument;
  }

  static ProductDisplayEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}
