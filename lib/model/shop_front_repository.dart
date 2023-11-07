/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef ShopFrontModelTrigger = Function(List<ShopFrontModel?> list);
typedef ShopFrontChanged = Function(ShopFrontModel? value);
typedef ShopFrontErrorHandler = Function(dynamic o, dynamic e);

abstract class ShopFrontRepository
    extends RepositoryBase<ShopFrontModel, ShopFrontEntity> {
  @override
  Future<ShopFrontEntity> addEntity(String documentID, ShopFrontEntity value);
  @override
  Future<ShopFrontEntity> updateEntity(
      String documentID, ShopFrontEntity value);
  @override
  Future<ShopFrontModel> add(ShopFrontModel value);
  @override
  Future<void> delete(ShopFrontModel value);
  @override
  Future<ShopFrontModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<ShopFrontModel> update(ShopFrontModel value);

  @override
  Stream<List<ShopFrontModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<ShopFrontModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ShopFrontModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ShopFrontModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<ShopFrontModel?>> listen(
      ShopFrontModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<ShopFrontModel?>> listenWithDetails(
      ShopFrontModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<ShopFrontModel?> listenTo(
      String documentId, ShopFrontChanged changed,
      {ShopFrontErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<ShopFrontModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
