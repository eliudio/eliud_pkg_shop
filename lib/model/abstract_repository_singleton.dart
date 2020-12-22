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
import '../model/product_display_repository.dart';
import '../model/product_image_repository.dart';
import '../model/shop_repository.dart';
import '../model/shop_front_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

CartRepository cartRepository({ String appId }) => AbstractRepositorySingleton.singleton.cartRepository(appId);
OrderRepository orderRepository({ String appId }) => AbstractRepositorySingleton.singleton.orderRepository(appId);
OrderOverviewRepository orderOverviewRepository({ String appId }) => AbstractRepositorySingleton.singleton.orderOverviewRepository(appId);
PayRepository payRepository({ String appId }) => AbstractRepositorySingleton.singleton.payRepository(appId);
PayConfirmationRepository payConfirmationRepository({ String appId }) => AbstractRepositorySingleton.singleton.payConfirmationRepository(appId);
ProductRepository productRepository({ String appId }) => AbstractRepositorySingleton.singleton.productRepository(appId);
ProductDisplayRepository productDisplayRepository({ String appId }) => AbstractRepositorySingleton.singleton.productDisplayRepository(appId);
ShopRepository shopRepository({ String appId }) => AbstractRepositorySingleton.singleton.shopRepository(appId);
ShopFrontRepository shopFrontRepository({ String appId }) => AbstractRepositorySingleton.singleton.shopFrontRepository(appId);

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  CartRepository cartRepository(String appId);
  OrderRepository orderRepository(String appId);
  OrderOverviewRepository orderOverviewRepository(String appId);
  PayRepository payRepository(String appId);
  PayConfirmationRepository payConfirmationRepository(String appId);
  ProductRepository productRepository(String appId);
  ProductDisplayRepository productDisplayRepository(String appId);
  ShopRepository shopRepository(String appId);
  ShopFrontRepository shopFrontRepository(String appId);

  void flush(String appId) {
  }
}
