/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/cart_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class CartItemModel {
  String documentID;
  int amount;
  String appId;
  ProductModel product;

  CartItemModel({this.documentID, this.amount, this.appId, this.product, })  {
    assert(documentID != null);
  }

  CartItemModel copyWith({String documentID, int amount, String appId, ProductModel product, }) {
    return CartItemModel(documentID: documentID ?? this.documentID, amount: amount ?? this.amount, appId: appId ?? this.appId, product: product ?? this.product, );
  }

  @override
  int get hashCode => documentID.hashCode ^ amount.hashCode ^ appId.hashCode ^ product.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is CartItemModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          amount == other.amount &&
          appId == other.appId &&
          product == other.product;

  @override
  String toString() {
    return 'CartItemModel{documentID: $documentID, amount: $amount, appId: $appId, product: $product}';
  }

  CartItemEntity toEntity() {
    appId = GlobalData.app().documentID;
    return CartItemEntity(
          amount: (amount != null) ? amount : null, 
          appId: (appId != null) ? appId : null, 
          productId: (product != null) ? product.documentID : null, 
    );
  }

  static CartItemModel fromEntity(String documentID, CartItemEntity entity) {
    if (entity == null) return null;
    return CartItemModel(
          documentID: documentID, 
          amount: entity.amount, 
          appId: entity.appId, 
    );
  }

  static Future<CartItemModel> fromEntityPlus(String documentID, CartItemEntity entity) async {
    if (entity == null) return null;

    ProductModel productHolder;
    if (entity.productId != null) {
      try {
        await productRepository().get(entity.productId).then((val) {
          productHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return CartItemModel(
          documentID: documentID, 
          amount: entity.amount, 
          appId: entity.appId, 
          product: productHolder, 
    );
  }

}

