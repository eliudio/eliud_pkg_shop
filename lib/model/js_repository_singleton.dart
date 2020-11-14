/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/js_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/cart_js_firestore.dart';
import '../model/cart_repository.dart';
import '../model/cart_cache.dart';
import '../model/cart_item_repository.dart';
import '../model/cart_item_cache.dart';
import '../model/order_js_firestore.dart';
import '../model/order_repository.dart';
import '../model/order_cache.dart';
import '../model/order_item_repository.dart';
import '../model/order_item_cache.dart';
import '../model/order_overview_js_firestore.dart';
import '../model/order_overview_repository.dart';
import '../model/order_overview_cache.dart';
import '../model/pay_js_firestore.dart';
import '../model/pay_repository.dart';
import '../model/pay_cache.dart';
import '../model/pay_confirmation_js_firestore.dart';
import '../model/pay_confirmation_repository.dart';
import '../model/pay_confirmation_cache.dart';
import '../model/product_js_firestore.dart';
import '../model/product_repository.dart';
import '../model/product_cache.dart';
import '../model/product_image_repository.dart';
import '../model/product_image_cache.dart';
import '../model/shop_js_firestore.dart';
import '../model/shop_repository.dart';
import '../model/shop_cache.dart';
import '../model/shop_front_js_firestore.dart';
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

class JsRepositorySingleton extends AbstractRepositorySingleton {
    var _cartRepository = HashMap<String, CartRepository>();
    var _orderRepository = HashMap<String, OrderRepository>();
    var _orderOverviewRepository = HashMap<String, OrderOverviewRepository>();
    var _payRepository = HashMap<String, PayRepository>();
    var _payConfirmationRepository = HashMap<String, PayConfirmationRepository>();
    var _productRepository = HashMap<String, ProductRepository>();
    var _shopRepository = HashMap<String, ShopRepository>();
    var _shopFrontRepository = HashMap<String, ShopFrontRepository>();

    CartRepository cartRepository(String appID) {
      if (_cartRepository[appID] == null) _cartRepository[appID] = CartCache(CartJsFirestore(appID));
      return _cartRepository[appID];
    }
    OrderRepository orderRepository(String appID) {
      if (_orderRepository[appID] == null) _orderRepository[appID] = OrderCache(OrderJsFirestore(appID));
      return _orderRepository[appID];
    }
    OrderOverviewRepository orderOverviewRepository(String appID) {
      if (_orderOverviewRepository[appID] == null) _orderOverviewRepository[appID] = OrderOverviewCache(OrderOverviewJsFirestore(appID));
      return _orderOverviewRepository[appID];
    }
    PayRepository payRepository(String appID) {
      if (_payRepository[appID] == null) _payRepository[appID] = PayCache(PayJsFirestore(appID));
      return _payRepository[appID];
    }
    PayConfirmationRepository payConfirmationRepository(String appID) {
      if (_payConfirmationRepository[appID] == null) _payConfirmationRepository[appID] = PayConfirmationCache(PayConfirmationJsFirestore(appID));
      return _payConfirmationRepository[appID];
    }
    ProductRepository productRepository(String appID) {
      if (_productRepository[appID] == null) _productRepository[appID] = ProductCache(ProductJsFirestore(appID));
      return _productRepository[appID];
    }
    ShopRepository shopRepository(String appID) {
      if (_shopRepository[appID] == null) _shopRepository[appID] = ShopCache(ShopJsFirestore(appID));
      return _shopRepository[appID];
    }
    ShopFrontRepository shopFrontRepository(String appID) {
      if (_shopFrontRepository[appID] == null) _shopFrontRepository[appID] = ShopFrontCache(ShopFrontJsFirestore(appID));
      return _shopFrontRepository[appID];
    }

}
