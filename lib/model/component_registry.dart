/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import '../model/internal_component.dart';
import 'package:eliud_core/tools/registry.dart';

import '../extensions/cart_component.dart';
import '../extensions/order_overview_component.dart';
import '../extensions/pay_component.dart';
import '../extensions/pay_confirmation_component.dart';
import '../extensions/product_component.dart';
import '../extensions/shop_front_component.dart';



class ComponentRegistry {

  void init() {
    Registry.registry().addInternalComponents(["carts", "orders", "orderOverviews", "pays", "payConfirmations", "products", "shops", "shopFronts", ]);

    Registry.registry().register(componentName: "eliud_pkg_shop_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry().register(componentName: "carts", componentConstructor: CartComponentConstructorDefault());
    Registry.registry().register(componentName: "orderOverviews", componentConstructor: OrderOverviewComponentConstructorDefault());
    Registry.registry().register(componentName: "pays", componentConstructor: PayComponentConstructorDefault());
    Registry.registry().register(componentName: "payConfirmations", componentConstructor: PayConfirmationComponentConstructorDefault());
    Registry.registry().register(componentName: "products", componentConstructor: ProductComponentConstructorDefault());
    Registry.registry().register(componentName: "shopFronts", componentConstructor: ShopFrontComponentConstructorDefault());

  }
}


