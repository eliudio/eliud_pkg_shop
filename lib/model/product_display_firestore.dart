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

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_pkg_shop/model/product_display_repository.dart';

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


class ProductDisplayFirestore implements ProductDisplayRepository {
  Future<ProductDisplayModel> add(ProductDisplayModel value) {
    return ProductDisplayCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(ProductDisplayModel value) {
    return ProductDisplayCollection.document(value.documentID).delete();
  }

  Future<ProductDisplayModel> update(ProductDisplayModel value) {
    return ProductDisplayCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  ProductDisplayModel _populateDoc(DocumentSnapshot value) {
    return ProductDisplayModel.fromEntity(value.documentID, ProductDisplayEntity.fromMap(value.data));
  }

  Future<ProductDisplayModel> _populateDocPlus(DocumentSnapshot value) async {
    return ProductDisplayModel.fromEntityPlus(value.documentID, ProductDisplayEntity.fromMap(value.data), appId: appId);  }

  Future<ProductDisplayModel> get(String id) {
    return ProductDisplayCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<ProductDisplayModel>> listen(ProductDisplayModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<ProductDisplayModel>> stream;
    if (orderBy == null) {
       stream = ProductDisplayCollection.snapshots().map((data) {
        Iterable<ProductDisplayModel> productDisplays  = data.documents.map((doc) {
          ProductDisplayModel value = _populateDoc(doc);
          return value;
        }).toList();
        return productDisplays;
      });
    } else {
      stream = ProductDisplayCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<ProductDisplayModel> productDisplays  = data.documents.map((doc) {
          ProductDisplayModel value = _populateDoc(doc);
          return value;
        }).toList();
        return productDisplays;
      });
  
    }
    return stream.listen((listOfProductDisplayModels) {
      trigger(listOfProductDisplayModels);
    });
  }

  StreamSubscription<List<ProductDisplayModel>> listenWithDetails(ProductDisplayModelTrigger trigger) {
    Stream<List<ProductDisplayModel>> stream = ProductDisplayCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfProductDisplayModels) {
      trigger(listOfProductDisplayModels);
    });
  }


  Stream<List<ProductDisplayModel>> values() {
    return ProductDisplayCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<ProductDisplayModel>> valuesWithDetails() {
    return ProductDisplayCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<ProductDisplayModel>> valuesList() async {
    return await ProductDisplayCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<ProductDisplayModel>> valuesListWithDetails() async {
    return await ProductDisplayCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return ProductDisplayCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference ProductDisplayCollection;

  ProductDisplayFirestore(this.appId) : ProductDisplayCollection = Firestore.instance.collection('ProductDisplay-${appId}');
}
