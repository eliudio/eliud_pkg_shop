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
import 'package:cloud_firestore/cloud_firestore.dart';
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


class OrderFirestore implements OrderRepository {
  Future<OrderModel> add(OrderModel value) {
    return OrderCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(OrderModel value) {
    return OrderCollection.document(value.documentID).delete();
  }

  Future<OrderModel> update(OrderModel value) {
    return OrderCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  OrderModel _populateDoc(DocumentSnapshot value) {
    return OrderModel.fromEntity(value.documentID, OrderEntity.fromMap(value.data));
  }

  Future<OrderModel> _populateDocPlus(DocumentSnapshot value) async {
    return OrderModel.fromEntityPlus(value.documentID, OrderEntity.fromMap(value.data), appId: appId);  }

  Future<OrderModel> get(String id) {
    return OrderCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<OrderModel>> listen(OrderModelTrigger trigger) {
    Stream<List<OrderModel>> stream = OrderCollection.snapshots()
        .map((data) {
      Iterable<OrderModel> orders  = data.documents.map((doc) {
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
    Stream<List<OrderModel>> stream = OrderCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfOrderModels) {
      trigger(listOfOrderModels);
    });
  }


  Stream<List<OrderModel>> values() {
    return OrderCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<OrderModel>> valuesWithDetails() {
    return OrderCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<OrderModel>> valuesList() async {
    return await OrderCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<OrderModel>> valuesListWithDetails() async {
    return await OrderCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return OrderCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference OrderCollection;

  OrderFirestore(this.appId) : OrderCollection = Firestore.instance.collection('Order-${appId}');
}

