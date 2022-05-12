/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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


import 'package:eliud_pkg_shop/model/product_display_entity.dart';

import 'package:eliud_core/tools/random.dart';



class ProductDisplayModel {
  String? documentID;
  String? appId;
  String? description;
  BackgroundModel? itemDetailBackground;
  String? addToBasketText;
  ActionModel? buyAction;
  ShopModel? shop;
  StorageConditionsModel? conditions;

  ProductDisplayModel({this.documentID, this.appId, this.description, this.itemDetailBackground, this.addToBasketText, this.buyAction, this.shop, this.conditions, })  {
    assert(documentID != null);
  }

  ProductDisplayModel copyWith({String? documentID, String? appId, String? description, BackgroundModel? itemDetailBackground, String? addToBasketText, ActionModel? buyAction, ShopModel? shop, StorageConditionsModel? conditions, }) {
    return ProductDisplayModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground, addToBasketText: addToBasketText ?? this.addToBasketText, buyAction: buyAction ?? this.buyAction, shop: shop ?? this.shop, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ itemDetailBackground.hashCode ^ addToBasketText.hashCode ^ buyAction.hashCode ^ shop.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ProductDisplayModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          itemDetailBackground == other.itemDetailBackground &&
          addToBasketText == other.addToBasketText &&
          buyAction == other.buyAction &&
          shop == other.shop &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'ProductDisplayModel{documentID: $documentID, appId: $appId, description: $description, itemDetailBackground: $itemDetailBackground, addToBasketText: $addToBasketText, buyAction: $buyAction, shop: $shop, conditions: $conditions}';
  }

  ProductDisplayEntity toEntity({String? appId}) {
    return ProductDisplayEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          itemDetailBackground: (itemDetailBackground != null) ? itemDetailBackground!.toEntity(appId: appId) : null, 
          addToBasketText: (addToBasketText != null) ? addToBasketText : null, 
          buyAction: (buyAction != null) ? buyAction!.toEntity(appId: appId) : null, 
          shopId: (shop != null) ? shop!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<ProductDisplayModel?> fromEntity(String documentID, ProductDisplayEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return ProductDisplayModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          itemDetailBackground: 
            await BackgroundModel.fromEntity(entity.itemDetailBackground), 
          addToBasketText: entity.addToBasketText, 
          buyAction: 
            await ActionModel.fromEntity(entity.buyAction), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<ProductDisplayModel?> fromEntityPlus(String documentID, ProductDisplayEntity? entity, { String? appId}) async {
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
    return ProductDisplayModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          itemDetailBackground: 
            await BackgroundModel.fromEntityPlus(entity.itemDetailBackground, appId: appId), 
          addToBasketText: entity.addToBasketText, 
          buyAction: 
            await ActionModel.fromEntityPlus(entity.buyAction, appId: appId), 
          shop: shopHolder, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

