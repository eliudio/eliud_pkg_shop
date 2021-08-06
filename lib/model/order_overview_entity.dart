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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class OrderOverviewEntity {
  final String? appId;
  final String? title;
  final String? shopId;
  final String? itemImageBackgroundId;
  final String? itemDetailBackgroundId;
  final ConditionsSimpleEntity? conditions;

  OrderOverviewEntity({this.appId, this.title, this.shopId, this.itemImageBackgroundId, this.itemDetailBackgroundId, this.conditions, });


  List<Object?> get props => [appId, title, shopId, itemImageBackgroundId, itemDetailBackgroundId, conditions, ];

  @override
  String toString() {
    return 'OrderOverviewEntity{appId: $appId, title: $title, shopId: $shopId, itemImageBackgroundId: $itemImageBackgroundId, itemDetailBackgroundId: $itemDetailBackgroundId, conditions: $conditions}';
  }

  static OrderOverviewEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return OrderOverviewEntity(
      appId: map['appId'], 
      title: map['title'], 
      shopId: map['shopId'], 
      itemImageBackgroundId: map['itemImageBackgroundId'], 
      itemDetailBackgroundId: map['itemDetailBackgroundId'], 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
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
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static OrderOverviewEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

