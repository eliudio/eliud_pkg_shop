/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/core/global_data.dart';
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


import 'package:eliud_pkg_shop/model/product_entity.dart';

import 'package:eliud_core/tools/random.dart';



class ProductModel {
  String documentID;
  String appId;
  String title;
  String about;
  double price;
  double weight;
  ShopModel shop;
  List<ProductImageModel> images;
  PosSizeModel posSize;
  ConditionsSimpleModel conditions;

  ProductModel({this.documentID, this.appId, this.title, this.about, this.price, this.weight, this.shop, this.images, this.posSize, this.conditions, })  {
    assert(documentID != null);
  }

  ProductModel copyWith({String documentID, String appId, String title, String about, double price, double weight, ShopModel shop, List<ProductImageModel> images, PosSizeModel posSize, ConditionsSimpleModel conditions, }) {
    return ProductModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, about: about ?? this.about, price: price ?? this.price, weight: weight ?? this.weight, shop: shop ?? this.shop, images: images ?? this.images, posSize: posSize ?? this.posSize, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ about.hashCode ^ price.hashCode ^ weight.hashCode ^ shop.hashCode ^ images.hashCode ^ posSize.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ProductModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          about == other.about &&
          price == other.price &&
          weight == other.weight &&
          shop == other.shop &&
          ListEquality().equals(images, other.images) &&
          posSize == other.posSize &&
          conditions == other.conditions;

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images.join(', ');

    return 'ProductModel{documentID: $documentID, appId: $appId, title: $title, about: $about, price: $price, weight: $weight, shop: $shop, images: ProductImage[] { $imagesCsv }, posSize: $posSize, conditions: $conditions}';
  }

  ProductEntity toEntity({String appId}) {
    return ProductEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          about: (about != null) ? about : null, 
          price: (price != null) ? price : null, 
          weight: (weight != null) ? weight : null, 
          shopId: (shop != null) ? shop.documentID : null, 
          images: (images != null) ? images
            .map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          posSizeId: (posSize != null) ? posSize.documentID : null, 
          conditions: (conditions != null) ? conditions.toEntity(appId: appId) : null, 
    );
  }

  static ProductModel fromEntity(String documentID, ProductEntity entity) {
    if (entity == null) return null;
    return ProductModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          about: entity.about, 
          price: entity.price, 
          weight: entity.weight, 
          images: 
            entity.images == null ? null :
            entity.images
            .map((item) => ProductImageModel.fromEntity(newRandomKey(), item))
            .toList(), 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<ProductModel> fromEntityPlus(String documentID, ProductEntity entity, { String appId}) async {
    if (entity == null) return null;

    ShopModel shopHolder;
    if (entity.shopId != null) {
      try {
        await shopRepository(appId: appId).get(entity.shopId).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    PosSizeModel posSizeHolder;
    if (entity.posSizeId != null) {
      try {
        await posSizeRepository(appId: appId).get(entity.posSizeId).then((val) {
          posSizeHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return ProductModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          about: entity.about, 
          price: entity.price, 
          weight: entity.weight, 
          shop: shopHolder, 
          images: 
            entity. images == null ? null : new List<ProductImageModel>.from(await Future.wait(entity. images
            .map((item) => ProductImageModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          posSize: posSizeHolder, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

