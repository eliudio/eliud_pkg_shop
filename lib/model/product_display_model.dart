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


import 'package:eliud_pkg_shop/model/product_display_entity.dart';

import 'package:eliud_core/tools/random.dart';



class ProductDisplayModel {
  String documentID;
  String appId;
  String title;
  BackgroundModel itemDetailBackground;
  String addToBasketText;
  ActionModel buyAction;
  ShopModel shop;

  ProductDisplayModel({this.documentID, this.appId, this.title, this.itemDetailBackground, this.addToBasketText, this.buyAction, this.shop, })  {
    assert(documentID != null);
  }

  ProductDisplayModel copyWith({String documentID, String appId, String title, BackgroundModel itemDetailBackground, String addToBasketText, ActionModel buyAction, ShopModel shop, }) {
    return ProductDisplayModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground, addToBasketText: addToBasketText ?? this.addToBasketText, buyAction: buyAction ?? this.buyAction, shop: shop ?? this.shop, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ itemDetailBackground.hashCode ^ addToBasketText.hashCode ^ buyAction.hashCode ^ shop.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ProductDisplayModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          itemDetailBackground == other.itemDetailBackground &&
          addToBasketText == other.addToBasketText &&
          buyAction == other.buyAction &&
          shop == other.shop;

  @override
  String toString() {
    return 'ProductDisplayModel{documentID: $documentID, appId: $appId, title: $title, itemDetailBackground: $itemDetailBackground, addToBasketText: $addToBasketText, buyAction: $buyAction, shop: $shop}';
  }

  ProductDisplayEntity toEntity({String appId}) {
    return ProductDisplayEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          itemDetailBackgroundId: (itemDetailBackground != null) ? itemDetailBackground.documentID : null, 
          addToBasketText: (addToBasketText != null) ? addToBasketText : null, 
          buyAction: (buyAction != null) ? buyAction.toEntity(appId: appId) : null, 
          shopId: (shop != null) ? shop.documentID : null, 
    );
  }

  static ProductDisplayModel fromEntity(String documentID, ProductDisplayEntity entity) {
    if (entity == null) return null;
    return ProductDisplayModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          addToBasketText: entity.addToBasketText, 
          buyAction: 
            ActionModel.fromEntity(entity.buyAction), 
    );
  }

  static Future<ProductDisplayModel> fromEntityPlus(String documentID, ProductDisplayEntity entity, { String appId}) async {
    if (entity == null) return null;

    BackgroundModel itemDetailBackgroundHolder;
    if (entity.itemDetailBackgroundId != null) {
      try {
        await backgroundRepository(appId: appId).get(entity.itemDetailBackgroundId).then((val) {
          itemDetailBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    ShopModel shopHolder;
    if (entity.shopId != null) {
      try {
        await shopRepository(appId: appId).get(entity.shopId).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return ProductDisplayModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          itemDetailBackground: itemDetailBackgroundHolder, 
          addToBasketText: entity.addToBasketText, 
          buyAction: 
            await ActionModel.fromEntityPlus(entity.buyAction, appId: appId), 
          shop: shopHolder, 
    );
  }

}

