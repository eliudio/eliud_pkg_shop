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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_pkg_shop/model/cart_repository.dart';

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


class CartFirestore implements CartRepository {
  Future<CartModel> add(CartModel value) {
    return CartCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(CartModel value) {
    return CartCollection.document(value.documentID).delete();
  }

  Future<CartModel> update(CartModel value) {
    return CartCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  CartModel _populateDoc(DocumentSnapshot doc) {
    return CartModel.fromEntity(doc.documentID, CartEntity.fromMap(doc.data));
  }

  Future<CartModel> _populateDocPlus(DocumentSnapshot doc) async {
    return CartModel.fromEntityPlus(doc.documentID, CartEntity.fromMap(doc.data));  }

  Future<CartModel> get(String id) {
    return CartCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<CartModel>> listen(CartModelTrigger trigger) {
    Stream<List<CartModel>> stream = CartCollection.snapshots()
        .map((data) {
      Iterable<CartModel> carts  = data.documents.map((doc) {
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
    Stream<List<CartModel>> stream = CartCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfCartModels) {
      trigger(listOfCartModels);
    });
  }


  Stream<List<CartModel>> values() {
    return CartCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<CartModel>> valuesWithDetails() {
    return CartCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<CartModel>> valuesList() async {
    return await CartCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<CartModel>> valuesListWithDetails() async {
    return await CartCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return CartCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference CartCollection;

  CartFirestore(this.appID) : CartCollection = Firestore.instance.collection('Cart-${appID}');
}

