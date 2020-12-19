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

import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class PayConfirmationFirestore implements PayConfirmationRepository {
  Future<PayConfirmationModel> add(PayConfirmationModel value) {
    return PayConfirmationCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(PayConfirmationModel value) {
    return PayConfirmationCollection.document(value.documentID).delete();
  }

  Future<PayConfirmationModel> update(PayConfirmationModel value) {
    return PayConfirmationCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  PayConfirmationModel _populateDoc(DocumentSnapshot value) {
    return PayConfirmationModel.fromEntity(value.documentID, PayConfirmationEntity.fromMap(value.data));
  }

  Future<PayConfirmationModel> _populateDocPlus(DocumentSnapshot value) async {
    return PayConfirmationModel.fromEntityPlus(value.documentID, PayConfirmationEntity.fromMap(value.data), appId: appId);  }

  Future<PayConfirmationModel> get(String id) {
    return PayConfirmationCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<PayConfirmationModel>> listen(PayConfirmationModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    Stream<List<PayConfirmationModel>> stream;
    if (orderBy == null) {
       stream = PayConfirmationCollection.snapshots().map((data) {
        Iterable<PayConfirmationModel> payConfirmations  = data.documents.map((doc) {
          PayConfirmationModel value = _populateDoc(doc);
          return value;
        }).toList();
        return payConfirmations;
      });
    } else {
      stream = PayConfirmationCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<PayConfirmationModel> payConfirmations  = data.documents.map((doc) {
          PayConfirmationModel value = _populateDoc(doc);
          return value;
        }).toList();
        return payConfirmations;
      });
  
    }
    return stream.listen((listOfPayConfirmationModels) {
      trigger(listOfPayConfirmationModels);
    });
  }

  StreamSubscription<List<PayConfirmationModel>> listenWithDetails(PayConfirmationModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    Stream<List<PayConfirmationModel>> stream;
    if (orderBy == null) {
      stream = PayConfirmationCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = PayConfirmationCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfPayConfirmationModels) {
      trigger(listOfPayConfirmationModels);
    });
  }


  Stream<List<PayConfirmationModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<PayConfirmationModel>> _values = getQuery(PayConfirmationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<PayConfirmationModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<PayConfirmationModel>> _values = getQuery(PayConfirmationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PayConfirmationModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<PayConfirmationModel> _values = await getQuery(PayConfirmationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PayConfirmationModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<PayConfirmationModel> _values = await getQuery(PayConfirmationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).getDocuments().then((value) {
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
    return PayConfirmationCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }


  final String appId;
  final CollectionReference PayConfirmationCollection;

  PayConfirmationFirestore(this.appId) : PayConfirmationCollection = Firestore.instance.collection('PayConfirmation-${appId}');
}

