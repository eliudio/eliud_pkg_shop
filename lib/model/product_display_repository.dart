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

typedef ProductDisplayModelTrigger = Function(List<ProductDisplayModel?> list);
typedef ProductDisplayChanged = Function(ProductDisplayModel? value);
typedef ProductDisplayErrorHandler = Function(dynamic o, dynamic e);

abstract class ProductDisplayRepository
    extends RepositoryBase<ProductDisplayModel, ProductDisplayEntity> {
  @override
  Future<ProductDisplayEntity> addEntity(
      String documentID, ProductDisplayEntity value);
  @override
  Future<ProductDisplayEntity> updateEntity(
      String documentID, ProductDisplayEntity value);
  @override
  Future<ProductDisplayModel> add(ProductDisplayModel value);
  @override
  Future<void> delete(ProductDisplayModel value);
  @override
  Future<ProductDisplayModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<ProductDisplayModel> update(ProductDisplayModel value);

  @override
  Stream<List<ProductDisplayModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<ProductDisplayModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ProductDisplayModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ProductDisplayModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<ProductDisplayModel?>> listen(
      ProductDisplayModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<ProductDisplayModel?>> listenWithDetails(
      ProductDisplayModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<ProductDisplayModel?> listenTo(
      String documentId, ProductDisplayChanged changed,
      {ProductDisplayErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<ProductDisplayModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
