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


class ProductFirestore implements ProductRepository {
  Future<ProductModel> add(ProductModel value) {
    return ProductCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(ProductModel value) {
    return ProductCollection.document(value.documentID).delete();
  }

  Future<ProductModel> update(ProductModel value) {
    return ProductCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  ProductModel _populateDoc(DocumentSnapshot value) {
    return ProductModel.fromEntity(value.documentID, ProductEntity.fromMap(value.data));
  }

  Future<ProductModel> _populateDocPlus(DocumentSnapshot value) async {
    return ProductModel.fromEntityPlus(value.documentID, ProductEntity.fromMap(value.data), appId: appId);  }

  Future<ProductModel> get(String id) {
    return ProductCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<ProductModel>> listen(ProductModelTrigger trigger, { String orderBy, bool descending }) {
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

  StreamSubscription<List<ProductModel>> listenWithDetails(ProductModelTrigger trigger, { String orderBy, bool descending }) {
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


  Stream<List<ProductModel>> values({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return ProductCollection.snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return ProductCollection.orderBy(orderBy, descending: descending).snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Stream<List<ProductModel>> valuesWithDetails({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return ProductCollection.snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return ProductCollection.orderBy(orderBy, descending: descending).snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  Future<List<ProductModel>> valuesList({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await ProductCollection.getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return await ProductCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Future<List<ProductModel>> valuesListWithDetails({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await ProductCollection.getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return await ProductCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {}

  Future<void> deleteAll() {
    return ProductCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference ProductCollection;

  ProductFirestore(this.appId) : ProductCollection = Firestore.instance.collection('Product-${appId}');
}

