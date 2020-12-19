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

import 'package:eliud_pkg_shop/model/cart_item_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef CartItemModelTrigger(List<CartItemModel> list);

abstract class CartItemRepository {
  Future<CartItemModel> add(CartItemModel value);
  Future<void> delete(CartItemModel value);
  Future<CartItemModel> get(String id);
  Future<CartItemModel> update(CartItemModel value);

  Stream<List<CartItemModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Stream<List<CartItemModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<CartItemModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<CartItemModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});

  StreamSubscription<List<CartItemModel>> listen(CartItemModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  StreamSubscription<List<CartItemModel>> listenWithDetails(CartItemModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  void flush();

  Future<void> deleteAll();
}


