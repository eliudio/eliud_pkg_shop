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
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';

class PayConfirmationEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? shopId;
  final ActionEntity? backToShopAction;
  final StorageConditionsEntity? conditions;

  PayConfirmationEntity({
    required this.appId,
    this.description,
    this.shopId,
    this.backToShopAction,
    this.conditions,
  });

  PayConfirmationEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? shopId,
    ActionEntity? backToShopAction,
    StorageConditionsEntity? conditions,
  }) {
    return PayConfirmationEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      shopId: shopId ?? this.shopId,
      backToShopAction: backToShopAction ?? this.backToShopAction,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        shopId,
        backToShopAction,
        conditions,
      ];

  @override
  String toString() {
    return 'PayConfirmationEntity{appId: $appId, description: $description, shopId: $shopId, backToShopAction: $backToShopAction, conditions: $conditions}';
  }

  static PayConfirmationEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var backToShopActionFromMap = map['backToShopAction'];
    if (backToShopActionFromMap != null) {
      backToShopActionFromMap = ActionEntity.fromMap(backToShopActionFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return PayConfirmationEntity(
      appId: map['appId'],
      description: map['description'],
      shopId: map['shopId'],
      backToShopAction: backToShopActionFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? backToShopActionMap =
        backToShopAction != null ? backToShopAction!.toDocument() : null;
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
    if (shopId != null) {
      theDocument["shopId"] = shopId;
    } else {
      theDocument["shopId"] = null;
    }
    if (backToShopAction != null) {
      theDocument["backToShopAction"] = backToShopActionMap;
    } else {
      theDocument["backToShopAction"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  PayConfirmationEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static PayConfirmationEntity? fromJsonString(String json,
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
