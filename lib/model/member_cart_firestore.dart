/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'member_cart_repository.dart';
import 'member_cart_model.dart';
import 'member_cart_entity.dart';

class MemberCartFirestore implements MemberCartRepository {
  Future<MemberCartModel> add(MemberCartModel value) {
    return MemberCartCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(MemberCartModel value) {
    return MemberCartCollection.document(value.documentID).delete();
  }

  Future<MemberCartModel> update(MemberCartModel value) {
    return MemberCartCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  MemberCartModel _populateDoc(DocumentSnapshot doc) {
    return MemberCartModel.fromEntity(doc.documentID, MemberCartEntity.fromMap(doc.data));
  }

  Future<MemberCartModel> _populateDocPlus(DocumentSnapshot doc) async {
    return MemberCartModel.fromEntityPlus(doc.documentID, MemberCartEntity.fromMap(doc.data));  }

  Future<MemberCartModel> get(String id) {
    return MemberCartCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<MemberCartModel>> listen(MemberCartModelTrigger trigger) {
    Stream<List<MemberCartModel>> stream = MemberCartCollection.snapshots()
        .map((data) {
      Iterable<MemberCartModel> memberCarts  = data.documents.map((doc) {
        MemberCartModel value = _populateDoc(doc);
        return value;
      }).toList();
      return memberCarts;
    });

    return stream.listen((listOfMemberCartModels) {
      trigger(listOfMemberCartModels);
    });
  }

  StreamSubscription<List<MemberCartModel>> listenWithDetails(MemberCartModelTrigger trigger) {
    Stream<List<MemberCartModel>> stream = MemberCartCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMemberCartModels) {
      trigger(listOfMemberCartModels);
    });
  }


  Stream<List<MemberCartModel>> values() {
    return MemberCartCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<MemberCartModel>> valuesWithDetails() {
    return MemberCartCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<MemberCartModel>> valuesList() async {
    return await MemberCartCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<MemberCartModel>> valuesListWithDetails() async {
    return await MemberCartCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return MemberCartCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  MemberCartFirestore();

  final CollectionReference MemberCartCollection = Firestore.instance.collection('MemberCart');

}

