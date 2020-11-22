/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_pkg_shop/model/shop_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


class ShopJsFirestore implements ShopRepository {
  Future<ShopModel> add(ShopModel value) {
    return shopCollection.doc(value.documentID)
        .set(value.toEntity(appId: appID).toDocument())
        .then((_) => value);
  }

  Future<void> delete(ShopModel value) {
    return shopCollection.doc(value.documentID).delete();
  }

  Future<ShopModel> update(ShopModel value) {
    return shopCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appID).toDocument())
        .then((_) => value);
  }

  ShopModel _populateDoc(DocumentSnapshot doc) {
    return ShopModel.fromEntity(doc.id, ShopEntity.fromMap(doc.data()));
  }

  Future<ShopModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ShopModel.fromEntityPlus(doc.id, ShopEntity.fromMap(doc.data()));
  }

  Future<ShopModel> get(String id) {
    return shopCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<ShopModel>> listen(ShopModelTrigger trigger) {
    // If we use shopCollection here, then the second subscription fails
    Stream<List<ShopModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<ShopModel> shops  = data.docs.map((doc) {
        ShopModel value = _populateDoc(doc);
        return value;
      }).toList();
      return shops;
    });

    return stream.listen((listOfShopModels) {
      trigger(listOfShopModels);
    });
  }

  StreamSubscription<List<ShopModel>> listenWithDetails(ShopModelTrigger trigger) {
    // If we use shopCollection here, then the second subscription fails
    Stream<List<ShopModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfShopModels) {
      trigger(listOfShopModels);
    });
  }

  Stream<List<ShopModel>> values() {
    return shopCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<ShopModel>> valuesWithDetails() {
    return shopCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<ShopModel>> valuesList() {
    return shopCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<ShopModel>> valuesListWithDetails() {
    return shopCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return shopCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => shopCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Shop-$appID');

  final String appID;
  
  ShopJsFirestore(this.appID) : shopCollection = firestore().collection('Shop-$appID');

  final CollectionReference shopCollection;
}
