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

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';


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


class OrderOverviewJsFirestore implements OrderOverviewRepository {
  Future<OrderOverviewModel> add(OrderOverviewModel value) {
    return orderOverviewCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(OrderOverviewModel value) {
    return orderOverviewCollection.doc(value.documentID).delete();
  }

  Future<OrderOverviewModel> update(OrderOverviewModel value) {
    return orderOverviewCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  OrderOverviewModel _populateDoc(DocumentSnapshot value) {
    return OrderOverviewModel.fromEntity(value.id, OrderOverviewEntity.fromMap(value.data()));
  }

  Future<OrderOverviewModel> _populateDocPlus(DocumentSnapshot value) async {
    return OrderOverviewModel.fromEntityPlus(value.id, OrderOverviewEntity.fromMap(value.data()), appId: appId);
  }

  Future<OrderOverviewModel> get(String id) {
    return orderOverviewCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<OrderOverviewModel>> listen(OrderOverviewModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<OrderOverviewModel> orderOverviews  = data.docs.map((doc) {
          OrderOverviewModel value = _populateDoc(doc);
          return value;
        }).toList();
        return orderOverviews;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<OrderOverviewModel> orderOverviews  = data.docs.map((doc) {
          OrderOverviewModel value = _populateDoc(doc);
          return value;
        }).toList();
        return orderOverviews;
      });
    }
    return stream.listen((listOfOrderOverviewModels) {
      trigger(listOfOrderOverviewModels);
    });
  }

  StreamSubscription<List<OrderOverviewModel>> listenWithDetails(OrderOverviewModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      // If we use orderOverviewCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use orderOverviewCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfOrderOverviewModels) {
      trigger(listOfOrderOverviewModels);
    });
  }

  Stream<List<OrderOverviewModel>> values({String orderBy, bool descending }) {
    if (orderBy == null) {
      return orderOverviewCollection.onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    } else {
      return orderOverviewCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    }
  }

  Stream<List<OrderOverviewModel>> valuesWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return orderOverviewCollection.onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    } else {
      return orderOverviewCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    }
  }

  @override
  Future<List<OrderOverviewModel>> valuesList({String orderBy, bool descending }) {
    if (orderBy == null) {
      return orderOverviewCollection.get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return orderOverviewCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<OrderOverviewModel>> valuesListWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return orderOverviewCollection.get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return orderOverviewCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return orderOverviewCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => orderOverviewCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('OrderOverview-$appId');

  final String appId;
  
  OrderOverviewJsFirestore(this.appId) : orderOverviewCollection = firestore().collection('OrderOverview-$appId');

  final CollectionReference orderOverviewCollection;
}
