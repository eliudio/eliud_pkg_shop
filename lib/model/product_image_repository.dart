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
import 'package:eliud_pkg_shop/model/product_image_model.dart';

typedef ProductImageModelTrigger(List<ProductImageModel> list);

abstract class ProductImageRepository {
  Future<ProductImageModel> add(ProductImageModel value);
  Future<void> delete(ProductImageModel value);
  Future<ProductImageModel> get(String id);
  Future<ProductImageModel> update(ProductImageModel value);
  Stream<List<ProductImageModel>> values();
  Stream<List<ProductImageModel>> valuesWithDetails();  Future<List<ProductImageModel>> valuesList();
  Future<List<ProductImageModel>> valuesListWithDetails();
  StreamSubscription<List<ProductImageModel>> listen(ProductImageModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<ProductImageModel>> listenWithDetails(ProductImageModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


