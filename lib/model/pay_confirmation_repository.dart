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

typedef PayConfirmationModelTrigger(List<PayConfirmationModel?> list);
typedef PayConfirmationChanged(PayConfirmationModel? value);
typedef PayConfirmationErrorHandler(o, e);

abstract class PayConfirmationRepository extends RepositoryBase<PayConfirmationModel, PayConfirmationEntity> {
  Future<PayConfirmationEntity> addEntity(String documentID, PayConfirmationEntity value);
  Future<PayConfirmationEntity> updateEntity(String documentID, PayConfirmationEntity value);
  Future<PayConfirmationModel> add(PayConfirmationModel value);
  Future<void> delete(PayConfirmationModel value);
  Future<PayConfirmationModel?> get(String? id, { Function(Exception)? onError });
  Future<PayConfirmationModel> update(PayConfirmationModel value);

  Stream<List<PayConfirmationModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<PayConfirmationModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<PayConfirmationModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<PayConfirmationModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<PayConfirmationModel?>> listen(PayConfirmationModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<PayConfirmationModel?>> listenWithDetails(PayConfirmationModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<PayConfirmationModel?> listenTo(String documentId, PayConfirmationChanged changed, {PayConfirmationErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<PayConfirmationModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


