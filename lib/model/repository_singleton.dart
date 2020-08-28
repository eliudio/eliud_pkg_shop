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
  RepositorySingleton(String appID) {
    _cartRepository = CartCache(CartFirestore(appID));
    _orderRepository = OrderCache(OrderFirestore(appID));
    _orderOverviewRepository = OrderOverviewCache(OrderOverviewFirestore(appID));
    _payRepository = PayCache(PayFirestore(appID));
    _payConfirmationRepository = PayConfirmationCache(PayConfirmationFirestore(appID));
    _productRepository = ProductCache(ProductFirestore(appID));
    _shopRepository = ShopCache(ShopFirestore(appID));
    _shopFrontRepository = ShopFrontCache(ShopFrontFirestore(appID));
  }
  CartRepository cartRepository() => _cartRepository;
  CartRepository _cartRepository;
  OrderRepository orderRepository() => _orderRepository;
  OrderRepository _orderRepository;
  OrderOverviewRepository orderOverviewRepository() => _orderOverviewRepository;
  OrderOverviewRepository _orderOverviewRepository;
  PayRepository payRepository() => _payRepository;
  PayRepository _payRepository;
  PayConfirmationRepository payConfirmationRepository() => _payConfirmationRepository;
  PayConfirmationRepository _payConfirmationRepository;
  ProductRepository productRepository() => _productRepository;
  ProductRepository _productRepository;
  ShopRepository shopRepository() => _shopRepository;
  ShopRepository _shopRepository;
  ShopFrontRepository shopFrontRepository() => _shopFrontRepository;
  ShopFrontRepository _shopFrontRepository;

}
