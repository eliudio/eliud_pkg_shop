/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shared/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/cart_repository.dart';
import '../model/cart_item_repository.dart';
import '../model/member_cart_repository.dart';
import '../model/order_repository.dart';
import '../model/order_item_repository.dart';
import '../model/order_overview_repository.dart';
import '../model/pay_repository.dart';
import '../model/pay_confirmation_repository.dart';
import '../model/product_repository.dart';
import '../model/product_image_repository.dart';
import '../model/shop_repository.dart';
import '../model/shop_front_repository.dart';
import 'package:eliud_model/core/access/bloc/user_repository.dart';
import 'package:eliud_model/tools/types.dart';

CartRepository cartRepository() => AbstractRepositorySingleton.singleton.cartRepository();
MemberCartRepository memberCartRepository() => AbstractRepositorySingleton.singleton.memberCartRepository();
OrderRepository orderRepository() => AbstractRepositorySingleton.singleton.orderRepository();
OrderOverviewRepository orderOverviewRepository() => AbstractRepositorySingleton.singleton.orderOverviewRepository();
PayRepository payRepository() => AbstractRepositorySingleton.singleton.payRepository();
PayConfirmationRepository payConfirmationRepository() => AbstractRepositorySingleton.singleton.payConfirmationRepository();
ProductRepository productRepository() => AbstractRepositorySingleton.singleton.productRepository();
ShopRepository shopRepository() => AbstractRepositorySingleton.singleton.shopRepository();
ShopFrontRepository shopFrontRepository() => AbstractRepositorySingleton.singleton.shopFrontRepository();

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  CartRepository cartRepository();
  MemberCartRepository memberCartRepository();
  OrderRepository orderRepository();
  OrderOverviewRepository orderOverviewRepository();
  PayRepository payRepository();
  PayConfirmationRepository payConfirmationRepository();
  ProductRepository productRepository();
  ShopRepository shopRepository();
  ShopFrontRepository shopFrontRepository();

  void flush() {
    cartRepository().flush();
    memberCartRepository().flush();
    orderRepository().flush();
    orderOverviewRepository().flush();
    payRepository().flush();
    payConfirmationRepository().flush();
    productRepository().flush();
    shopRepository().flush();
    shopFrontRepository().flush();
  }
}
