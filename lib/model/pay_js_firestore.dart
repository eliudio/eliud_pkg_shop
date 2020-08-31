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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_pkg_shop/model/pay_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


class PayJsFirestore implements PayRepository {
  Future<PayModel> add(PayModel value) {
    return payCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(PayModel value) {
    return payCollection.doc(value.documentID).delete();
  }

  Future<PayModel> update(PayModel value) {
    return payCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  PayModel _populateDoc(DocumentSnapshot doc) {
    return PayModel.fromEntity(doc.id, PayEntity.fromMap(doc.data()));
  }

  Future<PayModel> _populateDocPlus(DocumentSnapshot doc) async {
    return PayModel.fromEntityPlus(doc.id, PayEntity.fromMap(doc.data()));
  }

  Future<PayModel> get(String id) {
    return payCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<PayModel>> listen(PayModelTrigger trigger) {
    // If we use payCollection here, then the second subscription fails
    Stream<List<PayModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<PayModel> pays  = data.docs.map((doc) {
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
    // If we use payCollection here, then the second subscription fails
    Stream<List<PayModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPayModels) {
      trigger(listOfPayModels);
    });
  }

  Stream<List<PayModel>> values() {
    return payCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<PayModel>> valuesWithDetails() {
    return payCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<PayModel>> valuesList() {
    return payCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<PayModel>> valuesListWithDetails() {
    return payCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return payCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => payCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Pay-$appID');

  final String appID;
  
  PayJsFirestore(this.appID) : payCollection = firestore().collection('Pay-$appID');

  final CollectionReference payCollection;
}
