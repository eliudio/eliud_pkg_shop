/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';


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


class CartJsFirestore implements CartRepository {
  Future<CartModel> add(CartModel value) {
    return cartCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(CartModel value) {
    return cartCollection.doc(value.documentID).delete();
  }

  Future<CartModel> update(CartModel value) {
    return cartCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  CartModel _populateDoc(DocumentSnapshot doc) {
    return CartModel.fromEntity(doc.id, CartEntity.fromMap(doc.data()));
  }

  Future<CartModel> _populateDocPlus(DocumentSnapshot doc) async {
    return CartModel.fromEntityPlus(doc.id, CartEntity.fromMap(doc.data()));
  }

  Future<CartModel> get(String id) {
    return cartCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<CartModel>> listen(CartModelTrigger trigger) {
    // If we use cartCollection here, then the second subscription fails
    Stream<List<CartModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<CartModel> carts  = data.docs.map((doc) {
        CartModel value = _populateDoc(doc);
        return value;
      }).toList();
      return carts;
    });

    return stream.listen((listOfCartModels) {
      trigger(listOfCartModels);
    });
  }

  StreamSubscription<List<CartModel>> listenWithDetails(CartModelTrigger trigger) {
    // If we use cartCollection here, then the second subscription fails
    Stream<List<CartModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfCartModels) {
      trigger(listOfCartModels);
    });
  }

  Stream<List<CartModel>> values() {
    return cartCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<CartModel>> valuesWithDetails() {
    return cartCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<CartModel>> valuesList() {
    return cartCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<CartModel>> valuesListWithDetails() {
    return cartCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return cartCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => cartCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Cart-$appID');

  final String appID;
  
  CartJsFirestore(this.appID) : cartCollection = firestore().collection('Cart-$appID');

  final CollectionReference cartCollection;
}
