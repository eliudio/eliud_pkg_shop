/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class PayConfirmationEntity {
  final String appId;
  final String title;
  final String shopId;
  final ActionEntity backToShopAction;

  PayConfirmationEntity({this.appId, this.title, this.shopId, this.backToShopAction, });

  List<Object> get props => [appId, title, shopId, backToShopAction, ];

  @override
  String toString() {
    return 'PayConfirmationEntity{appId: $appId, title: $title, shopId: $shopId, backToShopAction: $backToShopAction}';
  }

  static PayConfirmationEntity fromMap(Map map) {
    if (map == null) return null;

    var backToShopActionFromMap;
    backToShopActionFromMap = map['backToShopAction'];
    if (backToShopActionFromMap != null)
      backToShopActionFromMap = ActionEntity.fromMap(backToShopActionFromMap);

    return PayConfirmationEntity(
      appId: map['appId'], 
      title: map['title'], 
      shopId: map['shopId'], 
      backToShopAction: backToShopActionFromMap, 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> backToShopActionMap = backToShopAction != null 
        ? backToShopAction.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    if (backToShopAction != null) theDocument["backToShopAction"] = backToShopActionMap;
      else theDocument["backToShopAction"] = null;
    return theDocument;
  }

  static PayConfirmationEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

