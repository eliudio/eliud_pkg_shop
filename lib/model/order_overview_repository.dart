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

typedef OrderOverviewModelTrigger(List<OrderOverviewModel?> list);
typedef OrderOverviewChanged(OrderOverviewModel? value);
typedef OrderOverviewErrorHandler(o, e);

abstract class OrderOverviewRepository extends RepositoryBase<OrderOverviewModel, OrderOverviewEntity> {
  Future<OrderOverviewEntity> addEntity(String documentID, OrderOverviewEntity value);
  Future<OrderOverviewEntity> updateEntity(String documentID, OrderOverviewEntity value);
  Future<OrderOverviewModel> add(OrderOverviewModel value);
  Future<void> delete(OrderOverviewModel value);
  Future<OrderOverviewModel?> get(String? id, { Function(Exception)? onError });
  Future<OrderOverviewModel> update(OrderOverviewModel value);

  Stream<List<OrderOverviewModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<OrderOverviewModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<OrderOverviewModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<OrderOverviewModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<OrderOverviewModel?>> listen(OrderOverviewModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<OrderOverviewModel?>> listenWithDetails(OrderOverviewModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<OrderOverviewModel?> listenTo(String documentId, OrderOverviewChanged changed, {OrderOverviewErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<OrderOverviewModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


