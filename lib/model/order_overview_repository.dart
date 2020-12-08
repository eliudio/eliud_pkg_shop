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

import 'dart:async';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';

typedef OrderOverviewModelTrigger(List<OrderOverviewModel> list);

abstract class OrderOverviewRepository {
  Future<OrderOverviewModel> add(OrderOverviewModel value);
  Future<void> delete(OrderOverviewModel value);
  Future<OrderOverviewModel> get(String id);
  Future<OrderOverviewModel> update(OrderOverviewModel value);
  Stream<List<OrderOverviewModel>> values();
  Stream<List<OrderOverviewModel>> valuesWithDetails();  Future<List<OrderOverviewModel>> valuesList();
  Future<List<OrderOverviewModel>> valuesListWithDetails();
  StreamSubscription<List<OrderOverviewModel>> listen(OrderOverviewModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<OrderOverviewModel>> listenWithDetails(OrderOverviewModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


