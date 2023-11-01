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



import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef ProductDisplayModelTrigger(List<ProductDisplayModel?> list);
typedef ProductDisplayChanged(ProductDisplayModel? value);
typedef ProductDisplayErrorHandler(o, e);

abstract class ProductDisplayRepository extends RepositoryBase<ProductDisplayModel, ProductDisplayEntity> {
  Future<ProductDisplayEntity> addEntity(String documentID, ProductDisplayEntity value);
  Future<ProductDisplayEntity> updateEntity(String documentID, ProductDisplayEntity value);
  Future<ProductDisplayModel> add(ProductDisplayModel value);
  Future<void> delete(ProductDisplayModel value);
  Future<ProductDisplayModel?> get(String? id, { Function(Exception)? onError });
  Future<ProductDisplayModel> update(ProductDisplayModel value);

  Stream<List<ProductDisplayModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<ProductDisplayModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<ProductDisplayModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<ProductDisplayModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<ProductDisplayModel?>> listen(ProductDisplayModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<ProductDisplayModel?>> listenWithDetails(ProductDisplayModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<ProductDisplayModel?> listenTo(String documentId, ProductDisplayChanged changed, {ProductDisplayErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<ProductDisplayModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


