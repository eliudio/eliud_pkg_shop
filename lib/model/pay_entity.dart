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
import 'entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';
class PayEntity {
  final String appId;
  final String title;
  final ActionEntity succeeded;
  final String shopId;

  PayEntity({this.appId, this.title, this.succeeded, this.shopId, });

  List<Object> get props => [appId, title, succeeded, shopId, ];

  @override
  String toString() {
    return 'PayEntity{appId: $appId, title: $title, succeeded: $succeeded, shopId: $shopId}';
  }

  static PayEntity fromMap(Map map) {
    if (map == null) return null;

    var succeededFromMap;
    succeededFromMap = map['succeeded'];
    if (succeededFromMap != null)
      succeededFromMap = ActionEntity.fromMap(succeededFromMap);

    return PayEntity(
      appId: map['appId'], 
      title: map['title'], 
      succeeded: succeededFromMap, 
      shopId: map['shopId'], 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> succeededMap = succeeded != null 
        ? succeeded.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (succeeded != null) theDocument["succeeded"] = succeededMap;
      else theDocument["succeeded"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    return theDocument;
  }

  static PayEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

