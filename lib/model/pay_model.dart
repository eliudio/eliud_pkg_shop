/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/pay_entity.dart';




class PayModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'pays';

  String documentID;
  String appId;
  String? description;
  ActionModel? succeeded;

  // requires a new implementation of a BespokeFormField WorkflowActionField
  ActionModel? payAction;
  ShopModel? shop;
  StorageConditionsModel? conditions;

  PayModel({required this.documentID, required this.appId, this.description, this.succeeded, this.payAction, this.shop, this.conditions, })  {
  }

  PayModel copyWith({String? documentID, String? appId, String? description, ActionModel? succeeded, ActionModel? payAction, ShopModel? shop, StorageConditionsModel? conditions, }) {
    return PayModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, succeeded: succeeded ?? this.succeeded, payAction: payAction ?? this.payAction, shop: shop ?? this.shop, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ succeeded.hashCode ^ payAction.hashCode ^ shop.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PayModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          succeeded == other.succeeded &&
          payAction == other.payAction &&
          shop == other.shop &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'PayModel{documentID: $documentID, appId: $appId, description: $description, succeeded: $succeeded, payAction: $payAction, shop: $shop, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (shop != null) {
      referencesCollector.add(ModelReference(ShopModel.packageName, ShopModel.id, shop!));
    }
    if (succeeded != null) referencesCollector.addAll(await succeeded!.collectReferences(appId: appId));
    if (payAction != null) referencesCollector.addAll(await payAction!.collectReferences(appId: appId));
    if (shop != null) referencesCollector.addAll(await shop!.collectReferences(appId: appId));
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
  }

  PayEntity toEntity({String? appId}) {
    return PayEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          succeeded: (succeeded != null) ? succeeded!.toEntity(appId: appId) : null, 
          payAction: (payAction != null) ? payAction!.toEntity(appId: appId) : null, 
          shopId: (shop != null) ? shop!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<PayModel?> fromEntity(String documentID, PayEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return PayModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          succeeded: 
            await ActionModel.fromEntity(entity.succeeded), 
          payAction: 
            await ActionModel.fromEntity(entity.payAction), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<PayModel?> fromEntityPlus(String documentID, PayEntity? entity, { String? appId}) async {
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
    return PayModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          succeeded: 
            await ActionModel.fromEntityPlus(entity.succeeded, appId: appId), 
          payAction: 
            await ActionModel.fromEntityPlus(entity.payAction, appId: appId), 
          shop: shopHolder, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

