/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_pkg_shop/model/pay_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


class PayFirestore implements PayRepository {
  Future<PayModel> add(PayModel value) {
    return PayCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(PayModel value) {
    return PayCollection.document(value.documentID).delete();
  }

  Future<PayModel> update(PayModel value) {
    return PayCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  PayModel _populateDoc(DocumentSnapshot doc) {
    return PayModel.fromEntity(doc.documentID, PayEntity.fromMap(doc.data));
  }

  Future<PayModel> _populateDocPlus(DocumentSnapshot doc) async {
    return PayModel.fromEntityPlus(doc.documentID, PayEntity.fromMap(doc.data));  }

  Future<PayModel> get(String id) {
    return PayCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<PayModel>> listen(PayModelTrigger trigger) {
    Stream<List<PayModel>> stream = PayCollection.snapshots()
        .map((data) {
      Iterable<PayModel> pays  = data.documents.map((doc) {
        PayModel value = _populateDoc(doc);
        return value;
      }).toList();
      return pays;
    });

    return stream.listen((listOfPayModels) {
      trigger(listOfPayModels);
    });
  }

  StreamSubscription<List<PayModel>> listenWithDetails(PayModelTrigger trigger) {
    Stream<List<PayModel>> stream = PayCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPayModels) {
      trigger(listOfPayModels);
    });
  }


  Stream<List<PayModel>> values() {
    return PayCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<PayModel>> valuesWithDetails() {
    return PayCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<PayModel>> valuesList() async {
    return await PayCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<PayModel>> valuesListWithDetails() async {
    return await PayCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return PayCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference PayCollection;

  PayFirestore(this.appID) : PayCollection = Firestore.instance.collection('Pay-${appID}');
}

