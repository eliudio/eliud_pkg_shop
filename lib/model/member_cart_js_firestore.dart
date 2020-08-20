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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';


import 'member_cart_repository.dart';
import 'member_cart_model.dart';
import 'member_cart_entity.dart';

class MemberCartJsFirestore implements MemberCartRepository {
  Future<MemberCartModel> add(MemberCartModel value) {
    return memberCartCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(MemberCartModel value) {
    return memberCartCollection.doc(value.documentID).delete();
  }

  Future<MemberCartModel> update(MemberCartModel value) {
    return memberCartCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  MemberCartModel _populateDoc(DocumentSnapshot doc) {
    return MemberCartModel.fromEntity(doc.id, MemberCartEntity.fromMap(doc.data()));
  }

  Future<MemberCartModel> _populateDocPlus(DocumentSnapshot doc) async {
    return MemberCartModel.fromEntityPlus(doc.id, MemberCartEntity.fromMap(doc.data()));
  }

  Future<MemberCartModel> get(String id) {
    return memberCartCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<MemberCartModel>> listen(MemberCartModelTrigger trigger) {
    // If we use memberCartCollection here, then the second subscription fails
    Stream<List<MemberCartModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<MemberCartModel> memberCarts  = data.docs.map((doc) {
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
    // If we use memberCartCollection here, then the second subscription fails
    Stream<List<MemberCartModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMemberCartModels) {
      trigger(listOfMemberCartModels);
    });
  }

  Stream<List<MemberCartModel>> values() {
    return memberCartCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<MemberCartModel>> valuesWithDetails() {
    return memberCartCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<MemberCartModel>> valuesList() {
    return memberCartCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<MemberCartModel>> valuesListWithDetails() {
    return memberCartCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return memberCartCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => memberCartCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('MemberCart');

  MemberCartJsFirestore();

  final CollectionReference memberCartCollection = firestore().collection('MemberCart');
}
