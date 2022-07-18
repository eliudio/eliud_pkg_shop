/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/shop_entity.dart';

import 'package:eliud_core/tools/random.dart';



class ShopModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'shops';

  String documentID;
  String appId;
  String? description;
  String? shortDescription;
  String? currency;

  ShopModel({required this.documentID, required this.appId, this.description, this.shortDescription, this.currency, })  {
    assert(documentID != null);
  }

  ShopModel copyWith({String? documentID, String? appId, String? description, String? shortDescription, String? currency, }) {
    return ShopModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, shortDescription: shortDescription ?? this.shortDescription, currency: currency ?? this.currency, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ shortDescription.hashCode ^ currency.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ShopModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          shortDescription == other.shortDescription &&
          currency == other.currency;

  @override
  String toString() {
    return 'ShopModel{documentID: $documentID, appId: $appId, description: $description, shortDescription: $shortDescription, currency: $currency}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    var products = await productRepository(appId: appId)!.valuesListWithDetails(eliudQuery: EliudQuery(theConditions: [
      EliudQueryCondition('shopId', isEqualTo: documentID),
    ]));
    referencesCollector.addAll(products.map((product) => ModelReference(ProductModel.packageName, ProductModel.id, product!)));
    return referencesCollector;
  }

  ShopEntity toEntity({String? appId}) {
    return ShopEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          shortDescription: (shortDescription != null) ? shortDescription : null, 
          currency: (currency != null) ? currency : null, 
    );
  }

  static Future<ShopModel?> fromEntity(String documentID, ShopEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return ShopModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          shortDescription: entity.shortDescription, 
          currency: entity.currency, 
    );
  }

  static Future<ShopModel?> fromEntityPlus(String documentID, ShopEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return ShopModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          shortDescription: entity.shortDescription, 
          currency: entity.currency, 
    );
  }

}

