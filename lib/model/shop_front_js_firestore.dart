/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'shop_front_repository.dart';


import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class ShopFrontJsFirestore implements ShopFrontRepository {
  Future<ShopFrontModel> add(ShopFrontModel value) {
    return shopFrontCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(ShopFrontModel value) {
    return shopFrontCollection.doc(value.documentID).delete();
  }

  Future<ShopFrontModel> update(ShopFrontModel value) {
    return shopFrontCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  ShopFrontModel _populateDoc(DocumentSnapshot doc) {
    return ShopFrontModel.fromEntity(doc.id, ShopFrontEntity.fromMap(doc.data()));
  }

  Future<ShopFrontModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ShopFrontModel.fromEntityPlus(doc.id, ShopFrontEntity.fromMap(doc.data()));
  }

  Future<ShopFrontModel> get(String id) {
    return shopFrontCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<ShopFrontModel>> listen(ShopFrontModelTrigger trigger) {
    // If we use shopFrontCollection here, then the second subscription fails
    Stream<List<ShopFrontModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<ShopFrontModel> shopFronts  = data.docs.map((doc) {
        ShopFrontModel value = _populateDoc(doc);
        return value;
      }).toList();
      return shopFronts;
    });

    return stream.listen((listOfShopFrontModels) {
      trigger(listOfShopFrontModels);
    });
  }

  StreamSubscription<List<ShopFrontModel>> listenWithDetails(ShopFrontModelTrigger trigger) {
    // If we use shopFrontCollection here, then the second subscription fails
    Stream<List<ShopFrontModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfShopFrontModels) {
      trigger(listOfShopFrontModels);
    });
  }

  Stream<List<ShopFrontModel>> values() {
    return shopFrontCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<ShopFrontModel>> valuesWithDetails() {
    return shopFrontCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<ShopFrontModel>> valuesList() {
    return shopFrontCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<ShopFrontModel>> valuesListWithDetails() {
    return shopFrontCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return shopFrontCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => shopFrontCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('ShopFront-$appID');

  final String appID;
  
  ShopFrontJsFirestore(this.appID) : shopFrontCollection = firestore().collection('ShopFront-$appID');

  final CollectionReference shopFrontCollection;
}
