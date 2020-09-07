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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

cartItemsList(value, trigger) => EmbeddedComponentFactory.cartItemsList(value, trigger);
orderItemsList(value, trigger) => EmbeddedComponentFactory.orderItemsList(value, trigger);
productImagesList(value, trigger) => EmbeddedComponentFactory.productImagesList(value, trigger);

class EmbeddedComponentFactory {

static Widget cartItemsList(List<CartItemModel> values, CartItemListChanged trigger) {
  CartItemInMemoryRepository inMemoryRepository = CartItemInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<CartItemListBloc>(
        create: (context) => CartItemListBloc(
          cartItemRepository: inMemoryRepository,
          )..add(LoadCartItemList()),
        )
        ],
    child: CartItemListWidget(isEmbedded: true),
  );
}

static Widget orderItemsList(List<OrderItemModel> values, OrderItemListChanged trigger) {
  OrderItemInMemoryRepository inMemoryRepository = OrderItemInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<OrderItemListBloc>(
        create: (context) => OrderItemListBloc(
          orderItemRepository: inMemoryRepository,
          )..add(LoadOrderItemList()),
        )
        ],
    child: OrderItemListWidget(isEmbedded: true),
  );
}

static Widget productImagesList(List<ProductImageModel> values, ProductImageListChanged trigger) {
  ProductImageInMemoryRepository inMemoryRepository = ProductImageInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<ProductImageListBloc>(
        create: (context) => ProductImageListBloc(
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

    Stream<List<CartItemModel>> values() {
      return theValues;
    }
    
    Stream<List<CartItemModel>> valuesWithDetails() {
      return theValues;
    }
    
    @override
    StreamSubscription<List<CartItemModel>> listen(trigger) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<CartItemModel>> listenWithDetails(trigger) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<CartItemModel>> valuesList() {
      return Future.value(items);
    }
    
    Future<List<CartItemModel>> valuesListWithDetails() {
      return Future.value(items);
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

    Stream<List<OrderItemModel>> values() {
      return theValues;
    }
    
    Stream<List<OrderItemModel>> valuesWithDetails() {
      return theValues;
    }
    
    @override
    StreamSubscription<List<OrderItemModel>> listen(trigger) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<OrderItemModel>> listenWithDetails(trigger) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<OrderItemModel>> valuesList() {
      return Future.value(items);
    }
    
    Future<List<OrderItemModel>> valuesListWithDetails() {
      return Future.value(items);
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

    Stream<List<ProductImageModel>> values() {
      return theValues;
    }
    
    Stream<List<ProductImageModel>> valuesWithDetails() {
      return theValues;
    }
    
    @override
    StreamSubscription<List<ProductImageModel>> listen(trigger) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<ProductImageModel>> listenWithDetails(trigger) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<ProductImageModel>> valuesList() {
      return Future.value(items);
    }
    
    Future<List<ProductImageModel>> valuesListWithDetails() {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

