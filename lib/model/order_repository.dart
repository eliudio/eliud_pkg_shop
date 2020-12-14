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

import 'dart:async';
import 'package:eliud_pkg_shop/model/order_model.dart';

typedef OrderModelTrigger(List<OrderModel> list);

abstract class OrderRepository {
  Future<OrderModel> add(OrderModel value);
  Future<void> delete(OrderModel value);
  Future<OrderModel> get(String id);
  Future<OrderModel> update(OrderModel value);
  Stream<List<OrderModel>> values({String orderBy, bool descending });
  Stream<List<OrderModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<OrderModel>> valuesList({String orderBy, bool descending });
  Future<List<OrderModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<OrderModel>> listen(OrderModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<OrderModel>> listenWithDetails(OrderModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


