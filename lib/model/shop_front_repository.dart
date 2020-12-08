/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';

typedef ShopFrontModelTrigger(List<ShopFrontModel> list);

abstract class ShopFrontRepository {
  Future<ShopFrontModel> add(ShopFrontModel value);
  Future<void> delete(ShopFrontModel value);
  Future<ShopFrontModel> get(String id);
  Future<ShopFrontModel> update(ShopFrontModel value);
  Stream<List<ShopFrontModel>> values();
  Stream<List<ShopFrontModel>> valuesWithDetails();
  StreamSubscription<List<ShopFrontModel>> listen(ShopFrontModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<ShopFrontModel>> listenWithDetails(ShopFrontModelTrigger trigger);
  void flush();
  Future<List<ShopFrontModel>> valuesList();
  Future<List<ShopFrontModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


