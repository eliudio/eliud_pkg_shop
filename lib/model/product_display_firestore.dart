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


import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class ProductDisplayFirestore implements ProductDisplayRepository {
  @override
  ProductDisplayEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return ProductDisplayEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  Future<ProductDisplayEntity> addEntity(String documentID, ProductDisplayEntity value) {
    return ProductDisplayCollection.doc(documentID).set(value.toDocument()).then((_) => value);
  }

  Future<ProductDisplayEntity> updateEntity(String documentID, ProductDisplayEntity value) {
    return ProductDisplayCollection.doc(documentID).update(value.toDocument()).then((_) => value);
  }

  Future<ProductDisplayModel> add(ProductDisplayModel value) {
    return ProductDisplayCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(ProductDisplayModel value) {
    return ProductDisplayCollection.doc(value.documentID).delete();
  }

  Future<ProductDisplayModel> update(ProductDisplayModel value) {
    return ProductDisplayCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<ProductDisplayModel?> _populateDoc(DocumentSnapshot value) async {
    return ProductDisplayModel.fromEntity(value.id, ProductDisplayEntity.fromMap(value.data()));
  }

  Future<ProductDisplayModel?> _populateDocPlus(DocumentSnapshot value) async {
    return ProductDisplayModel.fromEntityPlus(value.id, ProductDisplayEntity.fromMap(value.data()), appId: appId);  }

  Future<ProductDisplayEntity?> getEntity(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = ProductDisplayCollection.doc(id);
      var doc = await collection.get();
      return ProductDisplayEntity.fromMap(doc.data());
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving ProductDisplay with id $id");
        print("Exceptoin: $e");
      }
    };
  }

  Future<ProductDisplayModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = ProductDisplayCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving ProductDisplay with id $id");
        print("Exceptoin: $e");
      }
    };
  }

  StreamSubscription<List<ProductDisplayModel?>> listen(ProductDisplayModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<ProductDisplayModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(ProductDisplayCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDoc(doc)).toList());
    });

    return stream.listen((listOfProductDisplayModels) {
      trigger(listOfProductDisplayModels);
    });
  }

  StreamSubscription<List<ProductDisplayModel?>> listenWithDetails(ProductDisplayModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<ProductDisplayModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(ProductDisplayCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfProductDisplayModels) {
      trigger(listOfProductDisplayModels);
    });
  }

  @override
  StreamSubscription<ProductDisplayModel?> listenTo(String documentId, ProductDisplayChanged changed, {ProductDisplayErrorHandler? errorHandler}) {
    var stream = ProductDisplayCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
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

  Stream<List<ProductDisplayModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<ProductDisplayModel?>> _values = getQuery(ProductDisplayCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<ProductDisplayModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<ProductDisplayModel?>> _values = getQuery(ProductDisplayCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<ProductDisplayModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<ProductDisplayModel?> _values = await getQuery(ProductDisplayCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<ProductDisplayModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<ProductDisplayModel?> _values = await getQuery(ProductDisplayCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
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
    return ProductDisplayCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return ProductDisplayCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<ProductDisplayModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return ProductDisplayCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  ProductDisplayFirestore(this.getCollection, this.appId): ProductDisplayCollection = getCollection();

  final CollectionReference ProductDisplayCollection;
  final GetCollection getCollection;
}

