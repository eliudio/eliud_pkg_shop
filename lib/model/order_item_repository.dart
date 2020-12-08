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

import 'dart:async';
import 'package:eliud_pkg_shop/model/order_item_model.dart';

typedef OrderItemModelTrigger(List<OrderItemModel> list);

abstract class OrderItemRepository {
  Future<OrderItemModel> add(OrderItemModel value);
  Future<void> delete(OrderItemModel value);
  Future<OrderItemModel> get(String id);
  Future<OrderItemModel> update(OrderItemModel value);
  Stream<List<OrderItemModel>> values();
  Stream<List<OrderItemModel>> valuesWithDetails();
  StreamSubscription<List<OrderItemModel>> listen(OrderItemModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<OrderItemModel>> listenWithDetails(OrderItemModelTrigger trigger);
  void flush();
  Future<List<OrderItemModel>> valuesList();
  Future<List<OrderItemModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


