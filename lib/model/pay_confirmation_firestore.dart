/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


class PayConfirmationFirestore implements PayConfirmationRepository {
  Future<PayConfirmationModel> add(PayConfirmationModel value) {
    return PayConfirmationCollection.document(value.documentID).setData(value.toEntity(appId: appID).toDocument()).then((_) => value);
  }

  Future<void> delete(PayConfirmationModel value) {
    return PayConfirmationCollection.document(value.documentID).delete();
  }

  Future<PayConfirmationModel> update(PayConfirmationModel value) {
    return PayConfirmationCollection.document(value.documentID).updateData(value.toEntity(appId: appID).toDocument()).then((_) => value);
  }

  PayConfirmationModel _populateDoc(DocumentSnapshot doc) {
    return PayConfirmationModel.fromEntity(doc.documentID, PayConfirmationEntity.fromMap(doc.data));
  }

  Future<PayConfirmationModel> _populateDocPlus(DocumentSnapshot doc) async {
    return PayConfirmationModel.fromEntityPlus(doc.documentID, PayConfirmationEntity.fromMap(doc.data));  }

  Future<PayConfirmationModel> get(String id) {
    return PayConfirmationCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<PayConfirmationModel>> listen(PayConfirmationModelTrigger trigger) {
    Stream<List<PayConfirmationModel>> stream = PayConfirmationCollection.snapshots()
        .map((data) {
      Iterable<PayConfirmationModel> payConfirmations  = data.documents.map((doc) {
        PayConfirmationModel value = _populateDoc(doc);
        return value;
      }).toList();
      return payConfirmations;
    });

    return stream.listen((listOfPayConfirmationModels) {
      trigger(listOfPayConfirmationModels);
    });
  }

  StreamSubscription<List<PayConfirmationModel>> listenWithDetails(PayConfirmationModelTrigger trigger) {
    Stream<List<PayConfirmationModel>> stream = PayConfirmationCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPayConfirmationModels) {
      trigger(listOfPayConfirmationModels);
    });
  }


  Stream<List<PayConfirmationModel>> values() {
    return PayConfirmationCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<PayConfirmationModel>> valuesWithDetails() {
    return PayConfirmationCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<PayConfirmationModel>> valuesList() async {
    return await PayConfirmationCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<PayConfirmationModel>> valuesListWithDetails() async {
    return await PayConfirmationCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return PayConfirmationCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference PayConfirmationCollection;

  PayConfirmationFirestore(this.appID) : PayConfirmationCollection = Firestore.instance.collection('PayConfirmation-${appID}');
}

