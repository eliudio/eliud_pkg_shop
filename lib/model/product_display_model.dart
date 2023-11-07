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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/product_display_entity.dart';

class ProductDisplayModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'productDisplays';

  @override
  String documentID;
  @override
  String appId;
  String? description;
  BackgroundModel? itemDetailBackground;
  String? addToBasketText;
  ActionModel? buyAction;
  ShopModel? shop;
  BackgroundModel? background;
  StorageConditionsModel? conditions;

  ProductDisplayModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.itemDetailBackground,
    this.addToBasketText,
    this.buyAction,
    this.shop,
    this.background,
    this.conditions,
  });

  @override
  ProductDisplayModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    BackgroundModel? itemDetailBackground,
    String? addToBasketText,
    ActionModel? buyAction,
    ShopModel? shop,
    BackgroundModel? background,
    StorageConditionsModel? conditions,
  }) {
    return ProductDisplayModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground,
      addToBasketText: addToBasketText ?? this.addToBasketText,
      buyAction: buyAction ?? this.buyAction,
      shop: shop ?? this.shop,
      background: background ?? this.background,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      itemDetailBackground.hashCode ^
      addToBasketText.hashCode ^
      buyAction.hashCode ^
      shop.hashCode ^
      background.hashCode ^
      conditions.hashCode;

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
          background == other.background &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'ProductDisplayModel{documentID: $documentID, appId: $appId, description: $description, itemDetailBackground: $itemDetailBackground, addToBasketText: $addToBasketText, buyAction: $buyAction, shop: $shop, background: $background, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (shop != null) {
      referencesCollector
          .add(ModelReference(ShopModel.packageName, ShopModel.id, shop!));
    }
    if (itemDetailBackground != null) {
      referencesCollector
          .addAll(await itemDetailBackground!.collectReferences(appId: appId));
    }
    if (buyAction != null) {
      referencesCollector
          .addAll(await buyAction!.collectReferences(appId: appId));
    }
    if (shop != null) {
      referencesCollector.addAll(await shop!.collectReferences(appId: appId));
    }
    if (background != null) {
      referencesCollector
          .addAll(await background!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  ProductDisplayEntity toEntity({String? appId}) {
    return ProductDisplayEntity(
      appId: appId,
      description: (description != null) ? description : null,
      itemDetailBackground: (itemDetailBackground != null)
          ? itemDetailBackground!.toEntity(appId: appId)
          : null,
      addToBasketText: (addToBasketText != null) ? addToBasketText : null,
      buyAction: (buyAction != null) ? buyAction!.toEntity(appId: appId) : null,
      shopId: (shop != null) ? shop!.documentID : null,
      background:
          (background != null) ? background!.toEntity(appId: appId) : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<ProductDisplayModel?> fromEntity(
      String documentID, ProductDisplayEntity? entity) async {
    if (entity == null) return null;
    return ProductDisplayModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      itemDetailBackground:
          await BackgroundModel.fromEntity(entity.itemDetailBackground),
      addToBasketText: entity.addToBasketText,
      buyAction: await ActionModel.fromEntity(entity.buyAction),
      background: await BackgroundModel.fromEntity(entity.background),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<ProductDisplayModel?> fromEntityPlus(
      String documentID, ProductDisplayEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    ShopModel? shopHolder;
    if (entity.shopId != null) {
      try {
        shopHolder = await shopRepository(appId: appId)!.get(entity.shopId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise shop');
        print('Error whilst retrieving shop with id ${entity.shopId}');
        print('Exception: $e');
      }
    }

    return ProductDisplayModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      itemDetailBackground: await BackgroundModel.fromEntityPlus(
          entity.itemDetailBackground,
          appId: appId),
      addToBasketText: entity.addToBasketText,
      buyAction:
          await ActionModel.fromEntityPlus(entity.buyAction, appId: appId),
      shop: shopHolder,
      background:
          await BackgroundModel.fromEntityPlus(entity.background, appId: appId),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
