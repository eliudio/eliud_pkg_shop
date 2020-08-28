/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';

import 'package:eliud_pkg_shop/model/product_image_entity.dart';
class ProductEntity {
  final String appId;
  final String title;
  final String about;
  final double price;
  final double weight;
  final String shopId;
  final List<ProductImageEntity> images;
  final String posSizeId;

  ProductEntity({this.appId, this.title, this.about, this.price, this.weight, this.shopId, this.images, this.posSizeId, });

  List<Object> get props => [appId, title, about, price, weight, shopId, images, posSizeId, ];

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images.join(', ');

    return 'ProductEntity{appId: $appId, title: $title, about: $about, price: $price, weight: $weight, shopId: $shopId, images: ProductImage[] { $imagesCsv }, posSizeId: $posSizeId}';
  }

  static ProductEntity fromMap(Map map) {
    if (map == null) return null;

    final imagesList = (map['images'] as List<dynamic>)
        .map((dynamic item) =>
        ProductImageEntity.fromMap(item as Map))
        .toList();

    return ProductEntity(
      appId: map['appId'], 
      title: map['title'], 
      about: map['about'], 
      price: double.tryParse(map['price'].toString()), 
      weight: double.tryParse(map['weight'].toString()), 
      shopId: map['shopId'], 
      images: imagesList, 
      posSizeId: map['posSizeId'], 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> imagesListMap = images != null 
        ? images.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (about != null) theDocument["about"] = about;
      else theDocument["about"] = null;
    if (price != null) theDocument["price"] = price;
      else theDocument["price"] = null;
    if (weight != null) theDocument["weight"] = weight;
      else theDocument["weight"] = null;
    if (shopId != null) theDocument["shopId"] = shopId;
      else theDocument["shopId"] = null;
    if (images != null) theDocument["images"] = imagesListMap;
      else theDocument["images"] = null;
    if (posSizeId != null) theDocument["posSizeId"] = posSizeId;
      else theDocument["posSizeId"] = null;
    return theDocument;
  }

  static ProductEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

