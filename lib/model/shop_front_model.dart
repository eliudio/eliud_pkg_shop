/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_model.dart
                       
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


import 'package:eliud_pkg_shop/model/shop_front_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum ShopFrontView {
  Slider, Grid, Unknown
}

enum ScrollDirection {
  Horizontal, Vertical, Unknown
}


ShopFrontView toShopFrontView(int? index) {
  switch (index) {
    case 0: return ShopFrontView.Slider;
    case 1: return ShopFrontView.Grid;
  }
  return ShopFrontView.Unknown;
}

ScrollDirection toScrollDirection(int? index) {
  switch (index) {
    case 0: return ScrollDirection.Horizontal;
    case 1: return ScrollDirection.Vertical;
  }
  return ScrollDirection.Unknown;
}


class ShopFrontModel {
  String? documentID;
  String? appId;
  String? title;
  String? description;
  ShopModel? shop;
  double? size;
  double? cardElevation;
  double? cardAxisSpacing;
  BackgroundModel? itemCardBackground;
  RgbModel? addToCartColor;
  ShopFrontView? view;
  ScrollDirection? scrollDirection;
  ActionModel? buyAction;
  ActionModel? openProductAction;
  ConditionsSimpleModel? conditions;

  ShopFrontModel({this.documentID, this.appId, this.title, this.description, this.shop, this.size, this.cardElevation, this.cardAxisSpacing, this.itemCardBackground, this.addToCartColor, this.view, this.scrollDirection, this.buyAction, this.openProductAction, this.conditions, })  {
    assert(documentID != null);
  }

  ShopFrontModel copyWith({String? documentID, String? appId, String? title, String? description, ShopModel? shop, double? size, double? cardElevation, double? cardAxisSpacing, BackgroundModel? itemCardBackground, RgbModel? addToCartColor, ShopFrontView? view, ScrollDirection? scrollDirection, ActionModel? buyAction, ActionModel? openProductAction, ConditionsSimpleModel? conditions, }) {
    return ShopFrontModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, description: description ?? this.description, shop: shop ?? this.shop, size: size ?? this.size, cardElevation: cardElevation ?? this.cardElevation, cardAxisSpacing: cardAxisSpacing ?? this.cardAxisSpacing, itemCardBackground: itemCardBackground ?? this.itemCardBackground, addToCartColor: addToCartColor ?? this.addToCartColor, view: view ?? this.view, scrollDirection: scrollDirection ?? this.scrollDirection, buyAction: buyAction ?? this.buyAction, openProductAction: openProductAction ?? this.openProductAction, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ description.hashCode ^ shop.hashCode ^ size.hashCode ^ cardElevation.hashCode ^ cardAxisSpacing.hashCode ^ itemCardBackground.hashCode ^ addToCartColor.hashCode ^ view.hashCode ^ scrollDirection.hashCode ^ buyAction.hashCode ^ openProductAction.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ShopFrontModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          description == other.description &&
          shop == other.shop &&
          size == other.size &&
          cardElevation == other.cardElevation &&
          cardAxisSpacing == other.cardAxisSpacing &&
          itemCardBackground == other.itemCardBackground &&
          addToCartColor == other.addToCartColor &&
          view == other.view &&
          scrollDirection == other.scrollDirection &&
          buyAction == other.buyAction &&
          openProductAction == other.openProductAction &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'ShopFrontModel{documentID: $documentID, appId: $appId, title: $title, description: $description, shop: $shop, size: $size, cardElevation: $cardElevation, cardAxisSpacing: $cardAxisSpacing, itemCardBackground: $itemCardBackground, addToCartColor: $addToCartColor, view: $view, scrollDirection: $scrollDirection, buyAction: $buyAction, openProductAction: $openProductAction, conditions: $conditions}';
  }

  ShopFrontEntity toEntity({String? appId}) {
    return ShopFrontEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
          shopId: (shop != null) ? shop!.documentID : null, 
          size: (size != null) ? size : null, 
          cardElevation: (cardElevation != null) ? cardElevation : null, 
          cardAxisSpacing: (cardAxisSpacing != null) ? cardAxisSpacing : null, 
          itemCardBackgroundId: (itemCardBackground != null) ? itemCardBackground!.documentID : null, 
          addToCartColor: (addToCartColor != null) ? addToCartColor!.toEntity(appId: appId) : null, 
          view: (view != null) ? view!.index : null, 
          scrollDirection: (scrollDirection != null) ? scrollDirection!.index : null, 
          buyAction: (buyAction != null) ? buyAction!.toEntity(appId: appId) : null, 
          openProductAction: (openProductAction != null) ? openProductAction!.toEntity(appId: appId) : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static ShopFrontModel? fromEntity(String documentID, ShopFrontEntity? entity) {
    if (entity == null) return null;
    return ShopFrontModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
          size: entity.size, 
          cardElevation: entity.cardElevation, 
          cardAxisSpacing: entity.cardAxisSpacing, 
          addToCartColor: 
            RgbModel.fromEntity(entity.addToCartColor), 
          view: toShopFrontView(entity.view), 
          scrollDirection: toScrollDirection(entity.scrollDirection), 
          buyAction: 
            ActionModel.fromEntity(entity.buyAction), 
          openProductAction: 
            ActionModel.fromEntity(entity.openProductAction), 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<ShopFrontModel?> fromEntityPlus(String documentID, ShopFrontEntity? entity, { String? appId}) async {
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

    BackgroundModel? itemCardBackgroundHolder;
    if (entity.itemCardBackgroundId != null) {
      try {
          itemCardBackgroundHolder = await backgroundRepository(appId: appId)!.get(entity.itemCardBackgroundId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise itemCardBackground');
        print('Error whilst retrieving background with id ${entity.itemCardBackgroundId}');
        print('Exception: $e');
      }
    }

    return ShopFrontModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
          shop: shopHolder, 
          size: entity.size, 
          cardElevation: entity.cardElevation, 
          cardAxisSpacing: entity.cardAxisSpacing, 
          itemCardBackground: itemCardBackgroundHolder, 
          addToCartColor: 
            await RgbModel.fromEntityPlus(entity.addToCartColor, appId: appId), 
          view: toShopFrontView(entity.view), 
          scrollDirection: toScrollDirection(entity.scrollDirection), 
          buyAction: 
            await ActionModel.fromEntityPlus(entity.buyAction, appId: appId), 
          openProductAction: 
            await ActionModel.fromEntityPlus(entity.openProductAction, appId: appId), 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

