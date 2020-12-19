/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/shop_front_repository.dart';


import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';



import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/tools/js_firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class ShopFrontJsFirestore implements ShopFrontRepository {
  Future<ShopFrontModel> add(ShopFrontModel value) {
    return shopFrontCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(ShopFrontModel value) {
    return shopFrontCollection.doc(value.documentID).delete();
  }

  Future<ShopFrontModel> update(ShopFrontModel value) {
    return shopFrontCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  ShopFrontModel _populateDoc(DocumentSnapshot value) {
    return ShopFrontModel.fromEntity(value.id, ShopFrontEntity.fromMap(value.data()));
  }

  Future<ShopFrontModel> _populateDocPlus(DocumentSnapshot value) async {
    return ShopFrontModel.fromEntityPlus(value.id, ShopFrontEntity.fromMap(value.data()), appId: appId);
  }

  Future<ShopFrontModel> get(String id) {
    return shopFrontCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<ShopFrontModel>> listen(ShopFrontModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<ShopFrontModel> shopFronts  = data.docs.map((doc) {
          ShopFrontModel value = _populateDoc(doc);
          return value;
        }).toList();
        return shopFronts;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<ShopFrontModel> shopFronts  = data.docs.map((doc) {
          ShopFrontModel value = _populateDoc(doc);
          return value;
        }).toList();
        return shopFronts;
      });
    }
    return stream.listen((listOfShopFrontModels) {
      trigger(listOfShopFrontModels);
    });
  }

  StreamSubscription<List<ShopFrontModel>> listenWithDetails(ShopFrontModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      // If we use shopFrontCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use shopFrontCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfShopFrontModels) {
      trigger(listOfShopFrontModels);
    });
  }

  Stream<List<ShopFrontModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<ShopFrontModel>> _values = getQuery(shopFrontCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel)
      .onSnapshot
      .map((data) { 
        return data.docs.map((doc) {
          lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<ShopFrontModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<ShopFrontModel>> _values = getQuery(shopFrontCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel)
      .onSnapshot
      .asyncMap((data) {
        return Future.wait(data.docs.map((doc) { 
          lastDoc = doc;
          return _populateDocPlus(doc);
        }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<ShopFrontModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<ShopFrontModel> _values = await getQuery(shopFrontCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel).get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<ShopFrontModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<ShopFrontModel> _values = await getQuery(shopFrontCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel).get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {  
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return shopFrontCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => shopFrontCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('ShopFront-$appId');

  final String appId;
  
  ShopFrontJsFirestore(this.appId) : shopFrontCollection = firestore().collection('ShopFront-$appId');

  final CollectionReference shopFrontCollection;
}
