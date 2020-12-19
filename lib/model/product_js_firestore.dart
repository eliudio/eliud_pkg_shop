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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/tools/js_firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class ProductJsFirestore implements ProductRepository {
  Future<ProductModel> add(ProductModel value) {
    return productCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(ProductModel value) {
    return productCollection.doc(value.documentID).delete();
  }

  Future<ProductModel> update(ProductModel value) {
    return productCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  ProductModel _populateDoc(DocumentSnapshot value) {
    return ProductModel.fromEntity(value.id, ProductEntity.fromMap(value.data()));
  }

  Future<ProductModel> _populateDocPlus(DocumentSnapshot value) async {
    return ProductModel.fromEntityPlus(value.id, ProductEntity.fromMap(value.data()), appId: appId);
  }

  Future<ProductModel> get(String id) {
    return productCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<ProductModel>> listen(ProductModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<ProductModel> products  = data.docs.map((doc) {
          ProductModel value = _populateDoc(doc);
          return value;
        }).toList();
        return products;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<ProductModel> products  = data.docs.map((doc) {
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

  StreamSubscription<List<ProductModel>> listenWithDetails(ProductModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      // If we use productCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use productCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfProductModels) {
      trigger(listOfProductModels);
    });
  }

  Stream<List<ProductModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<ProductModel>> _values = getQuery(productCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel)
      .onSnapshot
      .map((data) { 
        return data.docs.map((doc) {
          lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<ProductModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<ProductModel>> _values = getQuery(productCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel)
      .onSnapshot
      .asyncMap((data) {
        return Future.wait(data.docs.map((doc) { 
          lastDoc = doc;
          return _populateDocPlus(doc);
        }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<ProductModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<ProductModel> _values = await getQuery(productCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<ProductModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<ProductModel> _values = await getQuery(productCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {  
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return productCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => productCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Product-$appId');

  final String appId;
  
  ProductJsFirestore(this.appId) : productCollection = firestore().collection('Product-$appId');

  final CollectionReference productCollection;
}
