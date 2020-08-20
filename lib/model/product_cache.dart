/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'product_model.dart';
import 'product_repository.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';


import 'shop_model.dart';
import 'product_image_model.dart';
import 'package:eliud_model/shared/pos_size_model.dart';
import 'product_image_cache.dart';
class ProductCache implements ProductRepository {

  final ProductRepository reference;
  final Map<String, ProductModel> fullCache = Map();

  ProductCache(this.reference);

  Future<ProductModel> add(ProductModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(ProductModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<ProductModel> get(String id){
    ProductModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<ProductModel> update(ProductModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<ProductModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<ProductModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<ProductModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<ProductModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<ProductModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<ProductModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<ProductModel> refreshRelations(ProductModel model) async {

    ShopModel shopHolder;
    if (model.shop != null) {
      try {
        await shopRepository().get(model.shop.documentID).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    PosSizeModel posSizeHolder;
    if (model.posSize != null) {
      try {
        await posSizeRepository().get(model.posSize.documentID).then((val) {
          posSizeHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<ProductImageModel> imagesHolder = List<ProductImageModel>.from(await Future.wait(await model.images.map((element) async {
      return await ProductImageCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        shop: shopHolder,

        posSize: posSizeHolder,

        images: imagesHolder,


    );
  }

}

