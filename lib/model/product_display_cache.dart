/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_display_repository.dart';
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

class ProductDisplayCache implements ProductDisplayRepository {

  final ProductDisplayRepository reference;
  final Map<String, ProductDisplayModel> fullCache = Map();

  ProductDisplayCache(this.reference);

  Future<ProductDisplayModel> add(ProductDisplayModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(ProductDisplayModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<ProductDisplayModel> get(String id){
    ProductDisplayModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<ProductDisplayModel> update(ProductDisplayModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<ProductDisplayModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    return reference.values(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }

  @override
  Stream<List<ProductDisplayModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    return reference.valuesWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }

  @override
  Future<List<ProductDisplayModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) async {
    return await reference.valuesList(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }
  
  @override
  Future<List<ProductDisplayModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel}) async {
    return await reference.valuesListWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<ProductDisplayModel>> listen(trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel}) {
    return reference.listen(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }

  @override
  StreamSubscription<List<ProductDisplayModel>> listenWithDetails(trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel}) {
    return reference.listenWithDetails(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }


  static Future<ProductDisplayModel> refreshRelations(ProductDisplayModel model) async {

    BackgroundModel itemDetailBackgroundHolder;
    if (model.itemDetailBackground != null) {
      try {
        await backgroundRepository(appId: model.itemDetailBackground.appId).get(model.itemDetailBackground.documentID).then((val) {
          itemDetailBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    ShopModel shopHolder;
    if (model.shop != null) {
      try {
        await shopRepository(appId: model.shop.appId).get(model.shop.documentID).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        itemDetailBackground: itemDetailBackgroundHolder,

        shop: shopHolder,


    );
  }

}

