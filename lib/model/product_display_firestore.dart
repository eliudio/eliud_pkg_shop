/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/product_display_repository.dart';

import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class ProductDisplayFirestore implements ProductDisplayRepository {
  @override
  ProductDisplayEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    return ProductDisplayEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<ProductDisplayEntity> addEntity(
      String documentID, ProductDisplayEntity value) {
    return productDisplayCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<ProductDisplayEntity> updateEntity(
      String documentID, ProductDisplayEntity value) {
    return productDisplayCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<ProductDisplayModel> add(ProductDisplayModel value) {
    return productDisplayCollection
        .doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  @override
  Future<void> delete(ProductDisplayModel value) {
    return productDisplayCollection.doc(value.documentID).delete();
  }

  @override
  Future<ProductDisplayModel> update(ProductDisplayModel value) {
    return productDisplayCollection
        .doc(value.documentID)
        .update(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<ProductDisplayModel?> _populateDoc(DocumentSnapshot value) async {
    return ProductDisplayModel.fromEntity(
        value.id, ProductDisplayEntity.fromMap(value.data()));
  }

  Future<ProductDisplayModel?> _populateDocPlus(DocumentSnapshot value) async {
    return ProductDisplayModel.fromEntityPlus(
        value.id, ProductDisplayEntity.fromMap(value.data()),
        appId: appId);
  }

  @override
  Future<ProductDisplayEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = productDisplayCollection.doc(id);
      var doc = await collection.get();
      return ProductDisplayEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving ProductDisplay with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  @override
  Future<ProductDisplayModel?> get(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = productDisplayCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving ProductDisplay with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  @override
  StreamSubscription<List<ProductDisplayModel?>> listen(
      ProductDisplayModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<ProductDisplayModel?>> stream;
    stream = getQuery(getCollection(),
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(productDisplayCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfProductDisplayModels) {
      trigger(listOfProductDisplayModels);
    });
  }

  @override
  StreamSubscription<List<ProductDisplayModel?>> listenWithDetails(
      ProductDisplayModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<ProductDisplayModel?>> stream;
    stream = getQuery(getCollection(),
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(productDisplayCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfProductDisplayModels) {
      trigger(listOfProductDisplayModels);
    });
  }

  @override
  StreamSubscription<ProductDisplayModel?> listenTo(
      String documentId, ProductDisplayChanged changed,
      {ProductDisplayErrorHandler? errorHandler}) {
    var stream =
        productDisplayCollection.doc(documentId).snapshots().asyncMap((data) {
      return _populateDocPlus(data);
    });
    var theStream = stream.listen((value) {
      changed(value);
    });
    theStream.onError((theException, theStacktrace) {
      if (errorHandler != null) {
        errorHandler(theException, theStacktrace);
      }
    });
    return theStream;
  }

  @override
  Stream<List<ProductDisplayModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<ProductDisplayModel?>> values = getQuery(
            productDisplayCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  Stream<List<ProductDisplayModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<ProductDisplayModel?>> values = getQuery(
            productDisplayCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  Future<List<ProductDisplayModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<ProductDisplayModel?> values = await getQuery(productDisplayCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  Future<List<ProductDisplayModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<ProductDisplayModel?> values = await getQuery(productDisplayCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  void flush() {}

  @override
  Future<void> deleteAll() {
    return productDisplayCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  @override
  dynamic getSubCollection(String documentId, String name) {
    return productDisplayCollection.doc(documentId).collection(name);
  }

  @override
  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  @override
  Future<ProductDisplayModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return productDisplayCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  final String appId;
  ProductDisplayFirestore(this.getCollection, this.appId)
      : productDisplayCollection = getCollection();

  final CollectionReference productDisplayCollection;
  final GetCollection getCollection;
}
