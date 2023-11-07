/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef OrderItemModelTrigger = Function(List<OrderItemModel?> list);
typedef OrderItemChanged = Function(OrderItemModel? value);
typedef OrderItemErrorHandler = Function(dynamic o, dynamic e);

abstract class OrderItemRepository
    extends RepositoryBase<OrderItemModel, OrderItemEntity> {
  @override
  Future<OrderItemEntity> addEntity(String documentID, OrderItemEntity value);
  @override
  Future<OrderItemEntity> updateEntity(
      String documentID, OrderItemEntity value);
  @override
  Future<OrderItemModel> add(OrderItemModel value);
  @override
  Future<void> delete(OrderItemModel value);
  @override
  Future<OrderItemModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<OrderItemModel> update(OrderItemModel value);

  @override
  Stream<List<OrderItemModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<OrderItemModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<OrderItemModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<OrderItemModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<OrderItemModel?>> listen(
      OrderItemModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<OrderItemModel?>> listenWithDetails(
      OrderItemModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<OrderItemModel?> listenTo(
      String documentId, OrderItemChanged changed,
      {OrderItemErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<OrderItemModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
