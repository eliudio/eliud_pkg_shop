/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class ShopEntity {
  final String appId;
  final String description;
  final String shortDescription;
  final String currency;

  ShopEntity({this.appId, this.description, this.shortDescription, this.currency, });


  List<Object> get props => [appId, description, shortDescription, currency, ];

  @override
  String toString() {
    return 'ShopEntity{appId: $appId, description: $description, shortDescription: $shortDescription, currency: $currency}';
  }

  static ShopEntity fromMap(Map map) {
    if (map == null) return null;

    return ShopEntity(
      appId: map['appId'], 
      description: map['description'], 
      shortDescription: map['shortDescription'], 
      currency: map['currency'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (shortDescription != null) theDocument["shortDescription"] = shortDescription;
      else theDocument["shortDescription"] = null;
    if (currency != null) theDocument["currency"] = currency;
      else theDocument["currency"] = null;
    return theDocument;
  }

  static ShopEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

