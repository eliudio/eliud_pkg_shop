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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class PayEntity {
  final String? appId;
  final String? title;
  final ActionEntity? succeeded;
  final WorkflowActionEntity? payAction;
  final String? shopId;
  final ConditionsSimpleEntity? conditions;

  PayEntity({this.appId, this.title, this.succeeded, this.payAction, this.shopId, this.conditions, });


  List<Object?> get props => [appId, title, succeeded, payAction, shopId, conditions, ];

  @override
  String toString() {
    return 'PayEntity{appId: $appId, title: $title, succeeded: $succeeded, payAction: $payAction, shopId: $shopId, conditions: $conditions}';
  }

  static PayEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var succeededFromMap;
    succeededFromMap = map['succeeded'];
    if (succeededFromMap != null)
      succeededFromMap = ActionEntity.fromMap(succeededFromMap);
    var payActionFromMap;
    payActionFromMap = map['payAction'];
    if (payActionFromMap != null)
      payActionFromMap = WorkflowActionEntity.fromMap(payActionFromMap);
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return PayEntity(
      appId: map['appId'], 
      title: map['title'], 
      succeeded: succeededFromMap, 
      payAction: payActionFromMap, 
      shopId: map['shopId'], 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? succeededMap = succeeded != null 
        ? succeeded!.toDocument()
        : null;
    final Map<String, dynamic>? payActionMap = payAction != null 
        ? payAction!.toDocument()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (succeeded != null) theDocument["succeeded"] = succeededMap;
      else theDocument["succeeded"] = null;
    if (payAction != null) theDocument["payAction"] = payActionMap;
      else theDocument["payAction"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static PayEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

