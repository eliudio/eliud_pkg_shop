/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/order_overview_entity.dart';

import 'package:eliud_core/tools/random.dart';



class OrderOverviewModel implements ModelBase, WithAppId {
  String documentID;
  String appId;
  String? description;
  ShopModel? shop;
  BackgroundModel? itemImageBackground;
  BackgroundModel? itemDetailBackground;
  StorageConditionsModel? conditions;

  OrderOverviewModel({required this.documentID, required this.appId, this.description, this.shop, this.itemImageBackground, this.itemDetailBackground, this.conditions, })  {
    assert(documentID != null);
  }

  OrderOverviewModel copyWith({String? documentID, String? appId, String? description, ShopModel? shop, BackgroundModel? itemImageBackground, BackgroundModel? itemDetailBackground, StorageConditionsModel? conditions, }) {
    return OrderOverviewModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, shop: shop ?? this.shop, itemImageBackground: itemImageBackground ?? this.itemImageBackground, itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ shop.hashCode ^ itemImageBackground.hashCode ^ itemDetailBackground.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is OrderOverviewModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          shop == other.shop &&
          itemImageBackground == other.itemImageBackground &&
          itemDetailBackground == other.itemDetailBackground &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'OrderOverviewModel{documentID: $documentID, appId: $appId, description: $description, shop: $shop, itemImageBackground: $itemImageBackground, itemDetailBackground: $itemDetailBackground, conditions: $conditions}';
  }

  OrderOverviewEntity toEntity({String? appId, List<ModelBase>? referencesCollector}) {
    if (referencesCollector != null) {
      if (shop != null) referencesCollector.add(shop!);
    }
    return OrderOverviewEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          shopId: (shop != null) ? shop!.documentID : null, 
          itemImageBackground: (itemImageBackground != null) ? itemImageBackground!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          itemDetailBackground: (itemDetailBackground != null) ? itemDetailBackground!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
    );
  }

  static Future<OrderOverviewModel?> fromEntity(String documentID, OrderOverviewEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return OrderOverviewModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          itemImageBackground: 
            await BackgroundModel.fromEntity(entity.itemImageBackground), 
          itemDetailBackground: 
            await BackgroundModel.fromEntity(entity.itemDetailBackground), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<OrderOverviewModel?> fromEntityPlus(String documentID, OrderOverviewEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    ShopModel? shopHolder;
    if (entity.shopId != null) {
      try {
          shopHolder = await shopRepository(appId: appId)!.get(entity.shopId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise shop');
        print('Error whilst retrieving shop with id ${entity.shopId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return OrderOverviewModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          shop: shopHolder, 
          itemImageBackground: 
            await BackgroundModel.fromEntityPlus(entity.itemImageBackground, appId: appId), 
          itemDetailBackground: 
            await BackgroundModel.fromEntityPlus(entity.itemDetailBackground, appId: appId), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

