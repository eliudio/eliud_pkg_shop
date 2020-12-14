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
import 'package:eliud_pkg_shop/model/product_model.dart';

typedef ProductModelTrigger(List<ProductModel> list);

abstract class ProductRepository {
  Future<ProductModel> add(ProductModel value);
  Future<void> delete(ProductModel value);
  Future<ProductModel> get(String id);
  Future<ProductModel> update(ProductModel value);
  Stream<List<ProductModel>> values({String orderBy, bool descending });
  Stream<List<ProductModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<ProductModel>> valuesList({String orderBy, bool descending });
  Future<List<ProductModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<ProductModel>> listen(ProductModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<ProductModel>> listenWithDetails(ProductModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


