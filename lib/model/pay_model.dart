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


import 'package:eliud_pkg_shop/model/pay_entity.dart';

import 'package:eliud_core/tools/random.dart';



class PayModel {
  String? documentID;
  String? appId;
  String? title;
  ActionModel? succeeded;

  // requires a new implementation of a BespokeFormField WorkflowActionField
  WorkflowActionModel? payAction;
  ShopModel? shop;
  ConditionsSimpleModel? conditions;

  PayModel({this.documentID, this.appId, this.title, this.succeeded, this.payAction, this.shop, this.conditions, })  {
    assert(documentID != null);
  }

  PayModel copyWith({String? documentID, String? appId, String? title, ActionModel? succeeded, WorkflowActionModel? payAction, ShopModel? shop, ConditionsSimpleModel? conditions, }) {
    return PayModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, succeeded: succeeded ?? this.succeeded, payAction: payAction ?? this.payAction, shop: shop ?? this.shop, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ succeeded.hashCode ^ payAction.hashCode ^ shop.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PayModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          succeeded == other.succeeded &&
          payAction == other.payAction &&
          shop == other.shop &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'PayModel{documentID: $documentID, appId: $appId, title: $title, succeeded: $succeeded, payAction: $payAction, shop: $shop, conditions: $conditions}';
  }

  PayEntity toEntity({String? appId}) {
    return PayEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          succeeded: (succeeded != null) ? succeeded!.toEntity(appId: appId) : null, 
          payAction: (payAction != null) ? payAction!.toEntity(appId: appId) : null, 
          shopId: (shop != null) ? shop!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static PayModel? fromEntity(String documentID, PayEntity? entity) {
    if (entity == null) return null;
    return PayModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          succeeded: 
            ActionModel.fromEntity(entity.succeeded), 
          payAction: 
            WorkflowActionModel.fromEntity(entity.payAction), 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
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

    return PayModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          succeeded: 
            await ActionModel.fromEntityPlus(entity.succeeded, appId: appId), 
          payAction: 
            await WorkflowActionModel.fromEntityPlus(entity.payAction, appId: appId), 
          shop: shopHolder, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

