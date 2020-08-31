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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


class PayConfirmationJsFirestore implements PayConfirmationRepository {
  Future<PayConfirmationModel> add(PayConfirmationModel value) {
    return payConfirmationCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(PayConfirmationModel value) {
    return payConfirmationCollection.doc(value.documentID).delete();
  }

  Future<PayConfirmationModel> update(PayConfirmationModel value) {
    return payConfirmationCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  PayConfirmationModel _populateDoc(DocumentSnapshot doc) {
    return PayConfirmationModel.fromEntity(doc.id, PayConfirmationEntity.fromMap(doc.data()));
  }

  Future<PayConfirmationModel> _populateDocPlus(DocumentSnapshot doc) async {
    return PayConfirmationModel.fromEntityPlus(doc.id, PayConfirmationEntity.fromMap(doc.data()));
  }

  Future<PayConfirmationModel> get(String id) {
    return payConfirmationCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<PayConfirmationModel>> listen(PayConfirmationModelTrigger trigger) {
    // If we use payConfirmationCollection here, then the second subscription fails
    Stream<List<PayConfirmationModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<PayConfirmationModel> payConfirmations  = data.docs.map((doc) {
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
    // If we use payConfirmationCollection here, then the second subscription fails
    Stream<List<PayConfirmationModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPayConfirmationModels) {
      trigger(listOfPayConfirmationModels);
    });
  }

  Stream<List<PayConfirmationModel>> values() {
    return payConfirmationCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<PayConfirmationModel>> valuesWithDetails() {
    return payConfirmationCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<PayConfirmationModel>> valuesList() {
    return payConfirmationCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<PayConfirmationModel>> valuesListWithDetails() {
    return payConfirmationCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return payConfirmationCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => payConfirmationCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('PayConfirmation-$appID');

  final String appID;
  
  PayConfirmationJsFirestore(this.appID) : payConfirmationCollection = firestore().collection('PayConfirmation-$appID');

  final CollectionReference payConfirmationCollection;
}
