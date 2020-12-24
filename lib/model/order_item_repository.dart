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
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef OrderItemModelTrigger(List<OrderItemModel> list);

abstract class OrderItemRepository {
  Future<OrderItemModel> add(OrderItemModel value);
  Future<void> delete(OrderItemModel value);
  Future<OrderItemModel> get(String id);
  Future<OrderItemModel> update(OrderItemModel value);

  Stream<List<OrderItemModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Stream<List<OrderItemModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Future<List<OrderItemModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Future<List<OrderItemModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});

  StreamSubscription<List<OrderItemModel>> listen(OrderItemModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel});
  StreamSubscription<List<OrderItemModel>> listenWithDetails(OrderItemModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel});
  void flush();

  dynamic getSubCollection(String documentId, String name);

  Future<void> deleteAll();
}


