/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shared/js_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import '../model/cart_js_firestore.dart';
import '../model/cart_repository.dart';
import '../model/cart_cache.dart';
import '../model/cart_item_repository.dart';
import '../model/cart_item_cache.dart';
import '../model/member_cart_js_firestore.dart';
import '../model/member_cart_repository.dart';
import '../model/member_cart_cache.dart';
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
import 'package:eliud_model/core/access/bloc/user_repository.dart';
import 'package:eliud_model/tools/types.dart';

import 'package:eliud_model/shared/image_js_firestore_bespoke.dart';
import 'package:eliud_model/shared/image_cache.dart';

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
  JsRepositorySingleton(String appID) {
    _cartRepository = CartCache(CartJsFirestore(appID));
    _memberCartRepository = MemberCartCache(MemberCartJsFirestore());
    _orderRepository = OrderCache(OrderJsFirestore(appID));
    _orderOverviewRepository = OrderOverviewCache(OrderOverviewJsFirestore(appID));
    _payRepository = PayCache(PayJsFirestore(appID));
    _payConfirmationRepository = PayConfirmationCache(PayConfirmationJsFirestore(appID));
    _productRepository = ProductCache(ProductJsFirestore(appID));
    _shopRepository = ShopCache(ShopJsFirestore(appID));
    _shopFrontRepository = ShopFrontCache(ShopFrontJsFirestore(appID));
  }
  CartRepository cartRepository() => _cartRepository;
  CartRepository _cartRepository;
  MemberCartRepository memberCartRepository() => _memberCartRepository;
  MemberCartRepository _memberCartRepository;
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
