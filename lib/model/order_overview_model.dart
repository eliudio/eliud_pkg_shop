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

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

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



class OrderOverviewModel {
  String? documentID;
  String? appId;
  String? title;
  ShopModel? shop;
  BackgroundModel? itemImageBackground;
  BackgroundModel? itemDetailBackground;
  ConditionsSimpleModel? conditions;

  OrderOverviewModel({this.documentID, this.appId, this.title, this.shop, this.itemImageBackground, this.itemDetailBackground, this.conditions, })  {
    assert(documentID != null);
  }

  OrderOverviewModel copyWith({String? documentID, String? appId, String? title, ShopModel? shop, BackgroundModel? itemImageBackground, BackgroundModel? itemDetailBackground, ConditionsSimpleModel? conditions, }) {
    return OrderOverviewModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, shop: shop ?? this.shop, itemImageBackground: itemImageBackground ?? this.itemImageBackground, itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ shop.hashCode ^ itemImageBackground.hashCode ^ itemDetailBackground.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is OrderOverviewModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          shop == other.shop &&
          itemImageBackground == other.itemImageBackground &&
          itemDetailBackground == other.itemDetailBackground &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'OrderOverviewModel{documentID: $documentID, appId: $appId, title: $title, shop: $shop, itemImageBackground: $itemImageBackground, itemDetailBackground: $itemDetailBackground, conditions: $conditions}';
  }

  OrderOverviewEntity toEntity({String? appId}) {
    return OrderOverviewEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          shopId: (shop != null) ? shop!.documentID : null, 
          itemImageBackgroundId: (itemImageBackground != null) ? itemImageBackground!.documentID : null, 
          itemDetailBackgroundId: (itemDetailBackground != null) ? itemDetailBackground!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static OrderOverviewModel? fromEntity(String documentID, OrderOverviewEntity? entity) {
    if (entity == null) return null;
    return OrderOverviewModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
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

    BackgroundModel? itemImageBackgroundHolder;
    if (entity.itemImageBackgroundId != null) {
      try {
          itemImageBackgroundHolder = await backgroundRepository(appId: appId)!.get(entity.itemImageBackgroundId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise itemImageBackground');
        print('Error whilst retrieving background with id ${entity.itemImageBackgroundId}');
        print('Exception: $e');
      }
    }

    BackgroundModel? itemDetailBackgroundHolder;
    if (entity.itemDetailBackgroundId != null) {
      try {
          itemDetailBackgroundHolder = await backgroundRepository(appId: appId)!.get(entity.itemDetailBackgroundId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise itemDetailBackground');
        print('Error whilst retrieving background with id ${entity.itemDetailBackgroundId}');
        print('Exception: $e');
      }
    }

    return OrderOverviewModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          shop: shopHolder, 
          itemImageBackground: itemImageBackgroundHolder, 
          itemDetailBackground: itemDetailBackgroundHolder, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

