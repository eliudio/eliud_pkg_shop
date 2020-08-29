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
import 'cart_item_model.dart';
import 'cart_item_repository.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

class CartItemCache implements CartItemRepository {

  final CartItemRepository reference;
  final Map<String, CartItemModel> fullCache = Map();

  CartItemCache(this.reference);

  Future<CartItemModel> add(CartItemModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(CartItemModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<CartItemModel> get(String id){
    CartItemModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<CartItemModel> update(CartItemModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<CartItemModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<CartItemModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<CartItemModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<CartItemModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<CartItemModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<CartItemModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<CartItemModel> refreshRelations(CartItemModel model) async {

    ProductModel productHolder;
    if (model.product != null) {
      try {
        await productRepository().get(model.product.documentID).then((val) {
          productHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        product: productHolder,


    );
  }

}

