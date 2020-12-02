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
import 'package:eliud_pkg_shop/model/shop_front_repository.dart';
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

class ShopFrontCache implements ShopFrontRepository {

  final ShopFrontRepository reference;
  final Map<String, ShopFrontModel> fullCache = Map();

  ShopFrontCache(this.reference);

  Future<ShopFrontModel> add(ShopFrontModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(ShopFrontModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<ShopFrontModel> get(String id){
    ShopFrontModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<ShopFrontModel> update(ShopFrontModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<ShopFrontModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<ShopFrontModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<ShopFrontModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<ShopFrontModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<ShopFrontModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<ShopFrontModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<ShopFrontModel> refreshRelations(ShopFrontModel model) async {

    ShopModel shopHolder;
    if (model.shop != null) {
      try {
        await shopRepository(appId: model.shop.appId).get(model.shop.documentID).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel itemCardBackgroundHolder;
    if (model.itemCardBackground != null) {
      try {
        await backgroundRepository(appId: model.itemCardBackground.appId).get(model.itemCardBackground.documentID).then((val) {
          itemCardBackgroundHolder = val;
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

        itemCardBackground: itemCardBackgroundHolder,

        itemDetailBackground: itemDetailBackgroundHolder,


    );
  }

}

