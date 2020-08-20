/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'product_image_model.dart';
import 'product_image_repository.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';


import 'package:eliud_model/shared/image_model.dart';
class ProductImageCache implements ProductImageRepository {

  final ProductImageRepository reference;
  final Map<String, ProductImageModel> fullCache = Map();

  ProductImageCache(this.reference);

  Future<ProductImageModel> add(ProductImageModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(ProductImageModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<ProductImageModel> get(String id){
    ProductImageModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<ProductImageModel> update(ProductImageModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<ProductImageModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<ProductImageModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<ProductImageModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<ProductImageModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<ProductImageModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<ProductImageModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<ProductImageModel> refreshRelations(ProductImageModel model) async {

    ImageModel imageHolder;
    if (model.image != null) {
      try {
        await imageRepository().get(model.image.documentID).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        image: imageHolder,


    );
  }

}

