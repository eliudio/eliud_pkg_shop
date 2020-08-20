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
import 'package:eliud_model/core/global_data.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';

import '../shared/abstract_repository_singleton.dart';


import 'product_entity.dart';
import 'shop_model.dart';
import 'product_image_model.dart';
import 'package:eliud_model/shared/pos_size_model.dart';
import 'shop_repository.dart';
import 'package:eliud_model/shared/pos_size_repository.dart';
import 'package:eliud_model/tools/random.dart';



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

  ProductModel({this.documentID, this.appId, this.title, this.about, this.price, this.weight, this.shop, this.images, this.posSize, })  {
    assert(documentID != null);
  }

  ProductModel copyWith({String documentID, String appId, String title, String about, double price, double weight, ShopModel shop, List<ProductImageModel> images, PosSizeModel posSize, }) {
    return ProductModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, about: about ?? this.about, price: price ?? this.price, weight: weight ?? this.weight, shop: shop ?? this.shop, images: images ?? this.images, posSize: posSize ?? this.posSize, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ about.hashCode ^ price.hashCode ^ weight.hashCode ^ shop.hashCode ^ images.hashCode ^ posSize.hashCode;

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
          posSize == other.posSize;

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images.join(', ');

    return 'ProductModel{documentID: $documentID, appId: $appId, title: $title, about: $about, price: $price, weight: $weight, shop: $shop, images: ProductImage[] { $imagesCsv }, posSize: $posSize}';
  }

  ProductEntity toEntity() {
    appId = GlobalData.app().documentID;
    return ProductEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          about: (about != null) ? about : null, 
          price: (price != null) ? price : null, 
          weight: (weight != null) ? weight : null, 
          shopId: (shop != null) ? shop.documentID : null, 
          images: (images != null) ? images
            .map((item) => item.toEntity())
            .toList() : null, 
          posSizeId: (posSize != null) ? posSize.documentID : null, 
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
            entity. images
            .map((item) => ProductImageModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<ProductModel> fromEntityPlus(String documentID, ProductEntity entity) async {
    if (entity == null) return null;

    ShopModel shopHolder;
    if (entity.shopId != null) {
      try {
        await shopRepository().get(entity.shopId).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    PosSizeModel posSizeHolder;
    if (entity.posSizeId != null) {
      try {
        await posSizeRepository().get(entity.posSizeId).then((val) {
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
            new List<ProductImageModel>.from(await Future.wait(entity. images
            .map((item) => ProductImageModel.fromEntityPlus(newRandomKey(), item))
            .toList())), 
          posSize: posSizeHolder, 
    );
  }

}

