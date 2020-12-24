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
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

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

  StreamSubscription<List<OrderModel>> listen(OrderModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<OrderModel>> stream;
    if (orderBy == null) {
       stream = OrderCollection.snapshots().map((data) {
        Iterable<OrderModel> orders  = data.documents.map((doc) {
          OrderModel value = _populateDoc(doc);
          return value;
        }).toList();
        return orders;
      });
    } else {
      stream = OrderCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<OrderModel> orders  = data.documents.map((doc) {
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

  StreamSubscription<List<OrderModel>> listenWithDetails(OrderModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<OrderModel>> stream;
    if (orderBy == null) {
      stream = OrderCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = OrderCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfOrderModels) {
      trigger(listOfOrderModels);
    });
  }


  Stream<List<OrderModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<OrderModel>> _values = getQuery(OrderCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, appId: appId).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<OrderModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<OrderModel>> _values = getQuery(OrderCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, appId: appId).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<OrderModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<OrderModel> _values = await getQuery(OrderCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<OrderModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<OrderModel> _values = await getQuery(OrderCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return OrderCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return OrderCollection.document(documentId).collection(name);
  }


  final String appId;
  OrderFirestore(this.OrderCollection, this.appId);

  final CollectionReference OrderCollection;
}

