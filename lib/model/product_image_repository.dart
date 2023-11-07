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

import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef ProductImageModelTrigger = Function(List<ProductImageModel?> list);
typedef ProductImageChanged = Function(ProductImageModel? value);
typedef ProductImageErrorHandler = Function(dynamic o, dynamic e);

abstract class ProductImageRepository
    extends RepositoryBase<ProductImageModel, ProductImageEntity> {
  @override
  Future<ProductImageEntity> addEntity(
      String documentID, ProductImageEntity value);
  @override
  Future<ProductImageEntity> updateEntity(
      String documentID, ProductImageEntity value);
  @override
  Future<ProductImageModel> add(ProductImageModel value);
  @override
  Future<void> delete(ProductImageModel value);
  @override
  Future<ProductImageModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<ProductImageModel> update(ProductImageModel value);

  @override
  Stream<List<ProductImageModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<ProductImageModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ProductImageModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ProductImageModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<ProductImageModel?>> listen(
      ProductImageModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<ProductImageModel?>> listenWithDetails(
      ProductImageModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<ProductImageModel?> listenTo(
      String documentId, ProductImageChanged changed,
      {ProductImageErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<ProductImageModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
