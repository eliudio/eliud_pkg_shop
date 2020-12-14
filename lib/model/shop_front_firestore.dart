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
import 'package:eliud_pkg_shop/model/shop_front_repository.dart';

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


class ShopFrontFirestore implements ShopFrontRepository {
  Future<ShopFrontModel> add(ShopFrontModel value) {
    return ShopFrontCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(ShopFrontModel value) {
    return ShopFrontCollection.document(value.documentID).delete();
  }

  Future<ShopFrontModel> update(ShopFrontModel value) {
    return ShopFrontCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  ShopFrontModel _populateDoc(DocumentSnapshot value) {
    return ShopFrontModel.fromEntity(value.documentID, ShopFrontEntity.fromMap(value.data));
  }

  Future<ShopFrontModel> _populateDocPlus(DocumentSnapshot value) async {
    return ShopFrontModel.fromEntityPlus(value.documentID, ShopFrontEntity.fromMap(value.data), appId: appId);  }

  Future<ShopFrontModel> get(String id) {
    return ShopFrontCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<ShopFrontModel>> listen(ShopFrontModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<ShopFrontModel>> stream;
    if (orderBy == null) {
       stream = ShopFrontCollection.snapshots().map((data) {
        Iterable<ShopFrontModel> shopFronts  = data.documents.map((doc) {
          ShopFrontModel value = _populateDoc(doc);
          return value;
        }).toList();
        return shopFronts;
      });
    } else {
      stream = ShopFrontCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<ShopFrontModel> shopFronts  = data.documents.map((doc) {
          ShopFrontModel value = _populateDoc(doc);
          return value;
        }).toList();
        return shopFronts;
      });
  
    }
    return stream.listen((listOfShopFrontModels) {
      trigger(listOfShopFrontModels);
    });
  }

  StreamSubscription<List<ShopFrontModel>> listenWithDetails(ShopFrontModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<ShopFrontModel>> stream;
    if (orderBy == null) {
      stream = ShopFrontCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = ShopFrontCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfShopFrontModels) {
      trigger(listOfShopFrontModels);
    });
  }


  Stream<List<ShopFrontModel>> values({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return ShopFrontCollection.snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return ShopFrontCollection.orderBy(orderBy, descending: descending).snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Stream<List<ShopFrontModel>> valuesWithDetails({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return ShopFrontCollection.snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return ShopFrontCollection.orderBy(orderBy, descending: descending).snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  Future<List<ShopFrontModel>> valuesList({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await ShopFrontCollection.getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return await ShopFrontCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Future<List<ShopFrontModel>> valuesListWithDetails({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await ShopFrontCollection.getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return await ShopFrontCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {}

  Future<void> deleteAll() {
    return ShopFrontCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference ShopFrontCollection;

  ShopFrontFirestore(this.appId) : ShopFrontCollection = Firestore.instance.collection('ShopFront-${appId}');
}

