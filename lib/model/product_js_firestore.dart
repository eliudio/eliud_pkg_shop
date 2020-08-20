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


import 'product_repository.dart';
import 'product_model.dart';
import 'product_entity.dart';

class ProductJsFirestore implements ProductRepository {
  Future<ProductModel> add(ProductModel value) {
    return productCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(ProductModel value) {
    return productCollection.doc(value.documentID).delete();
  }

  Future<ProductModel> update(ProductModel value) {
    return productCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  ProductModel _populateDoc(DocumentSnapshot doc) {
    return ProductModel.fromEntity(doc.id, ProductEntity.fromMap(doc.data()));
  }

  Future<ProductModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ProductModel.fromEntityPlus(doc.id, ProductEntity.fromMap(doc.data()));
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

  StreamSubscription<List<ProductModel>> listen(ProductModelTrigger trigger) {
    // If we use productCollection here, then the second subscription fails
    Stream<List<ProductModel>> stream = getCollection().onSnapshot
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
  CollectionReference getCollection() => firestore().collection('Product-$appID');

  final String appID;
  
  ProductJsFirestore(this.appID) : productCollection = firestore().collection('Product-$appID');

  final CollectionReference productCollection;
}
