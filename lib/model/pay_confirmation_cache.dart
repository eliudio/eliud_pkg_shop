/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'pay_confirmation_model.dart';
import 'pay_confirmation_repository.dart';
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

class PayConfirmationCache implements PayConfirmationRepository {

  final PayConfirmationRepository reference;
  final Map<String, PayConfirmationModel> fullCache = Map();

  PayConfirmationCache(this.reference);

  Future<PayConfirmationModel> add(PayConfirmationModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(PayConfirmationModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<PayConfirmationModel> get(String id){
    PayConfirmationModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<PayConfirmationModel> update(PayConfirmationModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<PayConfirmationModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<PayConfirmationModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<PayConfirmationModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<PayConfirmationModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PayConfirmationModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<PayConfirmationModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<PayConfirmationModel> refreshRelations(PayConfirmationModel model) async {

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

