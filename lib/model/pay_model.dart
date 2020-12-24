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

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/pay_entity.dart';

import 'package:eliud_core/tools/random.dart';



class PayModel {
  String documentID;
  String appId;
  String title;
  ActionModel succeeded;
  ShopModel shop;

  PayModel({this.documentID, this.appId, this.title, this.succeeded, this.shop, })  {
    assert(documentID != null);
  }

  PayModel copyWith({String documentID, String appId, String title, ActionModel succeeded, ShopModel shop, }) {
    return PayModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, succeeded: succeeded ?? this.succeeded, shop: shop ?? this.shop, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ succeeded.hashCode ^ shop.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PayModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          succeeded == other.succeeded &&
          shop == other.shop;

  @override
  String toString() {
    return 'PayModel{documentID: $documentID, appId: $appId, title: $title, succeeded: $succeeded, shop: $shop}';
  }

  PayEntity toEntity({String appId}) {
    return PayEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          succeeded: (succeeded != null) ? succeeded.toEntity(appId: appId) : null, 
          shopId: (shop != null) ? shop.documentID : null, 
    );
  }

  static PayModel fromEntity(String documentID, PayEntity entity) {
    if (entity == null) return null;
    return PayModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          succeeded: 
            ActionModel.fromEntity(entity.succeeded), 
    );
  }

  static Future<PayModel> fromEntityPlus(String documentID, PayEntity entity, { String appId}) async {
    if (entity == null) return null;

    ShopModel shopHolder;
    if (entity.shopId != null) {
      try {
        await shopRepository(appId: appId).get(entity.shopId).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return PayModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          succeeded: 
            await ActionModel.fromEntityPlus(entity.succeeded, appId: appId), 
          shop: shopHolder, 
    );
  }

}

