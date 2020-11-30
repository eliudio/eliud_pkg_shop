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
import 'dart:collection';
import '../model/cart_firestore.dart';
import '../model/cart_repository.dart';
import '../model/cart_cache.dart';
import '../model/cart_item_repository.dart';
import '../model/cart_item_cache.dart';
import '../model/order_firestore.dart';
import '../model/order_repository.dart';
import '../model/order_cache.dart';
import '../model/order_item_repository.dart';
import '../model/order_item_cache.dart';
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
import '../model/product_image_repository.dart';
import '../model/product_image_cache.dart';
import '../model/shop_firestore.dart';
import '../model/shop_repository.dart';
import '../model/shop_cache.dart';
import '../model/shop_front_firestore.dart';
import '../model/shop_front_repository.dart';
import '../model/shop_front_cache.dart';

import '../model/cart_model.dart';
import '../model/cart_item_model.dart';
import '../model/order_model.dart';
import '../model/order_item_model.dart';
import '../model/order_overview_model.dart';
import '../model/pay_model.dart';
import '../model/pay_confirmation_model.dart';
import '../model/product_model.dart';
import '../model/product_image_model.dart';
import '../model/shop_front_model.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
    var _cartRepository = HashMap<String, CartRepository>();
    var _orderRepository = HashMap<String, OrderRepository>();
    var _orderOverviewRepository = HashMap<String, OrderOverviewRepository>();
    var _payRepository = HashMap<String, PayRepository>();
    var _payConfirmationRepository = HashMap<String, PayConfirmationRepository>();
    var _productRepository = HashMap<String, ProductRepository>();
    var _shopRepository = HashMap<String, ShopRepository>();
    var _shopFrontRepository = HashMap<String, ShopFrontRepository>();

    CartRepository cartRepository(String appId) {
      if (_cartRepository[appId] == null) _cartRepository[appId] = CartCache(CartFirestore(appId));
      return _cartRepository[appId];
    }
    OrderRepository orderRepository(String appId) {
      if (_orderRepository[appId] == null) _orderRepository[appId] = OrderCache(OrderFirestore(appId));
      return _orderRepository[appId];
    }
    OrderOverviewRepository orderOverviewRepository(String appId) {
      if (_orderOverviewRepository[appId] == null) _orderOverviewRepository[appId] = OrderOverviewCache(OrderOverviewFirestore(appId));
      return _orderOverviewRepository[appId];
    }
    PayRepository payRepository(String appId) {
      if (_payRepository[appId] == null) _payRepository[appId] = PayCache(PayFirestore(appId));
      return _payRepository[appId];
    }
    PayConfirmationRepository payConfirmationRepository(String appId) {
      if (_payConfirmationRepository[appId] == null) _payConfirmationRepository[appId] = PayConfirmationCache(PayConfirmationFirestore(appId));
      return _payConfirmationRepository[appId];
    }
    ProductRepository productRepository(String appId) {
      if (_productRepository[appId] == null) _productRepository[appId] = ProductCache(ProductFirestore(appId));
      return _productRepository[appId];
    }
    ShopRepository shopRepository(String appId) {
      if (_shopRepository[appId] == null) _shopRepository[appId] = ShopCache(ShopFirestore(appId));
      return _shopRepository[appId];
    }
    ShopFrontRepository shopFrontRepository(String appId) {
      if (_shopFrontRepository[appId] == null) _shopFrontRepository[appId] = ShopFrontCache(ShopFrontFirestore(appId));
      return _shopFrontRepository[appId];
    }

}
