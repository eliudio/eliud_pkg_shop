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

import 'package:eliud_pkg_shop/model/product_image_repository.dart';


import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef ProductImageModelTrigger(List<ProductImageModel?> list);
typedef ProductImageChanged(ProductImageModel? value);
typedef ProductImageErrorHandler(o, e);

abstract class ProductImageRepository extends RepositoryBase<ProductImageModel, ProductImageEntity> {
  Future<ProductImageEntity> addEntity(String documentID, ProductImageEntity value);
  Future<ProductImageEntity> updateEntity(String documentID, ProductImageEntity value);
  Future<ProductImageModel> add(ProductImageModel value);
  Future<void> delete(ProductImageModel value);
  Future<ProductImageModel?> get(String? id, { Function(Exception)? onError });
  Future<ProductImageModel> update(ProductImageModel value);

  Stream<List<ProductImageModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<ProductImageModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<ProductImageModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<ProductImageModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<ProductImageModel?>> listen(ProductImageModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<ProductImageModel?>> listenWithDetails(ProductImageModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<ProductImageModel?> listenTo(String documentId, ProductImageChanged changed, {ProductImageErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<ProductImageModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


