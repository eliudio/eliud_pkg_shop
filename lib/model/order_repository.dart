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
import 'order_model.dart';

typedef OrderModelTrigger(List<OrderModel> list);

abstract class OrderRepository {
  Future<OrderModel> add(OrderModel value);
  Future<void> delete(OrderModel value);
  Future<OrderModel> get(String id);
  Future<OrderModel> update(OrderModel value);
  Stream<List<OrderModel>> values();
  Stream<List<OrderModel>> valuesWithDetails();
  StreamSubscription<List<OrderModel>> listen(OrderModelTrigger trigger);
StreamSubscription<List<OrderModel>> listenWithDetails(OrderModelTrigger trigger);
  void flush();
  Future<List<OrderModel>> valuesList();
  Future<List<OrderModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


