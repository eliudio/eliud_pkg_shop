/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/order_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef OrderModelTrigger(List<OrderModel> list);

abstract class OrderRepository {
  Future<OrderModel> add(OrderModel value);
  Future<void> delete(OrderModel value);
  Future<OrderModel> get(String id);
  Future<OrderModel> update(OrderModel value);

  Stream<List<OrderModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Stream<List<OrderModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<OrderModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<OrderModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});

  StreamSubscription<List<OrderModel>> listen(OrderModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  StreamSubscription<List<OrderModel>> listenWithDetails(OrderModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  void flush();

  Future<void> deleteAll();
}


