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

import 'package:eliud_model/core/global_data.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';

import '../shared/abstract_repository_singleton.dart';


import 'order_overview_entity.dart';
import 'shop_model.dart';
import 'package:eliud_model/shared/background_model.dart';
import 'package:eliud_model/shared/background_model.dart';
import 'shop_repository.dart';
import 'package:eliud_model/shared/background_repository.dart';
import 'package:eliud_model/tools/random.dart';



class OrderOverviewModel {
  String documentID;
  String appId;
  String title;
  ShopModel shop;
  BackgroundModel itemImageBackground;
  BackgroundModel itemDetailBackground;

  OrderOverviewModel({this.documentID, this.appId, this.title, this.shop, this.itemImageBackground, this.itemDetailBackground, })  {
    assert(documentID != null);
  }

  OrderOverviewModel copyWith({String documentID, String appId, String title, ShopModel shop, BackgroundModel itemImageBackground, BackgroundModel itemDetailBackground, }) {
    return OrderOverviewModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, shop: shop ?? this.shop, itemImageBackground: itemImageBackground ?? this.itemImageBackground, itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ shop.hashCode ^ itemImageBackground.hashCode ^ itemDetailBackground.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is OrderOverviewModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          shop == other.shop &&
          itemImageBackground == other.itemImageBackground &&
          itemDetailBackground == other.itemDetailBackground;

  @override
  String toString() {
    return 'OrderOverviewModel{documentID: $documentID, appId: $appId, title: $title, shop: $shop, itemImageBackground: $itemImageBackground, itemDetailBackground: $itemDetailBackground}';
  }

  OrderOverviewEntity toEntity() {
    appId = GlobalData.app().documentID;
    return OrderOverviewEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          shopId: (shop != null) ? shop.documentID : null, 
          itemImageBackgroundId: (itemImageBackground != null) ? itemImageBackground.documentID : null, 
          itemDetailBackgroundId: (itemDetailBackground != null) ? itemDetailBackground.documentID : null, 
    );
  }

  static OrderOverviewModel fromEntity(String documentID, OrderOverviewEntity entity) {
    if (entity == null) return null;
    return OrderOverviewModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
    );
  }

  static Future<OrderOverviewModel> fromEntityPlus(String documentID, OrderOverviewEntity entity) async {
    if (entity == null) return null;

    ShopModel shopHolder;
    if (entity.shopId != null) {
      try {
        await shopRepository().get(entity.shopId).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel itemImageBackgroundHolder;
    if (entity.itemImageBackgroundId != null) {
      try {
        await backgroundRepository().get(entity.itemImageBackgroundId).then((val) {
          itemImageBackgroundHolder = val;
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

    return OrderOverviewModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          shop: shopHolder, 
          itemImageBackground: itemImageBackgroundHolder, 
          itemDetailBackground: itemDetailBackgroundHolder, 
    );
  }

}

