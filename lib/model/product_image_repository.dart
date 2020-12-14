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
  Stream<List<ProductImageModel>> values({String orderBy, bool descending });
  Stream<List<ProductImageModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<ProductImageModel>> valuesList({String orderBy, bool descending });
  Future<List<ProductImageModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<ProductImageModel>> listen(ProductImageModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<ProductImageModel>> listenWithDetails(ProductImageModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


