/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';

typedef CartItemModelTrigger(List<CartItemModel> list);

abstract class CartItemRepository {
  Future<CartItemModel> add(CartItemModel value);
  Future<void> delete(CartItemModel value);
  Future<CartItemModel> get(String id);
  Future<CartItemModel> update(CartItemModel value);
  Stream<List<CartItemModel>> values({String orderBy, bool descending });
  Stream<List<CartItemModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<CartItemModel>> valuesList({String orderBy, bool descending });
  Future<List<CartItemModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<CartItemModel>> listen(CartItemModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<CartItemModel>> listenWithDetails(CartItemModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


