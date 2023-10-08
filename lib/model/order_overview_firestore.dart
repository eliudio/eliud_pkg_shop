/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/order_overview_repository.dart';


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

class OrderOverviewFirestore implements OrderOverviewRepository {
  @override
  OrderOverviewEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return OrderOverviewEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  Future<OrderOverviewEntity> addEntity(String documentID, OrderOverviewEntity value) {
    return OrderOverviewCollection.doc(documentID).set(value.toDocument()).then((_) => value);
  }

  Future<OrderOverviewEntity> updateEntity(String documentID, OrderOverviewEntity value) {
    return OrderOverviewCollection.doc(documentID).update(value.toDocument()).then((_) => value);
  }

  Future<OrderOverviewModel> add(OrderOverviewModel value) {
    return OrderOverviewCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(OrderOverviewModel value) {
    return OrderOverviewCollection.doc(value.documentID).delete();
  }

  Future<OrderOverviewModel> update(OrderOverviewModel value) {
    return OrderOverviewCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<OrderOverviewModel?> _populateDoc(DocumentSnapshot value) async {
    return OrderOverviewModel.fromEntity(value.id, OrderOverviewEntity.fromMap(value.data()));
  }

  Future<OrderOverviewModel?> _populateDocPlus(DocumentSnapshot value) async {
    return OrderOverviewModel.fromEntityPlus(value.id, OrderOverviewEntity.fromMap(value.data()), appId: appId);  }

  Future<OrderOverviewEntity?> getEntity(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = OrderOverviewCollection.doc(id);
      var doc = await collection.get();
      return OrderOverviewEntity.fromMap(doc.data());
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving OrderOverview with id $id");
        print("Exceptoin: $e");
      }
    };
  }

  Future<OrderOverviewModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = OrderOverviewCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving OrderOverview with id $id");
        print("Exceptoin: $e");
      }
    };
  }

  StreamSubscription<List<OrderOverviewModel?>> listen(OrderOverviewModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<OrderOverviewModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(OrderOverviewCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDoc(doc)).toList());
    });

    return stream.listen((listOfOrderOverviewModels) {
      trigger(listOfOrderOverviewModels);
    });
  }

  StreamSubscription<List<OrderOverviewModel?>> listenWithDetails(OrderOverviewModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<OrderOverviewModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(OrderOverviewCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfOrderOverviewModels) {
      trigger(listOfOrderOverviewModels);
    });
  }

  @override
  StreamSubscription<OrderOverviewModel?> listenTo(String documentId, OrderOverviewChanged changed, {OrderOverviewErrorHandler? errorHandler}) {
    var stream = OrderOverviewCollection.doc(documentId)
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

  Stream<List<OrderOverviewModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<OrderOverviewModel?>> _values = getQuery(OrderOverviewCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<OrderOverviewModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<OrderOverviewModel?>> _values = getQuery(OrderOverviewCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<OrderOverviewModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<OrderOverviewModel?> _values = await getQuery(OrderOverviewCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<OrderOverviewModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<OrderOverviewModel?> _values = await getQuery(OrderOverviewCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
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
    return OrderOverviewCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return OrderOverviewCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<OrderOverviewModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return OrderOverviewCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  OrderOverviewFirestore(this.getCollection, this.appId): OrderOverviewCollection = getCollection();

  final CollectionReference OrderOverviewCollection;
  final GetCollection getCollection;
}

