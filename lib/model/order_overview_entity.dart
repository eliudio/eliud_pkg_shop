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
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class OrderOverviewEntity {
  final String appId;
  final String title;
  final String shopId;
  final String itemImageBackgroundId;
  final String itemDetailBackgroundId;

  OrderOverviewEntity({this.appId, this.title, this.shopId, this.itemImageBackgroundId, this.itemDetailBackgroundId, });


  List<Object> get props => [appId, title, shopId, itemImageBackgroundId, itemDetailBackgroundId, ];

  @override
  String toString() {
    return 'OrderOverviewEntity{appId: $appId, title: $title, shopId: $shopId, itemImageBackgroundId: $itemImageBackgroundId, itemDetailBackgroundId: $itemDetailBackgroundId}';
  }

  static OrderOverviewEntity fromMap(Map map) {
    if (map == null) return null;

    return OrderOverviewEntity(
      appId: map['appId'], 
      title: map['title'], 
      shopId: map['shopId'], 
      itemImageBackgroundId: map['itemImageBackgroundId'], 
      itemDetailBackgroundId: map['itemDetailBackgroundId'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    if (itemImageBackgroundId != null) theDocument["itemImageBackgroundId"] = itemImageBackgroundId;
      else theDocument["itemImageBackgroundId"] = null;
    if (itemDetailBackgroundId != null) theDocument["itemDetailBackgroundId"] = itemDetailBackgroundId;
      else theDocument["itemDetailBackgroundId"] = null;
    return theDocument;
  }

  static OrderOverviewEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

