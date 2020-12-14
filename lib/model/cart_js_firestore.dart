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


class CartJsFirestore implements CartRepository {
  Future<CartModel> add(CartModel value) {
    return cartCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(CartModel value) {
    return cartCollection.doc(value.documentID).delete();
  }

  Future<CartModel> update(CartModel value) {
    return cartCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  CartModel _populateDoc(DocumentSnapshot value) {
    return CartModel.fromEntity(value.id, CartEntity.fromMap(value.data()));
  }

  Future<CartModel> _populateDocPlus(DocumentSnapshot value) async {
    return CartModel.fromEntityPlus(value.id, CartEntity.fromMap(value.data()), appId: appId);
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

  @override
  StreamSubscription<List<CartModel>> listen(CartModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<CartModel> carts  = data.docs.map((doc) {
          CartModel value = _populateDoc(doc);
          return value;
        }).toList();
        return carts;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<CartModel> carts  = data.docs.map((doc) {
          CartModel value = _populateDoc(doc);
          return value;
        }).toList();
        return carts;
      });
    }
    return stream.listen((listOfCartModels) {
      trigger(listOfCartModels);
    });
  }

  StreamSubscription<List<CartModel>> listenWithDetails(CartModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      // If we use cartCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use cartCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfCartModels) {
      trigger(listOfCartModels);
    });
  }

  Stream<List<CartModel>> values({String orderBy, bool descending }) {
    if (orderBy == null) {
      return cartCollection.onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    } else {
      return cartCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    }
  }

  Stream<List<CartModel>> valuesWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return cartCollection.onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    } else {
      return cartCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    }
  }

  @override
  Future<List<CartModel>> valuesList({String orderBy, bool descending }) {
    if (orderBy == null) {
      return cartCollection.get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return cartCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<CartModel>> valuesListWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return cartCollection.get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return cartCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return cartCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => cartCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Cart-$appId');

  final String appId;
  
  CartJsFirestore(this.appId) : cartCollection = firestore().collection('Cart-$appId');

  final CollectionReference cartCollection;
}
