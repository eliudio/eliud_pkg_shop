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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class ProductDisplayEntity implements EntityBase {
  final String? appId;
  final String? description;
  final BackgroundEntity? itemDetailBackground;
  final String? addToBasketText;
  final ActionEntity? buyAction;
  final String? shopId;
  final StorageConditionsEntity? conditions;

  ProductDisplayEntity({required this.appId, this.description, this.itemDetailBackground, this.addToBasketText, this.buyAction, this.shopId, this.conditions, });


  List<Object?> get props => [appId, description, itemDetailBackground, addToBasketText, buyAction, shopId, conditions, ];

  @override
  String toString() {
    return 'ProductDisplayEntity{appId: $appId, description: $description, itemDetailBackground: $itemDetailBackground, addToBasketText: $addToBasketText, buyAction: $buyAction, shopId: $shopId, conditions: $conditions}';
  }

  static ProductDisplayEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var itemDetailBackgroundFromMap;
    itemDetailBackgroundFromMap = map['itemDetailBackground'];
    if (itemDetailBackgroundFromMap != null)
      itemDetailBackgroundFromMap = BackgroundEntity.fromMap(itemDetailBackgroundFromMap);
    var buyActionFromMap;
    buyActionFromMap = map['buyAction'];
    if (buyActionFromMap != null)
      buyActionFromMap = ActionEntity.fromMap(buyActionFromMap);
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return ProductDisplayEntity(
      appId: map['appId'], 
      description: map['description'], 
      itemDetailBackground: itemDetailBackgroundFromMap, 
      addToBasketText: map['addToBasketText'], 
      buyAction: buyActionFromMap, 
      shopId: map['shopId'], 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? itemDetailBackgroundMap = itemDetailBackground != null 
        ? itemDetailBackground!.toDocument()
        : null;
    final Map<String, dynamic>? buyActionMap = buyAction != null 
        ? buyAction!.toDocument()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (itemDetailBackground != null) theDocument["itemDetailBackground"] = itemDetailBackgroundMap;
      else theDocument["itemDetailBackground"] = null;
    if (addToBasketText != null) theDocument["addToBasketText"] = addToBasketText;
      else theDocument["addToBasketText"] = null;
    if (buyAction != null) theDocument["buyAction"] = buyActionMap;
      else theDocument["buyAction"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static ProductDisplayEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

