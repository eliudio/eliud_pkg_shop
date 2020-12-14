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
  Stream<List<OrderItemModel>> values({String orderBy, bool descending });
  Stream<List<OrderItemModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<OrderItemModel>> valuesList({String orderBy, bool descending });
  Future<List<OrderItemModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<OrderItemModel>> listen(OrderItemModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<OrderItemModel>> listenWithDetails(OrderItemModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


