/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_shop/model/pay_model.dart';

typedef PayModelTrigger(List<PayModel> list);

abstract class PayRepository {
  Future<PayModel> add(PayModel value);
  Future<void> delete(PayModel value);
  Future<PayModel> get(String id);
  Future<PayModel> update(PayModel value);
  Stream<List<PayModel>> values();
  Stream<List<PayModel>> valuesWithDetails();  Future<List<PayModel>> valuesList();
  Future<List<PayModel>> valuesListWithDetails();
  StreamSubscription<List<PayModel>> listen(PayModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<PayModel>> listenWithDetails(PayModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


