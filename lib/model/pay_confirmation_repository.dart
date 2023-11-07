/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef PayConfirmationModelTrigger = Function(
    List<PayConfirmationModel?> list);
typedef PayConfirmationChanged = Function(PayConfirmationModel? value);
typedef PayConfirmationErrorHandler = Function(dynamic o, dynamic e);

abstract class PayConfirmationRepository
    extends RepositoryBase<PayConfirmationModel, PayConfirmationEntity> {
  @override
  Future<PayConfirmationEntity> addEntity(
      String documentID, PayConfirmationEntity value);
  @override
  Future<PayConfirmationEntity> updateEntity(
      String documentID, PayConfirmationEntity value);
  @override
  Future<PayConfirmationModel> add(PayConfirmationModel value);
  @override
  Future<void> delete(PayConfirmationModel value);
  @override
  Future<PayConfirmationModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<PayConfirmationModel> update(PayConfirmationModel value);

  @override
  Stream<List<PayConfirmationModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<PayConfirmationModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PayConfirmationModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PayConfirmationModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<PayConfirmationModel?>> listen(
      PayConfirmationModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<PayConfirmationModel?>> listenWithDetails(
      PayConfirmationModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<PayConfirmationModel?> listenTo(
      String documentId, PayConfirmationChanged changed,
      {PayConfirmationErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<PayConfirmationModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
