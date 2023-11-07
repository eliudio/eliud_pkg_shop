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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/order_overview_entity.dart';

class OrderOverviewModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'orderOverviews';

  @override
  String documentID;
  @override
  String appId;
  String? description;
  ShopModel? shop;
  BackgroundModel? itemImageBackground;
  BackgroundModel? itemDetailBackground;
  StorageConditionsModel? conditions;

  OrderOverviewModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.shop,
    this.itemImageBackground,
    this.itemDetailBackground,
    this.conditions,
  });

  @override
  OrderOverviewModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    ShopModel? shop,
    BackgroundModel? itemImageBackground,
    BackgroundModel? itemDetailBackground,
    StorageConditionsModel? conditions,
  }) {
    return OrderOverviewModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      shop: shop ?? this.shop,
      itemImageBackground: itemImageBackground ?? this.itemImageBackground,
      itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      shop.hashCode ^
      itemImageBackground.hashCode ^
      itemDetailBackground.hashCode ^
      conditions.hashCode;

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

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (shop != null) {
      referencesCollector
          .add(ModelReference(ShopModel.packageName, ShopModel.id, shop!));
    }
    if (shop != null) {
      referencesCollector.addAll(await shop!.collectReferences(appId: appId));
    }
    if (itemImageBackground != null) {
      referencesCollector
          .addAll(await itemImageBackground!.collectReferences(appId: appId));
    }
    if (itemDetailBackground != null) {
      referencesCollector
          .addAll(await itemDetailBackground!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  OrderOverviewEntity toEntity({String? appId}) {
    return OrderOverviewEntity(
      appId: appId,
      description: (description != null) ? description : null,
      shopId: (shop != null) ? shop!.documentID : null,
      itemImageBackground: (itemImageBackground != null)
          ? itemImageBackground!.toEntity(appId: appId)
          : null,
      itemDetailBackground: (itemDetailBackground != null)
          ? itemDetailBackground!.toEntity(appId: appId)
          : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<OrderOverviewModel?> fromEntity(
      String documentID, OrderOverviewEntity? entity) async {
    if (entity == null) return null;
    return OrderOverviewModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      itemImageBackground:
          await BackgroundModel.fromEntity(entity.itemImageBackground),
      itemDetailBackground:
          await BackgroundModel.fromEntity(entity.itemDetailBackground),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<OrderOverviewModel?> fromEntityPlus(
      String documentID, OrderOverviewEntity? entity,
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

    return OrderOverviewModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      shop: shopHolder,
      itemImageBackground: await BackgroundModel.fromEntityPlus(
          entity.itemImageBackground,
          appId: appId),
      itemDetailBackground: await BackgroundModel.fromEntityPlus(
          entity.itemDetailBackground,
          appId: appId),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
