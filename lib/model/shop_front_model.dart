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

import 'package:eliud_model/core/global_data.dart';

// import the main classes
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_model/model/abstract_repository_singleton.dart';
import 'package:eliud_model/model/repository_export.dart';
import 'package:eliud_model/model/model_export.dart';
import 'package:eliud_model/shared/action_model.dart';
import 'package:eliud_model/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import '../model/model_export.dart';
import '../model/entity_export.dart';


import 'shop_front_entity.dart';
import 'package:eliud_model/tools/random.dart';

enum ShopFrontView {
  Slider, Grid, Unknown
}

enum ScrollDirection {
  Horizontal, Vertical, Unknown
}


ShopFrontView toShopFrontView(int index) {
  switch (index) {
    case 0: return ShopFrontView.Slider;
    case 1: return ShopFrontView.Grid;
  }
  return ShopFrontView.Unknown;
}

ScrollDirection toScrollDirection(int index) {
  switch (index) {
    case 0: return ScrollDirection.Horizontal;
    case 1: return ScrollDirection.Vertical;
  }
  return ScrollDirection.Unknown;
}


class ShopFrontModel {
  String documentID;
  String appId;
  String title;
  String description;
  String addToBasketText;
  ShopModel shop;
  double size;
  double cardElevation;
  double cardAxisSpacing;
  BackgroundModel itemCardBackground;
  BackgroundModel itemDetailBackground;
  RgbModel addToCartColor;
  ShopFrontView view;
  ScrollDirection scrollDirection;
  ActionModel buyAction;

  ShopFrontModel({this.documentID, this.appId, this.title, this.description, this.addToBasketText, this.shop, this.size, this.cardElevation, this.cardAxisSpacing, this.itemCardBackground, this.itemDetailBackground, this.addToCartColor, this.view, this.scrollDirection, this.buyAction, })  {
    assert(documentID != null);
  }

  ShopFrontModel copyWith({String documentID, String appId, String title, String description, String addToBasketText, ShopModel shop, double size, double cardElevation, double cardAxisSpacing, BackgroundModel itemCardBackground, BackgroundModel itemDetailBackground, RgbModel addToCartColor, ShopFrontView view, ScrollDirection scrollDirection, ActionModel buyAction, }) {
    return ShopFrontModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, description: description ?? this.description, addToBasketText: addToBasketText ?? this.addToBasketText, shop: shop ?? this.shop, size: size ?? this.size, cardElevation: cardElevation ?? this.cardElevation, cardAxisSpacing: cardAxisSpacing ?? this.cardAxisSpacing, itemCardBackground: itemCardBackground ?? this.itemCardBackground, itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground, addToCartColor: addToCartColor ?? this.addToCartColor, view: view ?? this.view, scrollDirection: scrollDirection ?? this.scrollDirection, buyAction: buyAction ?? this.buyAction, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ description.hashCode ^ addToBasketText.hashCode ^ shop.hashCode ^ size.hashCode ^ cardElevation.hashCode ^ cardAxisSpacing.hashCode ^ itemCardBackground.hashCode ^ itemDetailBackground.hashCode ^ addToCartColor.hashCode ^ view.hashCode ^ scrollDirection.hashCode ^ buyAction.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ShopFrontModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          description == other.description &&
          addToBasketText == other.addToBasketText &&
          shop == other.shop &&
          size == other.size &&
          cardElevation == other.cardElevation &&
          cardAxisSpacing == other.cardAxisSpacing &&
          itemCardBackground == other.itemCardBackground &&
          itemDetailBackground == other.itemDetailBackground &&
          addToCartColor == other.addToCartColor &&
          view == other.view &&
          scrollDirection == other.scrollDirection &&
          buyAction == other.buyAction;

  @override
  String toString() {
    return 'ShopFrontModel{documentID: $documentID, appId: $appId, title: $title, description: $description, addToBasketText: $addToBasketText, shop: $shop, size: $size, cardElevation: $cardElevation, cardAxisSpacing: $cardAxisSpacing, itemCardBackground: $itemCardBackground, itemDetailBackground: $itemDetailBackground, addToCartColor: $addToCartColor, view: $view, scrollDirection: $scrollDirection, buyAction: $buyAction}';
  }

  ShopFrontEntity toEntity() {
    appId = GlobalData.app().documentID;
    return ShopFrontEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
          addToBasketText: (addToBasketText != null) ? addToBasketText : null, 
          shopId: (shop != null) ? shop.documentID : null, 
          size: (size != null) ? size : null, 
          cardElevation: (cardElevation != null) ? cardElevation : null, 
          cardAxisSpacing: (cardAxisSpacing != null) ? cardAxisSpacing : null, 
          itemCardBackgroundId: (itemCardBackground != null) ? itemCardBackground.documentID : null, 
          itemDetailBackgroundId: (itemDetailBackground != null) ? itemDetailBackground.documentID : null, 
          addToCartColor: (addToCartColor != null) ? addToCartColor.toEntity() : null, 
          view: (view != null) ? view.index : null, 
          scrollDirection: (scrollDirection != null) ? scrollDirection.index : null, 
          buyAction: (buyAction != null) ? buyAction.toEntity() : null, 
    );
  }

  static ShopFrontModel fromEntity(String documentID, ShopFrontEntity entity) {
    if (entity == null) return null;
    return ShopFrontModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
          addToBasketText: entity.addToBasketText, 
          size: entity.size, 
          cardElevation: entity.cardElevation, 
          cardAxisSpacing: entity.cardAxisSpacing, 
          addToCartColor: 
            RgbModel.fromEntity(entity.addToCartColor), 
          view: toShopFrontView(entity.view), 
          scrollDirection: toScrollDirection(entity.scrollDirection), 
          buyAction: 
            ActionModel.fromEntity(entity.buyAction), 
    );
  }

  static Future<ShopFrontModel> fromEntityPlus(String documentID, ShopFrontEntity entity) async {
    if (entity == null) return null;

    ShopModel shopHolder;
    if (entity.shopId != null) {
      try {
        await shopRepository().get(entity.shopId).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel itemCardBackgroundHolder;
    if (entity.itemCardBackgroundId != null) {
      try {
        await backgroundRepository().get(entity.itemCardBackgroundId).then((val) {
          itemCardBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel itemDetailBackgroundHolder;
    if (entity.itemDetailBackgroundId != null) {
      try {
        await backgroundRepository().get(entity.itemDetailBackgroundId).then((val) {
          itemDetailBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return ShopFrontModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          description: entity.description, 
          addToBasketText: entity.addToBasketText, 
          shop: shopHolder, 
          size: entity.size, 
          cardElevation: entity.cardElevation, 
          cardAxisSpacing: entity.cardAxisSpacing, 
          itemCardBackground: itemCardBackgroundHolder, 
          itemDetailBackground: itemDetailBackgroundHolder, 
          addToCartColor: 
            await RgbModel.fromEntityPlus(entity.addToCartColor), 
          view: toShopFrontView(entity.view), 
          scrollDirection: toScrollDirection(entity.scrollDirection), 
          buyAction: 
            await ActionModel.fromEntityPlus(entity.buyAction), 
    );
  }

}

