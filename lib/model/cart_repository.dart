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
  Stream<List<CartModel>> values();
  Stream<List<CartModel>> valuesWithDetails();
  StreamSubscription<List<CartModel>> listen(CartModelTrigger trigger);
StreamSubscription<List<CartModel>> listenWithDetails(CartModelTrigger trigger);
  void flush();
  Future<List<CartModel>> valuesList();
  Future<List<CartModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


