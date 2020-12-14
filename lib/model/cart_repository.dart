/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_shop/model/cart_model.dart';

typedef CartModelTrigger(List<CartModel> list);

abstract class CartRepository {
  Future<CartModel> add(CartModel value);
  Future<void> delete(CartModel value);
  Future<CartModel> get(String id);
  Future<CartModel> update(CartModel value);
  Stream<List<CartModel>> values({String orderBy, bool descending });
  Stream<List<CartModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<CartModel>> valuesList({String orderBy, bool descending });
  Future<List<CartModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<CartModel>> listen(CartModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<CartModel>> listenWithDetails(CartModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


