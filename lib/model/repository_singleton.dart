/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/cart_firestore.dart';
import '../model/cart_repository.dart';
import '../model/cart_cache.dart';
import '../model/member_cart_firestore.dart';
import '../model/member_cart_repository.dart';
import '../model/member_cart_cache.dart';
import '../model/order_firestore.dart';
import '../model/order_repository.dart';
import '../model/order_cache.dart';
import '../model/order_overview_firestore.dart';
import '../model/order_overview_repository.dart';
import '../model/order_overview_cache.dart';
import '../model/pay_firestore.dart';
import '../model/pay_repository.dart';
import '../model/pay_cache.dart';
import '../model/pay_confirmation_firestore.dart';
import '../model/pay_confirmation_repository.dart';
import '../model/pay_confirmation_cache.dart';
import '../model/product_firestore.dart';
import '../model/product_repository.dart';
import '../model/product_cache.dart';
import '../model/product_display_firestore.dart';
import '../model/product_display_repository.dart';
import '../model/product_display_cache.dart';
import '../model/shop_firestore.dart';
import '../model/shop_repository.dart';
import '../model/shop_cache.dart';
import '../model/shop_front_firestore.dart';
import '../model/shop_front_repository.dart';
import '../model/shop_front_cache.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
  final _cartRepository = HashMap<String, CartRepository>();
  final _memberCartRepository = HashMap<String, MemberCartRepository>();
  final _orderRepository = HashMap<String, OrderRepository>();
  final _orderOverviewRepository = HashMap<String, OrderOverviewRepository>();
  final _payRepository = HashMap<String, PayRepository>();
  final _payConfirmationRepository =
      HashMap<String, PayConfirmationRepository>();
  final _productRepository = HashMap<String, ProductRepository>();
  final _productDisplayRepository = HashMap<String, ProductDisplayRepository>();
  final _shopRepository = HashMap<String, ShopRepository>();
  final _shopFrontRepository = HashMap<String, ShopFrontRepository>();

  @override
  CartRepository? cartRepository(String? appId) {
    if ((appId != null) && (_cartRepository[appId] == null)) {
      _cartRepository[appId] = CartCache(CartFirestore(
          () => appRepository()!.getSubCollection(appId, 'cart'), appId));
    }
    return _cartRepository[appId];
  }

  @override
  MemberCartRepository? memberCartRepository(String? appId) {
    if ((appId != null) && (_memberCartRepository[appId] == null)) {
      _memberCartRepository[appId] = MemberCartCache(MemberCartFirestore(
          () => appRepository()!.getSubCollection(appId, 'membercart'), appId));
    }
    return _memberCartRepository[appId];
  }

  @override
  OrderRepository? orderRepository(String? appId) {
    if ((appId != null) && (_orderRepository[appId] == null)) {
      _orderRepository[appId] = OrderCache(OrderFirestore(
          () => appRepository()!.getSubCollection(appId, 'order'), appId));
    }
    return _orderRepository[appId];
  }

  @override
  OrderOverviewRepository? orderOverviewRepository(String? appId) {
    if ((appId != null) && (_orderOverviewRepository[appId] == null)) {
      _orderOverviewRepository[appId] = OrderOverviewCache(
          OrderOverviewFirestore(
              () => appRepository()!.getSubCollection(appId, 'orderoverview'),
              appId));
    }
    return _orderOverviewRepository[appId];
  }

  @override
  PayRepository? payRepository(String? appId) {
    if ((appId != null) && (_payRepository[appId] == null)) {
      _payRepository[appId] = PayCache(PayFirestore(
          () => appRepository()!.getSubCollection(appId, 'pay'), appId));
    }
    return _payRepository[appId];
  }

  @override
  PayConfirmationRepository? payConfirmationRepository(String? appId) {
    if ((appId != null) && (_payConfirmationRepository[appId] == null)) {
      _payConfirmationRepository[appId] = PayConfirmationCache(
          PayConfirmationFirestore(
              () => appRepository()!.getSubCollection(appId, 'payconfirmation'),
              appId));
    }
    return _payConfirmationRepository[appId];
  }

  @override
  ProductRepository? productRepository(String? appId) {
    if ((appId != null) && (_productRepository[appId] == null)) {
      _productRepository[appId] = ProductCache(ProductFirestore(
          () => appRepository()!.getSubCollection(appId, 'product'), appId));
    }
    return _productRepository[appId];
  }

  @override
  ProductDisplayRepository? productDisplayRepository(String? appId) {
    if ((appId != null) && (_productDisplayRepository[appId] == null)) {
      _productDisplayRepository[appId] = ProductDisplayCache(
          ProductDisplayFirestore(
              () => appRepository()!.getSubCollection(appId, 'productdisplay'),
              appId));
    }
    return _productDisplayRepository[appId];
  }

  @override
  ShopRepository? shopRepository(String? appId) {
    if ((appId != null) && (_shopRepository[appId] == null)) {
      _shopRepository[appId] = ShopCache(ShopFirestore(
          () => appRepository()!.getSubCollection(appId, 'shop'), appId));
    }
    return _shopRepository[appId];
  }

  @override
  ShopFrontRepository? shopFrontRepository(String? appId) {
    if ((appId != null) && (_shopFrontRepository[appId] == null)) {
      _shopFrontRepository[appId] = ShopFrontCache(ShopFrontFirestore(
          () => appRepository()!.getSubCollection(appId, 'shopfront'), appId));
    }
    return _shopFrontRepository[appId];
  }
}
