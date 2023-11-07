/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';

class PayEntity implements EntityBase {
  final String? appId;
  final String? description;
  final ActionEntity? succeeded;
  final ActionEntity? payAction;
  final String? shopId;
  final StorageConditionsEntity? conditions;

  PayEntity({
    required this.appId,
    this.description,
    this.succeeded,
    this.payAction,
    this.shopId,
    this.conditions,
  });

  PayEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    ActionEntity? succeeded,
    ActionEntity? payAction,
    String? shopId,
    StorageConditionsEntity? conditions,
  }) {
    return PayEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      succeeded: succeeded ?? this.succeeded,
      payAction: payAction ?? this.payAction,
      shopId: shopId ?? this.shopId,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        succeeded,
        payAction,
        shopId,
        conditions,
      ];

  @override
  String toString() {
    return 'PayEntity{appId: $appId, description: $description, succeeded: $succeeded, payAction: $payAction, shopId: $shopId, conditions: $conditions}';
  }

  static PayEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var succeededFromMap = map['succeeded'];
    if (succeededFromMap != null) {
      succeededFromMap = ActionEntity.fromMap(succeededFromMap,
          newDocumentIds: newDocumentIds);
    }
    var payActionFromMap = map['payAction'];
    if (payActionFromMap != null) {
      payActionFromMap = ActionEntity.fromMap(payActionFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return PayEntity(
      appId: map['appId'],
      description: map['description'],
      succeeded: succeededFromMap,
      payAction: payActionFromMap,
      shopId: map['shopId'],
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? succeededMap =
        succeeded != null ? succeeded!.toDocument() : null;
    final Map<String, dynamic>? payActionMap =
        payAction != null ? payAction!.toDocument() : null;
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (succeeded != null) {
      theDocument["succeeded"] = succeededMap;
    } else {
      theDocument["succeeded"] = null;
    }
    if (payAction != null) {
      theDocument["payAction"] = payActionMap;
    } else {
      theDocument["payAction"] = null;
    }
    if (shopId != null) {
      theDocument["shopId"] = shopId;
    } else {
      theDocument["shopId"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  PayEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static PayEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
