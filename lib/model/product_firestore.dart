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
import 'package:cloud_firestore/cloud_firestore.dart';


import 'product_repository.dart';
import 'product_model.dart';
import 'product_entity.dart';

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

  ProductModel _populateDoc(DocumentSnapshot doc) {
    return ProductModel.fromEntity(doc.documentID, ProductEntity.fromMap(doc.data));
  }

  Future<ProductModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ProductModel.fromEntityPlus(doc.documentID, ProductEntity.fromMap(doc.data));  }

  Future<ProductModel> get(String id) {
    return ProductCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<ProductModel>> listen(ProductModelTrigger trigger) {
    Stream<List<ProductModel>> stream = ProductCollection.snapshots()
        .map((data) {
      Iterable<ProductModel> products  = data.documents.map((doc) {
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
    Stream<List<ProductModel>> stream = ProductCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfProductModels) {
      trigger(listOfProductModels);
    });
  }


  Stream<List<ProductModel>> values() {
    return ProductCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<ProductModel>> valuesWithDetails() {
    return ProductCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<ProductModel>> valuesList() async {
    return await ProductCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<ProductModel>> valuesListWithDetails() async {
    return await ProductCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return ProductCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference ProductCollection;

  ProductFirestore(this.appID) : ProductCollection = Firestore.instance.collection('Product-${appID}');
}

