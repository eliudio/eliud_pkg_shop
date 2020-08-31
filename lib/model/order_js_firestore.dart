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

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'order_repository.dart';


import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class OrderJsFirestore implements OrderRepository {
  Future<OrderModel> add(OrderModel value) {
    return orderCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(OrderModel value) {
    return orderCollection.doc(value.documentID).delete();
  }

  Future<OrderModel> update(OrderModel value) {
    return orderCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  OrderModel _populateDoc(DocumentSnapshot doc) {
    return OrderModel.fromEntity(doc.id, OrderEntity.fromMap(doc.data()));
  }

  Future<OrderModel> _populateDocPlus(DocumentSnapshot doc) async {
    return OrderModel.fromEntityPlus(doc.id, OrderEntity.fromMap(doc.data()));
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

  StreamSubscription<List<OrderModel>> listen(OrderModelTrigger trigger) {
    // If we use orderCollection here, then the second subscription fails
    Stream<List<OrderModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<OrderModel> orders  = data.docs.map((doc) {
        OrderModel value = _populateDoc(doc);
        return value;
      }).toList();
      return orders;
    });

    return stream.listen((listOfOrderModels) {
      trigger(listOfOrderModels);
    });
  }

  StreamSubscription<List<OrderModel>> listenWithDetails(OrderModelTrigger trigger) {
    // If we use orderCollection here, then the second subscription fails
    Stream<List<OrderModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfOrderModels) {
      trigger(listOfOrderModels);
    });
  }

  Stream<List<OrderModel>> values() {
    return orderCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<OrderModel>> valuesWithDetails() {
    return orderCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<OrderModel>> valuesList() {
    return orderCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<OrderModel>> valuesListWithDetails() {
    return orderCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return orderCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => orderCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Order-$appID');

  final String appID;
  
  OrderJsFirestore(this.appID) : orderCollection = firestore().collection('Order-$appID');

  final CollectionReference orderCollection;
}
