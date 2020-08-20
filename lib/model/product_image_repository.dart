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

typedef ProductImageModelTrigger(List<ProductImageModel> list);

abstract class ProductImageRepository {
  Future<ProductImageModel> add(ProductImageModel value);
  Future<void> delete(ProductImageModel value);
  Future<ProductImageModel> get(String id);
  Future<ProductImageModel> update(ProductImageModel value);
  Stream<List<ProductImageModel>> values();
  Stream<List<ProductImageModel>> valuesWithDetails();
  StreamSubscription<List<ProductImageModel>> listen(ProductImageModelTrigger trigger);
StreamSubscription<List<ProductImageModel>> listenWithDetails(ProductImageModelTrigger trigger);
  void flush();
  Future<List<ProductImageModel>> valuesList();
  Future<List<ProductImageModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


