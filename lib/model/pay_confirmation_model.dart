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

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/pay_confirmation_entity.dart';

import 'package:eliud_core/tools/random.dart';



class PayConfirmationModel {
  String documentID;
  String appId;
  String title;
  ShopModel shop;
  ActionModel backToShopAction;

  PayConfirmationModel({this.documentID, this.appId, this.title, this.shop, this.backToShopAction, })  {
    assert(documentID != null);
  }

  PayConfirmationModel copyWith({String documentID, String appId, String title, ShopModel shop, ActionModel backToShopAction, }) {
    return PayConfirmationModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, shop: shop ?? this.shop, backToShopAction: backToShopAction ?? this.backToShopAction, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ shop.hashCode ^ backToShopAction.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PayConfirmationModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          shop == other.shop &&
          backToShopAction == other.backToShopAction;

  @override
  String toString() {
    return 'PayConfirmationModel{documentID: $documentID, appId: $appId, title: $title, shop: $shop, backToShopAction: $backToShopAction}';
  }

  PayConfirmationEntity toEntity({String appId}) {
    return PayConfirmationEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          shopId: (shop != null) ? shop.documentID : null, 
          backToShopAction: (backToShopAction != null) ? backToShopAction.toEntity(appId: appId) : null, 
    );
  }

  static PayConfirmationModel fromEntity(String documentID, PayConfirmationEntity entity) {
    if (entity == null) return null;
    return PayConfirmationModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          backToShopAction: 
            ActionModel.fromEntity(entity.backToShopAction), 
    );
  }

  static Future<PayConfirmationModel> fromEntityPlus(String documentID, PayConfirmationEntity entity, { String appId}) async {
    if (entity == null) return null;

    ShopModel shopHolder;
    if (entity.shopId != null) {
      try {
        await shopRepository(appId: appId).get(entity.shopId).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return PayConfirmationModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          shop: shopHolder, 
          backToShopAction: 
            await ActionModel.fromEntityPlus(entity.backToShopAction, appId: appId), 
    );
  }

}

