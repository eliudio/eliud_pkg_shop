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

import 'package:eliud_pkg_shop/model/shop_repository.dart';

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

class ShopFirestore implements ShopRepository {
  Future<ShopModel> add(ShopModel value) {
    return ShopCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(ShopModel value) {
    return ShopCollection.document(value.documentID).delete();
  }

  Future<ShopModel> update(ShopModel value) {
    return ShopCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  ShopModel _populateDoc(DocumentSnapshot value) {
    return ShopModel.fromEntity(value.documentID, ShopEntity.fromMap(value.data));
  }

  Future<ShopModel> _populateDocPlus(DocumentSnapshot value) async {
    return ShopModel.fromEntityPlus(value.documentID, ShopEntity.fromMap(value.data), appId: appId);  }

  Future<ShopModel> get(String id) {
    return ShopCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<ShopModel>> listen(ShopModelTrigger trigger, {String currentMember, String orderBy, bool descending}) {
    Stream<List<ShopModel>> stream;
    if (orderBy == null) {
       stream = ShopCollection.snapshots().map((data) {
        Iterable<ShopModel> shops  = data.documents.map((doc) {
          ShopModel value = _populateDoc(doc);
          return value;
        }).toList();
        return shops;
      });
    } else {
      stream = ShopCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<ShopModel> shops  = data.documents.map((doc) {
          ShopModel value = _populateDoc(doc);
          return value;
        }).toList();
        return shops;
      });
  
    }
    return stream.listen((listOfShopModels) {
      trigger(listOfShopModels);
    });
  }

  StreamSubscription<List<ShopModel>> listenWithDetails(ShopModelTrigger trigger, {String currentMember, String orderBy, bool descending}) {
    Stream<List<ShopModel>> stream;
    if (orderBy == null) {
      stream = ShopCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = ShopCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfShopModels) {
      trigger(listOfShopModels);
    });
  }


  Stream<List<ShopModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<ShopModel>> _values = getQuery(ShopCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<ShopModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<ShopModel>> _values = getQuery(ShopCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<ShopModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<ShopModel> _values = await getQuery(ShopCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<ShopModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<ShopModel> _values = await getQuery(ShopCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
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
    return ShopCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }


  final String appId;
  final CollectionReference ShopCollection;

  ShopFirestore(this.appId) : ShopCollection = Firestore.instance.collection('Shop-${appId}');
}

