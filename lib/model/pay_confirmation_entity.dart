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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class PayConfirmationEntity {
  final String? appId;
  final String? description;
  final String? shopId;
  final ActionEntity? backToShopAction;
  final StorageConditionsEntity? conditions;

  PayConfirmationEntity({this.appId, this.description, this.shopId, this.backToShopAction, this.conditions, });


  List<Object?> get props => [appId, description, shopId, backToShopAction, conditions, ];

  @override
  String toString() {
    return 'PayConfirmationEntity{appId: $appId, description: $description, shopId: $shopId, backToShopAction: $backToShopAction, conditions: $conditions}';
  }

  static PayConfirmationEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var backToShopActionFromMap;
    backToShopActionFromMap = map['backToShopAction'];
    if (backToShopActionFromMap != null)
      backToShopActionFromMap = ActionEntity.fromMap(backToShopActionFromMap);
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return PayConfirmationEntity(
      appId: map['appId'], 
      description: map['description'], 
      shopId: map['shopId'], 
      backToShopAction: backToShopActionFromMap, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? backToShopActionMap = backToShopAction != null 
        ? backToShopAction!.toDocument()
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
    if (backToShopAction != null) theDocument["backToShopAction"] = backToShopActionMap;
      else theDocument["backToShopAction"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static PayConfirmationEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

