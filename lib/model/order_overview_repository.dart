/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef OrderOverviewModelTrigger = Function(List<OrderOverviewModel?> list);
typedef OrderOverviewChanged = Function(OrderOverviewModel? value);
typedef OrderOverviewErrorHandler = Function(dynamic o, dynamic e);

abstract class OrderOverviewRepository
    extends RepositoryBase<OrderOverviewModel, OrderOverviewEntity> {
  @override
  Future<OrderOverviewEntity> addEntity(
      String documentID, OrderOverviewEntity value);
  @override
  Future<OrderOverviewEntity> updateEntity(
      String documentID, OrderOverviewEntity value);
  @override
  Future<OrderOverviewModel> add(OrderOverviewModel value);
  @override
  Future<void> delete(OrderOverviewModel value);
  @override
  Future<OrderOverviewModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<OrderOverviewModel> update(OrderOverviewModel value);

  @override
  Stream<List<OrderOverviewModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<OrderOverviewModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<OrderOverviewModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<OrderOverviewModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<OrderOverviewModel?>> listen(
      OrderOverviewModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<OrderOverviewModel?>> listenWithDetails(
      OrderOverviewModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<OrderOverviewModel?> listenTo(
      String documentId, OrderOverviewChanged changed,
      {OrderOverviewErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<OrderOverviewModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
