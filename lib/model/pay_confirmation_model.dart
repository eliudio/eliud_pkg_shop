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


import 'package:eliud_pkg_shop/model/pay_confirmation_entity.dart';

import 'package:eliud_core/tools/random.dart';



class PayConfirmationModel {
  String? documentID;
  String? appId;
  String? description;
  ShopModel? shop;
  ActionModel? backToShopAction;
  StorageConditionsModel? conditions;

  PayConfirmationModel({this.documentID, this.appId, this.description, this.shop, this.backToShopAction, this.conditions, })  {
    assert(documentID != null);
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
          appId: entity.appId, 
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
          appId: entity.appId, 
          description: entity.description, 
          shop: shopHolder, 
          backToShopAction: 
            await ActionModel.fromEntityPlus(entity.backToShopAction, appId: appId), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

