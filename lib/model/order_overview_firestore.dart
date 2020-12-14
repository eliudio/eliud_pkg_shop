/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';

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


class OrderOverviewFirestore implements OrderOverviewRepository {
  Future<OrderOverviewModel> add(OrderOverviewModel value) {
    return OrderOverviewCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(OrderOverviewModel value) {
    return OrderOverviewCollection.document(value.documentID).delete();
  }

  Future<OrderOverviewModel> update(OrderOverviewModel value) {
    return OrderOverviewCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  OrderOverviewModel _populateDoc(DocumentSnapshot value) {
    return OrderOverviewModel.fromEntity(value.documentID, OrderOverviewEntity.fromMap(value.data));
  }

  Future<OrderOverviewModel> _populateDocPlus(DocumentSnapshot value) async {
    return OrderOverviewModel.fromEntityPlus(value.documentID, OrderOverviewEntity.fromMap(value.data), appId: appId);  }

  Future<OrderOverviewModel> get(String id) {
    return OrderOverviewCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<OrderOverviewModel>> listen(OrderOverviewModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<OrderOverviewModel>> stream;
    if (orderBy == null) {
       stream = OrderOverviewCollection.snapshots().map((data) {
        Iterable<OrderOverviewModel> orderOverviews  = data.documents.map((doc) {
          OrderOverviewModel value = _populateDoc(doc);
          return value;
        }).toList();
        return orderOverviews;
      });
    } else {
      stream = OrderOverviewCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<OrderOverviewModel> orderOverviews  = data.documents.map((doc) {
          OrderOverviewModel value = _populateDoc(doc);
          return value;
        }).toList();
        return orderOverviews;
      });
  
    }
    return stream.listen((listOfOrderOverviewModels) {
      trigger(listOfOrderOverviewModels);
    });
  }

  StreamSubscription<List<OrderOverviewModel>> listenWithDetails(OrderOverviewModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<OrderOverviewModel>> stream;
    if (orderBy == null) {
      stream = OrderOverviewCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = OrderOverviewCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfOrderOverviewModels) {
      trigger(listOfOrderOverviewModels);
    });
  }


  Stream<List<OrderOverviewModel>> values({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return OrderOverviewCollection.snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return OrderOverviewCollection.orderBy(orderBy, descending: descending).snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Stream<List<OrderOverviewModel>> valuesWithDetails({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return OrderOverviewCollection.snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return OrderOverviewCollection.orderBy(orderBy, descending: descending).snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  Future<List<OrderOverviewModel>> valuesList({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await OrderOverviewCollection.getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return await OrderOverviewCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Future<List<OrderOverviewModel>> valuesListWithDetails({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await OrderOverviewCollection.getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return await OrderOverviewCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {}

  Future<void> deleteAll() {
    return OrderOverviewCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference OrderOverviewCollection;

  OrderOverviewFirestore(this.appId) : OrderOverviewCollection = Firestore.instance.collection('OrderOverview-${appId}');
}

