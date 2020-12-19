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

import 'package:eliud_pkg_shop/model/product_image_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef ProductImageModelTrigger(List<ProductImageModel> list);

abstract class ProductImageRepository {
  Future<ProductImageModel> add(ProductImageModel value);
  Future<void> delete(ProductImageModel value);
  Future<ProductImageModel> get(String id);
  Future<ProductImageModel> update(ProductImageModel value);

  Stream<List<ProductImageModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Stream<List<ProductImageModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<ProductImageModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<ProductImageModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});

  StreamSubscription<List<ProductImageModel>> listen(ProductImageModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  StreamSubscription<List<ProductImageModel>> listenWithDetails(ProductImageModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  void flush();

  Future<void> deleteAll();
}


