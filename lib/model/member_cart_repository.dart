/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef MemberCartModelTrigger = Function(List<MemberCartModel?> list);
typedef MemberCartChanged = Function(MemberCartModel? value);
typedef MemberCartErrorHandler = Function(dynamic o, dynamic e);

abstract class MemberCartRepository
    extends RepositoryBase<MemberCartModel, MemberCartEntity> {
  @override
  Future<MemberCartEntity> addEntity(String documentID, MemberCartEntity value);
  @override
  Future<MemberCartEntity> updateEntity(
      String documentID, MemberCartEntity value);
  @override
  Future<MemberCartModel> add(MemberCartModel value);
  @override
  Future<void> delete(MemberCartModel value);
  @override
  Future<MemberCartModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<MemberCartModel> update(MemberCartModel value);

  @override
  Stream<List<MemberCartModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<MemberCartModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberCartModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberCartModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<MemberCartModel?>> listen(
      MemberCartModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<MemberCartModel?>> listenWithDetails(
      MemberCartModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<MemberCartModel?> listenTo(
      String documentId, MemberCartChanged changed,
      {MemberCartErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<MemberCartModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
