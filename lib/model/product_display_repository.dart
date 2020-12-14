/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_shop/model/product_display_model.dart';

typedef ProductDisplayModelTrigger(List<ProductDisplayModel> list);

abstract class ProductDisplayRepository {
  Future<ProductDisplayModel> add(ProductDisplayModel value);
  Future<void> delete(ProductDisplayModel value);
  Future<ProductDisplayModel> get(String id);
  Future<ProductDisplayModel> update(ProductDisplayModel value);
  Stream<List<ProductDisplayModel>> values({String orderBy, bool descending });
  Stream<List<ProductDisplayModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<ProductDisplayModel>> valuesList({String orderBy, bool descending });
  Future<List<ProductDisplayModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<ProductDisplayModel>> listen(ProductDisplayModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<ProductDisplayModel>> listenWithDetails(ProductDisplayModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


