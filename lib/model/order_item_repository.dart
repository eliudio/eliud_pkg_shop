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

import 'package:eliud_pkg_shop/model/order_item_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef OrderItemModelTrigger(List<OrderItemModel?> list);
typedef OrderItemChanged(OrderItemModel? value);
typedef OrderItemErrorHandler(o, e);

abstract class OrderItemRepository extends RepositoryBase<OrderItemModel, OrderItemEntity> {
  Future<OrderItemEntity> addEntity(String documentID, OrderItemEntity value);
  Future<OrderItemEntity> updateEntity(String documentID, OrderItemEntity value);
  Future<OrderItemModel> add(OrderItemModel value);
  Future<void> delete(OrderItemModel value);
  Future<OrderItemModel?> get(String? id, { Function(Exception)? onError });
  Future<OrderItemModel> update(OrderItemModel value);

  Stream<List<OrderItemModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<OrderItemModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<OrderItemModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<OrderItemModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<OrderItemModel?>> listen(OrderItemModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<OrderItemModel?>> listenWithDetails(OrderItemModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<OrderItemModel?> listenTo(String documentId, OrderItemChanged changed, {OrderItemErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<OrderItemModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


