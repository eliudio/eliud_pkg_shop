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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';

import '../model/cart_item_list_bloc.dart';
import '../model/cart_item_list.dart';
import '../model/cart_item_list_event.dart';
import '../model/cart_item_model.dart';
import '../model/cart_item_repository.dart';

import '../model/order_item_list_bloc.dart';
import '../model/order_item_list.dart';
import '../model/order_item_list_event.dart';
import '../model/order_item_model.dart';
import '../model/order_item_repository.dart';

import '../model/product_image_list_bloc.dart';
import '../model/product_image_list.dart';
import '../model/product_image_list_event.dart';
import '../model/product_image_model.dart';
import '../model/product_image_repository.dart';

typedef CartItemListChanged(List<CartItemModel> values);
typedef OrderItemListChanged(List<OrderItemModel> values);
typedef ProductImageListChanged(List<ProductImageModel> values);

cartItemsList(context, value, trigger) => EmbeddedComponentFactory.cartItemsList(context, value, trigger);
orderItemsList(context, value, trigger) => EmbeddedComponentFactory.orderItemsList(context, value, trigger);
productImagesList(context, value, trigger) => EmbeddedComponentFactory.productImagesList(context, value, trigger);

class EmbeddedComponentFactory {

static Widget cartItemsList(BuildContext context, List<CartItemModel> values, CartItemListChanged trigger) {
  CartItemInMemoryRepository inMemoryRepository = CartItemInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<CartItemListBloc>(
        create: (context) => CartItemListBloc(
          AccessBloc.getBloc(context), 
          cartItemRepository: inMemoryRepository,
          )..add(LoadCartItemList()),
        )
        ],
    child: CartItemListWidget(isEmbedded: true),
  );
}

static Widget orderItemsList(BuildContext context, List<OrderItemModel> values, OrderItemListChanged trigger) {
  OrderItemInMemoryRepository inMemoryRepository = OrderItemInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<OrderItemListBloc>(
        create: (context) => OrderItemListBloc(
          AccessBloc.getBloc(context), 
          orderItemRepository: inMemoryRepository,
          )..add(LoadOrderItemList()),
        )
        ],
    child: OrderItemListWidget(isEmbedded: true),
  );
}

static Widget productImagesList(BuildContext context, List<ProductImageModel> values, ProductImageListChanged trigger) {
  ProductImageInMemoryRepository inMemoryRepository = ProductImageInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<ProductImageListBloc>(
        create: (context) => ProductImageListBloc(
          AccessBloc.getBloc(context), 
          productImageRepository: inMemoryRepository,
          )..add(LoadProductImageList()),
        )
        ],
    child: ProductImageListWidget(isEmbedded: true),
  );
}


}

class CartItemInMemoryRepository implements CartItemRepository {
    final List<CartItemModel> items;
    final CartItemListChanged trigger;
    Stream<List<CartItemModel>> theValues;

    CartItemInMemoryRepository({this.trigger, this.items}) {
        List<List<CartItemModel>> myList = new List<List<CartItemModel>>();
        myList.add(items);
        theValues = Stream<List<CartItemModel>>.fromIterable(myList);
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

    Future<CartItemModel> add(CartItemModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(CartItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<CartItemModel> update(CartItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<CartItemModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<CartItemModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<CartItemModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
      return theValues;
    }
    
    Stream<List<CartItemModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<CartItemModel>> listen(trigger, { String currentMember, String orderBy, bool descending, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<CartItemModel>> listenWithDetails(trigger, { String currentMember, String orderBy, bool descending, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<CartItemModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
      return Future.value(items);
    }
    
    Future<List<CartItemModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
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

    Future<void> deleteAll() {}
}

class OrderItemInMemoryRepository implements OrderItemRepository {
    final List<OrderItemModel> items;
    final OrderItemListChanged trigger;
    Stream<List<OrderItemModel>> theValues;

    OrderItemInMemoryRepository({this.trigger, this.items}) {
        List<List<OrderItemModel>> myList = new List<List<OrderItemModel>>();
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

    Future<OrderItemModel> add(OrderItemModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(OrderItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<OrderItemModel> update(OrderItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<OrderItemModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<OrderItemModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<OrderItemModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
      return theValues;
    }
    
    Stream<List<OrderItemModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<OrderItemModel>> listen(trigger, { String currentMember, String orderBy, bool descending, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<OrderItemModel>> listenWithDetails(trigger, { String currentMember, String orderBy, bool descending, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<OrderItemModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
      return Future.value(items);
    }
    
    Future<List<OrderItemModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
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

    Future<void> deleteAll() {}
}

class ProductImageInMemoryRepository implements ProductImageRepository {
    final List<ProductImageModel> items;
    final ProductImageListChanged trigger;
    Stream<List<ProductImageModel>> theValues;

    ProductImageInMemoryRepository({this.trigger, this.items}) {
        List<List<ProductImageModel>> myList = new List<List<ProductImageModel>>();
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

    Future<ProductImageModel> add(ProductImageModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(ProductImageModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<ProductImageModel> update(ProductImageModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<ProductImageModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<ProductImageModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<ProductImageModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
      return theValues;
    }
    
    Stream<List<ProductImageModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<ProductImageModel>> listen(trigger, { String currentMember, String orderBy, bool descending, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<ProductImageModel>> listenWithDetails(trigger, { String currentMember, String orderBy, bool descending, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<ProductImageModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
      return Future.value(items);
    }
    
    Future<List<ProductImageModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
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

    Future<void> deleteAll() {}
}

