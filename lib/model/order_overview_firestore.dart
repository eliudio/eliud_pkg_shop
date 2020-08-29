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

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


class OrderOverviewFirestore implements OrderOverviewRepository {
  Future<OrderOverviewModel> add(OrderOverviewModel value) {
    return OrderOverviewCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(OrderOverviewModel value) {
    return OrderOverviewCollection.document(value.documentID).delete();
  }

  Future<OrderOverviewModel> update(OrderOverviewModel value) {
    return OrderOverviewCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  OrderOverviewModel _populateDoc(DocumentSnapshot doc) {
    return OrderOverviewModel.fromEntity(doc.documentID, OrderOverviewEntity.fromMap(doc.data));
  }

  Future<OrderOverviewModel> _populateDocPlus(DocumentSnapshot doc) async {
    return OrderOverviewModel.fromEntityPlus(doc.documentID, OrderOverviewEntity.fromMap(doc.data));  }

  Future<OrderOverviewModel> get(String id) {
    return OrderOverviewCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<OrderOverviewModel>> listen(OrderOverviewModelTrigger trigger) {
    Stream<List<OrderOverviewModel>> stream = OrderOverviewCollection.snapshots()
        .map((data) {
      Iterable<OrderOverviewModel> orderOverviews  = data.documents.map((doc) {
        OrderOverviewModel value = _populateDoc(doc);
        return value;
      }).toList();
      return orderOverviews;
    });

    return stream.listen((listOfOrderOverviewModels) {
      trigger(listOfOrderOverviewModels);
    });
  }

  StreamSubscription<List<OrderOverviewModel>> listenWithDetails(OrderOverviewModelTrigger trigger) {
    Stream<List<OrderOverviewModel>> stream = OrderOverviewCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfOrderOverviewModels) {
      trigger(listOfOrderOverviewModels);
    });
  }


  Stream<List<OrderOverviewModel>> values() {
    return OrderOverviewCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<OrderOverviewModel>> valuesWithDetails() {
    return OrderOverviewCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<OrderOverviewModel>> valuesList() async {
    return await OrderOverviewCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<OrderOverviewModel>> valuesListWithDetails() async {
    return await OrderOverviewCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return OrderOverviewCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference OrderOverviewCollection;

  OrderOverviewFirestore(this.appID) : OrderOverviewCollection = Firestore.instance.collection('OrderOverview-${appID}');
}

