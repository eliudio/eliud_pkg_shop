/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'order_model.dart';
import 'order_repository.dart';
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

class OrderCache implements OrderRepository {

  final OrderRepository reference;
  final Map<String, OrderModel> fullCache = Map();

  OrderCache(this.reference);

  Future<OrderModel> add(OrderModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(OrderModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<OrderModel> get(String id){
    OrderModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<OrderModel> update(OrderModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<OrderModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<OrderModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<OrderModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<OrderModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<OrderModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<OrderModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<OrderModel> refreshRelations(OrderModel model) async {

    MemberModel customerHolder;
    if (model.customer != null) {
      try {
        await memberRepository().get(model.customer.documentID).then((val) {
          customerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    CountryModel countryHolder;
    if (model.country != null) {
      try {
        await countryRepository().get(model.country.documentID).then((val) {
          countryHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    CountryModel invoiceCountryHolder;
    if (model.invoiceCountry != null) {
      try {
        await countryRepository().get(model.invoiceCountry.documentID).then((val) {
          invoiceCountryHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<OrderItemModel> productsHolder = List<OrderItemModel>.from(await Future.wait(await model.products.map((element) async {
      return await OrderItemCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        customer: customerHolder,

        country: countryHolder,

        invoiceCountry: invoiceCountryHolder,

        products: productsHolder,


    );
  }

}

