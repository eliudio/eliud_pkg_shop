/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/cart_repository.dart';
import '../model/cart_item_repository.dart';
import '../model/order_repository.dart';
import '../model/order_item_repository.dart';
import '../model/order_overview_repository.dart';
import '../model/pay_repository.dart';
import '../model/pay_confirmation_repository.dart';
import '../model/product_repository.dart';
import '../model/product_image_repository.dart';
import '../model/shop_repository.dart';
import '../model/shop_front_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/types.dart';

CartRepository cartRepository({ String appID }) => AbstractRepositorySingleton.singleton.cartRepository(appID);
OrderRepository orderRepository({ String appID }) => AbstractRepositorySingleton.singleton.orderRepository(appID);
OrderOverviewRepository orderOverviewRepository({ String appID }) => AbstractRepositorySingleton.singleton.orderOverviewRepository(appID);
PayRepository payRepository({ String appID }) => AbstractRepositorySingleton.singleton.payRepository(appID);
PayConfirmationRepository payConfirmationRepository({ String appID }) => AbstractRepositorySingleton.singleton.payConfirmationRepository(appID);
ProductRepository productRepository({ String appID }) => AbstractRepositorySingleton.singleton.productRepository(appID);
ShopRepository shopRepository({ String appID }) => AbstractRepositorySingleton.singleton.shopRepository(appID);
ShopFrontRepository shopFrontRepository({ String appID }) => AbstractRepositorySingleton.singleton.shopFrontRepository(appID);

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  CartRepository cartRepository(String appID);
  OrderRepository orderRepository(String appID);
  OrderOverviewRepository orderOverviewRepository(String appID);
  PayRepository payRepository(String appID);
  PayConfirmationRepository payConfirmationRepository(String appID);
  ProductRepository productRepository(String appID);
  ShopRepository shopRepository(String appID);
  ShopFrontRepository shopFrontRepository(String appID);

  void flush(String appID) {
    cartRepository(appID).flush();
    orderRepository(appID).flush();
    orderOverviewRepository(appID).flush();
    payRepository(appID).flush();
    payConfirmationRepository(appID).flush();
    productRepository(appID).flush();
    shopRepository(appID).flush();
    shopFrontRepository(appID).flush();
  }
}
