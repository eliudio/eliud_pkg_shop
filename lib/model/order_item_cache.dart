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
import 'package:eliud_pkg_shop/model/order_item_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_pkg_shop/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class OrderItemCache implements OrderItemRepository {

  final OrderItemRepository reference;
  final Map<String, OrderItemModel> fullCache = Map();

  OrderItemCache(this.reference);

  Future<OrderItemModel> add(OrderItemModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(OrderItemModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<OrderItemModel> get(String id){
    OrderItemModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<OrderItemModel> update(OrderItemModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<OrderItemModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<OrderItemModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<OrderItemModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<OrderItemModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<OrderItemModel>> listen(trigger, { String orderBy, bool descending }) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending);
  }

  @override
  StreamSubscription<List<OrderItemModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<OrderItemModel> refreshRelations(OrderItemModel model) async {

    ProductModel productHolder;
    if (model.product != null) {
      try {
        await productRepository(appId: model.product.appId).get(model.product.documentID).then((val) {
          productHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        product: productHolder,


    );
  }

}

