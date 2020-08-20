/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'pay_model.dart';
import 'pay_repository.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';


import 'package:eliud_model/shared/action_model.dart';
import 'shop_model.dart';
class PayCache implements PayRepository {

  final PayRepository reference;
  final Map<String, PayModel> fullCache = Map();

  PayCache(this.reference);

  Future<PayModel> add(PayModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(PayModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<PayModel> get(String id){
    PayModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<PayModel> update(PayModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<PayModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<PayModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<PayModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<PayModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PayModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<PayModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<PayModel> refreshRelations(PayModel model) async {

    ShopModel shopHolder;
    if (model.shop != null) {
      try {
        await shopRepository().get(model.shop.documentID).then((val) {
          shopHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        shop: shopHolder,


    );
  }

}

