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

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
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
  StreamSubscription<List<ProductModel>> listen(ProductModelTrigger trigger, {String orderBy, bool descending }) {
    var stream = (orderBy == null ?  getCollection() : getCollection().orderBy(orderBy, descending ? 'desc': 'asc')).onSnapshot
        .map((data) {
      Iterable<ProductModel> products  = data.docs.map((doc) {
        ProductModel value = _populateDoc(doc);
        return value;
      }).toList();
      return products;
    });

    return stream.listen((listOfProductModels) {
      trigger(listOfProductModels);
    });
  }

  StreamSubscription<List<ProductModel>> listenWithDetails(ProductModelTrigger trigger) {
    // If we use productCollection here, then the second subscription fails
    Stream<List<ProductModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfProductModels) {
      trigger(listOfProductModels);
    });
  }

  Stream<List<ProductModel>> values() {
    return productCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<ProductModel>> valuesWithDetails() {
    return productCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<ProductModel>> valuesList() {
    return productCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<ProductModel>> valuesListWithDetails() {
    return productCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
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
