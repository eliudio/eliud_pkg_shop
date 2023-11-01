/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/pay_confirmation_entity.dart';




class PayConfirmationModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'payConfirmations';

  String documentID;
  String appId;
  String? description;
  ShopModel? shop;
  ActionModel? backToShopAction;
  StorageConditionsModel? conditions;

  PayConfirmationModel({required this.documentID, required this.appId, this.description, this.shop, this.backToShopAction, this.conditions, })  {
  }

  PayConfirmationModel copyWith({String? documentID, String? appId, String? description, ShopModel? shop, ActionModel? backToShopAction, StorageConditionsModel? conditions, }) {
    return PayConfirmationModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, shop: shop ?? this.shop, backToShopAction: backToShopAction ?? this.backToShopAction, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ shop.hashCode ^ backToShopAction.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PayConfirmationModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          shop == other.shop &&
          backToShopAction == other.backToShopAction &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'PayConfirmationModel{documentID: $documentID, appId: $appId, description: $description, shop: $shop, backToShopAction: $backToShopAction, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (shop != null) {
      referencesCollector.add(ModelReference(ShopModel.packageName, ShopModel.id, shop!));
    }
    if (shop != null) referencesCollector.addAll(await shop!.collectReferences(appId: appId));
    if (backToShopAction != null) referencesCollector.addAll(await backToShopAction!.collectReferences(appId: appId));
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
  }

  PayConfirmationEntity toEntity({String? appId}) {
    return PayConfirmationEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          shopId: (shop != null) ? shop!.documentID : null, 
          backToShopAction: (backToShopAction != null) ? backToShopAction!.toEntity(appId: appId) : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<PayConfirmationModel?> fromEntity(String documentID, PayConfirmationEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return PayConfirmationModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          backToShopAction: 
            await ActionModel.fromEntity(entity.backToShopAction), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<PayConfirmationModel?> fromEntityPlus(String documentID, PayConfirmationEntity? entity, { String? appId}) async {
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
    return PayConfirmationModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          shop: shopHolder, 
          backToShopAction: 
            await ActionModel.fromEntityPlus(entity.backToShopAction, appId: appId), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

