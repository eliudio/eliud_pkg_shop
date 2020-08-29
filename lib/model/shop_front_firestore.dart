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
import 'package:cloud_firestore/cloud_firestore.dart';

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


class ShopFrontFirestore implements ShopFrontRepository {
  Future<ShopFrontModel> add(ShopFrontModel value) {
    return ShopFrontCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(ShopFrontModel value) {
    return ShopFrontCollection.document(value.documentID).delete();
  }

  Future<ShopFrontModel> update(ShopFrontModel value) {
    return ShopFrontCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  ShopFrontModel _populateDoc(DocumentSnapshot doc) {
    return ShopFrontModel.fromEntity(doc.documentID, ShopFrontEntity.fromMap(doc.data));
  }

  Future<ShopFrontModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ShopFrontModel.fromEntityPlus(doc.documentID, ShopFrontEntity.fromMap(doc.data));  }

  Future<ShopFrontModel> get(String id) {
    return ShopFrontCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<ShopFrontModel>> listen(ShopFrontModelTrigger trigger) {
    Stream<List<ShopFrontModel>> stream = ShopFrontCollection.snapshots()
        .map((data) {
      Iterable<ShopFrontModel> shopFronts  = data.documents.map((doc) {
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
    Stream<List<ShopFrontModel>> stream = ShopFrontCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfShopFrontModels) {
      trigger(listOfShopFrontModels);
    });
  }


  Stream<List<ShopFrontModel>> values() {
    return ShopFrontCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<ShopFrontModel>> valuesWithDetails() {
    return ShopFrontCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<ShopFrontModel>> valuesList() async {
    return await ShopFrontCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<ShopFrontModel>> valuesListWithDetails() async {
    return await ShopFrontCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return ShopFrontCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference ShopFrontCollection;

  ShopFrontFirestore(this.appID) : ShopFrontCollection = Firestore.instance.collection('ShopFront-${appID}');
}

