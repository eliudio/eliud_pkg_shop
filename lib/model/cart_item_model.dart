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

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/cart_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class CartItemModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'CartItem';

  String documentID;
  int? amount;
  String appId;
  ProductModel? product;

  CartItemModel({required this.documentID, this.amount, required this.appId, this.product, })  {
    assert(documentID != null);
  }

  CartItemModel copyWith({String? documentID, int? amount, String? appId, ProductModel? product, }) {
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

  CartItemEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
      if (product != null) referencesCollector.add(ModelReference(ProductModel.packageName, ProductModel.id, product!));
    }
    return CartItemEntity(
          amount: (amount != null) ? amount : null, 
          appId: (appId != null) ? appId : null, 
          productId: (product != null) ? product!.documentID : null, 
    );
  }

  static Future<CartItemModel?> fromEntity(String documentID, CartItemEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return CartItemModel(
          documentID: documentID, 
          amount: entity.amount, 
          appId: entity.appId ?? '', 
    );
  }

  static Future<CartItemModel?> fromEntityPlus(String documentID, CartItemEntity? entity, { String? appId}) async {
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
    return CartItemModel(
          documentID: documentID, 
          amount: entity.amount, 
          appId: entity.appId ?? '', 
          product: productHolder, 
    );
  }

}

