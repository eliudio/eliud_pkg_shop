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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
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


class ProductDisplayJsFirestore implements ProductDisplayRepository {
  Future<ProductDisplayModel> add(ProductDisplayModel value) {
    return productDisplayCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(ProductDisplayModel value) {
    return productDisplayCollection.doc(value.documentID).delete();
  }

  Future<ProductDisplayModel> update(ProductDisplayModel value) {
    return productDisplayCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  ProductDisplayModel _populateDoc(DocumentSnapshot value) {
    return ProductDisplayModel.fromEntity(value.id, ProductDisplayEntity.fromMap(value.data()));
  }

  Future<ProductDisplayModel> _populateDocPlus(DocumentSnapshot value) async {
    return ProductDisplayModel.fromEntityPlus(value.id, ProductDisplayEntity.fromMap(value.data()), appId: appId);
  }

  Future<ProductDisplayModel> get(String id) {
    return productDisplayCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<ProductDisplayModel>> listen(ProductDisplayModelTrigger trigger, {String orderBy, bool descending }) {
    var stream = (orderBy == null ?  getCollection() : getCollection().orderBy(orderBy, descending ? 'desc': 'asc')).onSnapshot
        .map((data) {
      Iterable<ProductDisplayModel> productDisplays  = data.docs.map((doc) {
        ProductDisplayModel value = _populateDoc(doc);
        return value;
      }).toList();
      return productDisplays;
    });

    return stream.listen((listOfProductDisplayModels) {
      trigger(listOfProductDisplayModels);
    });
  }

  StreamSubscription<List<ProductDisplayModel>> listenWithDetails(ProductDisplayModelTrigger trigger) {
    // If we use productDisplayCollection here, then the second subscription fails
    Stream<List<ProductDisplayModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfProductDisplayModels) {
      trigger(listOfProductDisplayModels);
    });
  }

  Stream<List<ProductDisplayModel>> values() {
    return productDisplayCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<ProductDisplayModel>> valuesWithDetails() {
    return productDisplayCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<ProductDisplayModel>> valuesList() {
    return productDisplayCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<ProductDisplayModel>> valuesListWithDetails() {
    return productDisplayCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return productDisplayCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => productDisplayCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('ProductDisplay-$appId');

  final String appId;
  
  ProductDisplayJsFirestore(this.appId) : productDisplayCollection = firestore().collection('ProductDisplay-$appId');

  final CollectionReference productDisplayCollection;
}