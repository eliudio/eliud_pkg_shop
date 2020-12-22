/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/product_repository.dart';


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


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class ProductFirestore implements ProductRepository {
  Future<ProductModel> add(ProductModel value) {
    return ProductCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(ProductModel value) {
    return ProductCollection.document(value.documentID).delete();
  }

  Future<ProductModel> update(ProductModel value) {
    return ProductCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  ProductModel _populateDoc(DocumentSnapshot value) {
    return ProductModel.fromEntity(value.documentID, ProductEntity.fromMap(value.data));
  }

  Future<ProductModel> _populateDocPlus(DocumentSnapshot value) async {
    return ProductModel.fromEntityPlus(value.documentID, ProductEntity.fromMap(value.data), );  }

  Future<ProductModel> get(String id) {
    return ProductCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<ProductModel>> listen(ProductModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<ProductModel>> stream;
    if (orderBy == null) {
       stream = ProductCollection.snapshots().map((data) {
        Iterable<ProductModel> products  = data.documents.map((doc) {
          ProductModel value = _populateDoc(doc);
          return value;
        }).toList();
        return products;
      });
    } else {
      stream = ProductCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<ProductModel> products  = data.documents.map((doc) {
          ProductModel value = _populateDoc(doc);
          return value;
        }).toList();
        return products;
      });
  
    }
    return stream.listen((listOfProductModels) {
      trigger(listOfProductModels);
    });
  }

  StreamSubscription<List<ProductModel>> listenWithDetails(ProductModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<ProductModel>> stream;
    if (orderBy == null) {
      stream = ProductCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = ProductCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfProductModels) {
      trigger(listOfProductModels);
    });
  }


  Stream<List<ProductModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<ProductModel>> _values = getQuery(ProductCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, ).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<ProductModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<ProductModel>> _values = getQuery(ProductCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, ).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<ProductModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<ProductModel> _values = await getQuery(ProductCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, ).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<ProductModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<ProductModel> _values = await getQuery(ProductCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, ).getDocuments().then((value) {
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
    return ProductCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return ProductCollection.document(documentId).collection(name);
  }


  ProductFirestore(this.ProductCollection);

  final CollectionReference ProductCollection;
}

