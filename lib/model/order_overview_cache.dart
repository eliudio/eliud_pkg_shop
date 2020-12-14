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
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_pkg_shop/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class OrderOverviewCache implements OrderOverviewRepository {

  final OrderOverviewRepository reference;
  final Map<String, OrderOverviewModel> fullCache = Map();

  OrderOverviewCache(this.reference);

  Future<OrderOverviewModel> add(OrderOverviewModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(OrderOverviewModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<OrderOverviewModel> get(String id){
    OrderOverviewModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<OrderOverviewModel> update(OrderOverviewModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<OrderOverviewModel>> values({String orderBy, bool descending }) {
    return reference.values();
  }

  @override
  Stream<List<OrderOverviewModel>> valuesWithDetails({String orderBy, bool descending }) {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<OrderOverviewModel>> valuesList({String orderBy, bool descending }) async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<OrderOverviewModel>> valuesListWithDetails({String orderBy, bool descending }) async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<OrderOverviewModel>> listen(trigger, { String orderBy, bool descending }) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending);
  }

  @override
  StreamSubscription<List<OrderOverviewModel>> listenWithDetails(trigger, {String orderBy, bool descending }) {
    return reference.listenWithDetails(trigger);
  }


  static Future<OrderOverviewModel> refreshRelations(OrderOverviewModel model) async {

    ShopModel shopHolder;
    if (model.shop != null) {
      try {
        await shopRepository(appId: model.shop.appId).get(model.shop.documentID).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel itemImageBackgroundHolder;
    if (model.itemImageBackground != null) {
      try {
        await backgroundRepository(appId: model.itemImageBackground.appId).get(model.itemImageBackground.documentID).then((val) {
          itemImageBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel itemDetailBackgroundHolder;
    if (model.itemDetailBackground != null) {
      try {
        await backgroundRepository(appId: model.itemDetailBackground.appId).get(model.itemDetailBackground.documentID).then((val) {
          itemDetailBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        shop: shopHolder,

        itemImageBackground: itemImageBackgroundHolder,

        itemDetailBackground: itemDetailBackgroundHolder,


    );
  }

}

