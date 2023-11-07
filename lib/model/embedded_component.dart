/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/embedded_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/model/app_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/order_item_list_bloc.dart';
import '../model/order_item_list.dart';
import '../model/order_item_list_event.dart';
import '../model/order_item_model.dart';
import '../model/order_item_entity.dart';
import '../model/order_item_repository.dart';

import '../model/product_image_list_bloc.dart';
import '../model/product_image_list.dart';
import '../model/product_image_list_event.dart';
import '../model/product_image_model.dart';
import '../model/product_image_entity.dart';
import '../model/product_image_repository.dart';

typedef OrderItemListChanged = Function(List<OrderItemModel> values);
typedef ProductImageListChanged = Function(List<ProductImageModel> values);

orderItemsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.orderItemsList(app, context, value, trigger);
productImagesList(app, context, value, trigger) =>
    EmbeddedComponentFactory.productImagesList(app, context, value, trigger);

class EmbeddedComponentFactory {
  static Widget orderItemsList(AppModel app, BuildContext context,
      List<OrderItemModel> values, OrderItemListChanged trigger) {
    OrderItemInMemoryRepository inMemoryRepository =
        OrderItemInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderItemListBloc>(
          create: (context) => OrderItemListBloc(
            orderItemRepository: inMemoryRepository,
          )..add(LoadOrderItemList()),
        )
      ],
      child: OrderItemListWidget(app: app, isEmbedded: true),
    );
  }

  static Widget productImagesList(AppModel app, BuildContext context,
      List<ProductImageModel> values, ProductImageListChanged trigger) {
    ProductImageInMemoryRepository inMemoryRepository =
        ProductImageInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductImageListBloc>(
          create: (context) => ProductImageListBloc(
            productImageRepository: inMemoryRepository,
          )..add(LoadProductImageList()),
        )
      ],
      child: ProductImageListWidget(app: app, isEmbedded: true),
    );
  }
}

class OrderItemInMemoryRepository implements OrderItemRepository {
  final List<OrderItemModel> items;
  final OrderItemListChanged trigger;
  Stream<List<OrderItemModel>>? theValues;

  OrderItemInMemoryRepository(this.trigger, this.items) {
    List<List<OrderItemModel>> myList = <List<OrderItemModel>>[];
    myList.add(items);
    theValues = Stream<List<OrderItemModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  @override
  Future<OrderItemEntity> addEntity(String documentID, OrderItemEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<OrderItemEntity> updateEntity(
      String documentID, OrderItemEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<OrderItemModel> add(OrderItemModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(OrderItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<OrderItemModel> update(OrderItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<OrderItemModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<OrderItemModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<OrderItemModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<OrderItemModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<OrderItemModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<OrderItemModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<OrderItemModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<OrderItemModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  @override
  StreamSubscription<OrderItemModel> listenTo(
      String documentId, OrderItemChanged changed,
      {OrderItemErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<OrderItemModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<OrderItemEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  OrderItemEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

class ProductImageInMemoryRepository implements ProductImageRepository {
  final List<ProductImageModel> items;
  final ProductImageListChanged trigger;
  Stream<List<ProductImageModel>>? theValues;

  ProductImageInMemoryRepository(this.trigger, this.items) {
    List<List<ProductImageModel>> myList = <List<ProductImageModel>>[];
    myList.add(items);
    theValues = Stream<List<ProductImageModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  @override
  Future<ProductImageEntity> addEntity(
      String documentID, ProductImageEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<ProductImageEntity> updateEntity(
      String documentID, ProductImageEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<ProductImageModel> add(ProductImageModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(ProductImageModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<ProductImageModel> update(ProductImageModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<ProductImageModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<ProductImageModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<ProductImageModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<ProductImageModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<ProductImageModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<ProductImageModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<ProductImageModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<ProductImageModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  @override
  StreamSubscription<ProductImageModel> listenTo(
      String documentId, ProductImageChanged changed,
      {ProductImageErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<ProductImageModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<ProductImageEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  ProductImageEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}
