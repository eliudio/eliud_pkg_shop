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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class ShopEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? shortDescription;
  final String? currency;

  ShopEntity({required this.appId, this.description, this.shortDescription, this.currency, });

  ShopEntity copyWith({String? documentID, String? appId, String? description, String? shortDescription, String? currency, }) {
    return ShopEntity(appId : appId ?? this.appId, description : description ?? this.description, shortDescription : shortDescription ?? this.shortDescription, currency : currency ?? this.currency, );
  }
  List<Object?> get props => [appId, description, shortDescription, currency, ];

  @override
  String toString() {
    return 'ShopEntity{appId: $appId, description: $description, shortDescription: $shortDescription, currency: $currency}';
  }

  static ShopEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return ShopEntity(
      appId: map['appId'], 
      description: map['description'], 
      shortDescription: map['shortDescription'], 
      currency: map['currency'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
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

  @override
  ShopEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static ShopEntity? fromJsonString(String json) {
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

