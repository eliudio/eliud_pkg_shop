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


import 'package:eliud_pkg_shop/model/shop_front_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum ScrollDirection {
  Horizontal, Vertical, Unknown
}


ScrollDirection toScrollDirection(int? index) {
  switch (index) {
    case 0: return ScrollDirection.Horizontal;
    case 1: return ScrollDirection.Vertical;
  }
  return ScrollDirection.Unknown;
}


class ShopFrontModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'ShopFront';

  String documentID;
  String appId;
  String? title;
  String? description;
  ShopModel? shop;
  double? size;
  double? cardElevation;
  double? cardAxisSpacing;
  BackgroundModel? itemCardBackground;
  RgbModel? addToCartColor;
  ScrollDirection? scrollDirection;
  ActionModel? buyAction;
  ActionModel? openProductAction;
  EdgeInsetsGeometryModel? padding;
  StorageConditionsModel? conditions;

  ShopFrontModel({required this.documentID, required this.appId, this.title, this.description, this.shop, this.size, this.cardElevation, this.cardAxisSpacing, this.itemCardBackground, this.addToCartColor, this.scrollDirection, this.buyAction, this.openProductAction, this.padding, this.conditions, })  {
    assert(documentID != null);
  }

  ShopFrontModel copyWith({String? documentID, String? appId, String? title, String? description, ShopModel? shop, double? size, double? cardElevation, double? cardAxisSpacing, BackgroundModel? itemCardBackground, RgbModel? addToCartColor, ScrollDirection? scrollDirection, ActionModel? buyAction, ActionModel? openProductAction, EdgeInsetsGeometryModel? padding, StorageConditionsModel? conditions, }) {
    return ShopFrontModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, description: description ?? this.description, shop: shop ?? this.shop, size: size ?? this.size, cardElevation: cardElevation ?? this.cardElevation, cardAxisSpacing: cardAxisSpacing ?? this.cardAxisSpacing, itemCardBackground: itemCardBackground ?? this.itemCardBackground, addToCartColor: addToCartColor ?? this.addToCartColor, scrollDirection: scrollDirection ?? this.scrollDirection, buyAction: buyAction ?? this.buyAction, openProductAction: openProductAction ?? this.openProductAction, padding: padding ?? this.padding, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ description.hashCode ^ shop.hashCode ^ size.hashCode ^ cardElevation.hashCode ^ cardAxisSpacing.hashCode ^ itemCardBackground.hashCode ^ addToCartColor.hashCode ^ scrollDirection.hashCode ^ buyAction.hashCode ^ openProductAction.hashCode ^ padding.hashCode ^ conditions.hashCode;

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
          scrollDirection == other.scrollDirection &&
          buyAction == other.buyAction &&
          openProductAction == other.openProductAction &&
          padding == other.padding &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'ShopFrontModel{documentID: $documentID, appId: $appId, title: $title, description: $description, shop: $shop, size: $size, cardElevation: $cardElevation, cardAxisSpacing: $cardAxisSpacing, itemCardBackground: $itemCardBackground, addToCartColor: $addToCartColor, scrollDirection: $scrollDirection, buyAction: $buyAction, openProductAction: $openProductAction, padding: $padding, conditions: $conditions}';
  }

  ShopFrontEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
      if (shop != null) referencesCollector.add(ModelReference(ShopModel.packageName, ShopModel.id, shop!));
    }
    return ShopFrontEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
          shopId: (shop != null) ? shop!.documentID : null, 
          size: (size != null) ? size : null, 
          cardElevation: (cardElevation != null) ? cardElevation : null, 
          cardAxisSpacing: (cardAxisSpacing != null) ? cardAxisSpacing : null, 
          itemCardBackground: (itemCardBackground != null) ? itemCardBackground!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          addToCartColor: (addToCartColor != null) ? addToCartColor!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          scrollDirection: (scrollDirection != null) ? scrollDirection!.index : null, 
          buyAction: (buyAction != null) ? buyAction!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          openProductAction: (openProductAction != null) ? openProductAction!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          padding: (padding != null) ? padding!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
    );
  }

  static Future<ShopFrontModel?> fromEntity(String documentID, ShopFrontEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return ShopFrontModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          title: entity.title, 
          description: entity.description, 
          size: entity.size, 
          cardElevation: entity.cardElevation, 
          cardAxisSpacing: entity.cardAxisSpacing, 
          itemCardBackground: 
            await BackgroundModel.fromEntity(entity.itemCardBackground), 
          addToCartColor: 
            await RgbModel.fromEntity(entity.addToCartColor), 
          scrollDirection: toScrollDirection(entity.scrollDirection), 
          buyAction: 
            await ActionModel.fromEntity(entity.buyAction), 
          openProductAction: 
            await ActionModel.fromEntity(entity.openProductAction), 
          padding: 
            await EdgeInsetsGeometryModel.fromEntity(entity.padding), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
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

    var counter = 0;
    return ShopFrontModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          title: entity.title, 
          description: entity.description, 
          shop: shopHolder, 
          size: entity.size, 
          cardElevation: entity.cardElevation, 
          cardAxisSpacing: entity.cardAxisSpacing, 
          itemCardBackground: 
            await BackgroundModel.fromEntityPlus(entity.itemCardBackground, appId: appId), 
          addToCartColor: 
            await RgbModel.fromEntityPlus(entity.addToCartColor, appId: appId), 
          scrollDirection: toScrollDirection(entity.scrollDirection), 
          buyAction: 
            await ActionModel.fromEntityPlus(entity.buyAction, appId: appId), 
          openProductAction: 
            await ActionModel.fromEntityPlus(entity.openProductAction, appId: appId), 
          padding: 
            await EdgeInsetsGeometryModel.fromEntityPlus(entity.padding, appId: appId), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

