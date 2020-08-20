/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'member_cart_model.dart';
import 'member_cart_repository.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';


import 'cart_item_model.dart';
import 'cart_item_cache.dart';
class MemberCartCache implements MemberCartRepository {

  final MemberCartRepository reference;
  final Map<String, MemberCartModel> fullCache = Map();

  MemberCartCache(this.reference);

  Future<MemberCartModel> add(MemberCartModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(MemberCartModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<MemberCartModel> get(String id){
    MemberCartModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<MemberCartModel> update(MemberCartModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<MemberCartModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<MemberCartModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<MemberCartModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<MemberCartModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<MemberCartModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<MemberCartModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<MemberCartModel> refreshRelations(MemberCartModel model) async {

    List<CartItemModel> itemsHolder = List<CartItemModel>.from(await Future.wait(await model.items.map((element) async {
      return await CartItemCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        items: itemsHolder,


    );
  }

}

