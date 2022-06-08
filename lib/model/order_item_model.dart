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

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/order_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class OrderItemModel implements ModelBase, WithAppId {
  String documentID;
  int? amount;
  String appId;
  double? soldPrice;
  ProductModel? product;

  OrderItemModel({required this.documentID, this.amount, required this.appId, this.soldPrice, this.product, })  {
    assert(documentID != null);
  }

  OrderItemModel copyWith({String? documentID, int? amount, String? appId, double? soldPrice, ProductModel? product, }) {
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

  String toJsonString({String? appId}) {
    return toEntity(appId: appId).toJsonString();
  }

  @override
  String toString() {
    return 'OrderItemModel{documentID: $documentID, amount: $amount, appId: $appId, soldPrice: $soldPrice, product: $product}';
  }

  OrderItemEntity toEntity({String? appId}) {
    return OrderItemEntity(
          amount: (amount != null) ? amount : null, 
          appId: (appId != null) ? appId : null, 
          soldPrice: (soldPrice != null) ? soldPrice : null, 
          productId: (product != null) ? product!.documentID : null, 
    );
  }

  static Future<OrderItemModel?> fromEntity(String documentID, OrderItemEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return OrderItemModel(
          documentID: documentID, 
          amount: entity.amount, 
          appId: entity.appId ?? '', 
          soldPrice: entity.soldPrice, 
    );
  }

  static Future<OrderItemModel?> fromEntityPlus(String documentID, OrderItemEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    ProductModel? productHolder;
    if (entity.productId != null) {
      try {
          productHolder = await productRepository(appId: appId)!.get(entity.productId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise product');
        print('Error whilst retrieving product with id ${entity.productId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return OrderItemModel(
          documentID: documentID, 
          amount: entity.amount, 
          appId: entity.appId ?? '', 
          soldPrice: entity.soldPrice, 
          product: productHolder, 
    );
  }

}

