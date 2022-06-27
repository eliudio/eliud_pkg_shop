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
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class OrderOverviewEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? shopId;
  final BackgroundEntity? itemImageBackground;
  final BackgroundEntity? itemDetailBackground;
  final StorageConditionsEntity? conditions;

  OrderOverviewEntity({required this.appId, this.description, this.shopId, this.itemImageBackground, this.itemDetailBackground, this.conditions, });


  List<Object?> get props => [appId, description, shopId, itemImageBackground, itemDetailBackground, conditions, ];

  @override
  String toString() {
    return 'OrderOverviewEntity{appId: $appId, description: $description, shopId: $shopId, itemImageBackground: $itemImageBackground, itemDetailBackground: $itemDetailBackground, conditions: $conditions}';
  }

  static OrderOverviewEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var itemImageBackgroundFromMap;
    itemImageBackgroundFromMap = map['itemImageBackground'];
    if (itemImageBackgroundFromMap != null)
      itemImageBackgroundFromMap = BackgroundEntity.fromMap(itemImageBackgroundFromMap);
    var itemDetailBackgroundFromMap;
    itemDetailBackgroundFromMap = map['itemDetailBackground'];
    if (itemDetailBackgroundFromMap != null)
      itemDetailBackgroundFromMap = BackgroundEntity.fromMap(itemDetailBackgroundFromMap);
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return OrderOverviewEntity(
      appId: map['appId'], 
      description: map['description'], 
      shopId: map['shopId'], 
      itemImageBackground: itemImageBackgroundFromMap, 
      itemDetailBackground: itemDetailBackgroundFromMap, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? itemImageBackgroundMap = itemImageBackground != null 
        ? itemImageBackground!.toDocument()
        : null;
    final Map<String, dynamic>? itemDetailBackgroundMap = itemDetailBackground != null 
        ? itemDetailBackground!.toDocument()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    if (itemImageBackground != null) theDocument["itemImageBackground"] = itemImageBackgroundMap;
      else theDocument["itemImageBackground"] = null;
    if (itemDetailBackground != null) theDocument["itemDetailBackground"] = itemDetailBackgroundMap;
      else theDocument["itemDetailBackground"] = null;
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

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

