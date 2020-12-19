/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_model.dart
                       
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


import 'package:eliud_pkg_shop/model/order_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class OrderItemModel {
  String documentID;
  int amount;
  String appId;
  double soldPrice;
  ProductModel product;

  OrderItemModel({this.documentID, this.amount, this.appId, this.soldPrice, this.product, })  {
    assert(documentID != null);
  }

  OrderItemModel copyWith({String documentID, int amount, String appId, double soldPrice, ProductModel product, }) {
    return OrderItemModel(documentID: documentID ?? this.documentID, amount: amount ?? this.amount, appId: appId ?? this.appId, soldPrice: soldPrice ?? this.soldPrice, product: product ?? this.product, );
  }

  @override
  int get hashCode => documentID.hashCode ^ amount.hashCode ^ appId.hashCode ^ soldPrice.hashCode ^ product.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is OrderItemModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          amount == other.amount &&
          appId == other.appId &&
          soldPrice == other.soldPrice &&
          product == other.product;

  @override
  String toString() {
    return 'OrderItemModel{documentID: $documentID, amount: $amount, appId: $appId, soldPrice: $soldPrice, product: $product}';
  }

  OrderItemEntity toEntity({String appId}) {
    return OrderItemEntity(
          amount: (amount != null) ? amount : null, 
          appId: (appId != null) ? appId : null, 
          soldPrice: (soldPrice != null) ? soldPrice : null, 
          productId: (product != null) ? product.documentID : null, 
    );
  }

  static OrderItemModel fromEntity(String documentID, OrderItemEntity entity) {
    if (entity == null) return null;
    return OrderItemModel(
          documentID: documentID, 
          amount: entity.amount, 
          appId: entity.appId, 
          soldPrice: entity.soldPrice, 
    );
  }

  static Future<OrderItemModel> fromEntityPlus(String documentID, OrderItemEntity entity, { String appId}) async {
    if (entity == null) return null;

    ProductModel productHolder;
    if (entity.productId != null) {
      try {
        await productRepository(appId: appId).get(entity.productId).then((val) {
          productHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return OrderItemModel(
          documentID: documentID, 
          amount: entity.amount, 
          appId: entity.appId, 
          soldPrice: entity.soldPrice, 
          product: productHolder, 
    );
  }

}

