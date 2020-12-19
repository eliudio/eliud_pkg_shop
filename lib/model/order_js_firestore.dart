/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/order_repository.dart';


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

class OrderJsFirestore implements OrderRepository {
  Future<OrderModel> add(OrderModel value) {
    return orderCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(OrderModel value) {
    return orderCollection.doc(value.documentID).delete();
  }

  Future<OrderModel> update(OrderModel value) {
    return orderCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  OrderModel _populateDoc(DocumentSnapshot value) {
    return OrderModel.fromEntity(value.id, OrderEntity.fromMap(value.data()));
  }

  Future<OrderModel> _populateDocPlus(DocumentSnapshot value) async {
    return OrderModel.fromEntityPlus(value.id, OrderEntity.fromMap(value.data()), appId: appId);
  }

  Future<OrderModel> get(String id) {
    return orderCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<OrderModel>> listen(OrderModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<OrderModel> orders  = data.docs.map((doc) {
          OrderModel value = _populateDoc(doc);
          return value;
        }).toList();
        return orders;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<OrderModel> orders  = data.docs.map((doc) {
          OrderModel value = _populateDoc(doc);
          return value;
        }).toList();
        return orders;
      });
    }
    return stream.listen((listOfOrderModels) {
      trigger(listOfOrderModels);
    });
  }

  StreamSubscription<List<OrderModel>> listenWithDetails(OrderModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      // If we use orderCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use orderCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfOrderModels) {
      trigger(listOfOrderModels);
    });
  }

  Stream<List<OrderModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<OrderModel>> _values = getQuery(orderCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel)
      .onSnapshot
      .map((data) { 
        return data.docs.map((doc) {
          lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<OrderModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<OrderModel>> _values = getQuery(orderCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel)
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
  Future<List<OrderModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<OrderModel> _values = await getQuery(orderCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel).get().then((value) {
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
  Future<List<OrderModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<OrderModel> _values = await getQuery(orderCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel).get().then((value) {
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
    return orderCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => orderCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Order-$appId');

  final String appId;
  
  OrderJsFirestore(this.appId) : orderCollection = firestore().collection('Order-$appId');

  final CollectionReference orderCollection;
}
