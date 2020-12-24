/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_model.dart
                       
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


import 'package:eliud_pkg_shop/model/cart_entity.dart';

import 'package:eliud_core/tools/random.dart';



class CartModel {
  String documentID;
  String appId;
  String title;
  String description;
  String checkoutText;
  ShopModel shop;
  BackgroundModel itemImageBackground;
  BackgroundModel itemDetailBackground;
  ActionModel checkoutAction;
  ActionModel backToShopAction;
  ActionModel openProductAction;

  CartModel({this.documentID, this.appId, this.title, this.description, this.checkoutText, this.shop, this.itemImageBackground, this.itemDetailBackground, this.checkoutAction, this.backToShopAction, this.openProductAction, })  {
    assert(documentID != null);
  }

  CartModel copyWith({String documentID, String appId, String title, String description, String checkoutText, ShopModel shop, BackgroundModel itemImageBackground, BackgroundModel itemDetailBackground, ActionModel checkoutAction, ActionModel backToShopAction, ActionModel openProductAction, }) {
    return CartModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, description: description ?? this.description, checkoutText: checkoutText ?? this.checkoutText, shop: shop ?? this.shop, itemImageBackground: itemImageBackground ?? this.itemImageBackground, itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground, checkoutAction: checkoutAction ?? this.checkoutAction, backToShopAction: backToShopAction ?? this.backToShopAction, openProductAction: openProductAction ?? this.openProductAction, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ description.hashCode ^ checkoutText.hashCode ^ shop.hashCode ^ itemImageBackground.hashCode ^ itemDetailBackground.hashCode ^ checkoutAction.hashCode ^ backToShopAction.hashCode ^ openProductAction.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is CartModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          description == other.description &&
          checkoutText == other.checkoutText &&
          shop == other.shop &&
          itemImageBackground == other.itemImageBackground &&
          itemDetailBackground == other.itemDetailBackground &&
          checkoutAction == other.checkoutAction &&
          backToShopAction == other.backToShopAction &&
          openProductAction == other.openProductAction;

  @override
  String toString() {
    return 'CartModel{documentID: $documentID, appId: $appId, title: $title, description: $description, checkoutText: $checkoutText, shop: $shop, itemImageBackground: $itemImageBackground, itemDetailBackground: $itemDetailBackground, checkoutAction: $checkoutAction, backToShopAction: $backToShopAction, openProductAction: $openProductAction}';
  }

  CartEntity toEntity({String appId}) {
    return CartEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
          checkoutText: (checkoutText != null) ? checkoutText : null, 
          shopId: (shop != null) ? shop.documentID : null, 
          itemImageBackgroundId: (itemImageBackground != null) ? itemImageBackground.documentID : null, 
          itemDetailBackgroundId: (itemDetailBackground != null) ? itemDetailBackground.documentID : null, 
          checkoutAction: (checkoutAction != null) ? checkoutAction.toEntity(appId: appId) : null, 
          backToShopAction: (backToShopAction != null) ? backToShopAction.toEntity(appId: appId) : null, 
          openProductAction: (openProductAction != null) ? openProductAction.toEntity(appId: appId) : null, 
    );
  }

  static CartModel fromEntity(String documentID, CartEntity entity) {
    if (entity == null) return null;
    return CartModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
          checkoutText: entity.checkoutText, 
          checkoutAction: 
            ActionModel.fromEntity(entity.checkoutAction), 
          backToShopAction: 
            ActionModel.fromEntity(entity.backToShopAction), 
          openProductAction: 
            ActionModel.fromEntity(entity.openProductAction), 
    );
  }

  static Future<CartModel> fromEntityPlus(String documentID, CartEntity entity, { String appId}) async {
    if (entity == null) return null;

    ShopModel shopHolder;
    if (entity.shopId != null) {
      try {
        await shopRepository(appId: appId).get(entity.shopId).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel itemImageBackgroundHolder;
    if (entity.itemImageBackgroundId != null) {
      try {
        await backgroundRepository(appId: appId).get(entity.itemImageBackgroundId).then((val) {
          itemImageBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel itemDetailBackgroundHolder;
    if (entity.itemDetailBackgroundId != null) {
      try {
        await backgroundRepository(appId: appId).get(entity.itemDetailBackgroundId).then((val) {
          itemDetailBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return CartModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
          checkoutText: entity.checkoutText, 
          shop: shopHolder, 
          itemImageBackground: itemImageBackgroundHolder, 
          itemDetailBackground: itemDetailBackgroundHolder, 
          checkoutAction: 
            await ActionModel.fromEntityPlus(entity.checkoutAction, appId: appId), 
          backToShopAction: 
            await ActionModel.fromEntityPlus(entity.backToShopAction, appId: appId), 
          openProductAction: 
            await ActionModel.fromEntityPlus(entity.openProductAction, appId: appId), 
    );
  }

}

