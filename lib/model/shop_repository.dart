/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_shop/model/shop_model.dart';

typedef ShopModelTrigger(List<ShopModel> list);

abstract class ShopRepository {
  Future<ShopModel> add(ShopModel value);
  Future<void> delete(ShopModel value);
  Future<ShopModel> get(String id);
  Future<ShopModel> update(ShopModel value);
  Stream<List<ShopModel>> values({String orderBy, bool descending });
  Stream<List<ShopModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<ShopModel>> valuesList({String orderBy, bool descending });
  Future<List<ShopModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<ShopModel>> listen(ShopModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<ShopModel>> listenWithDetails(ShopModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


