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
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/tools/component/component_spec.dart';

import '../extensions/cart_component.dart';
import '../editors/cart_component_editor.dart';
import 'cart_component_selector.dart';
import '../extensions/order_overview_component.dart';
import '../editors/order_overview_component_editor.dart';
import 'order_overview_component_selector.dart';
import '../extensions/pay_component.dart';
import '../editors/pay_component_editor.dart';
import 'pay_component_selector.dart';
import '../extensions/pay_confirmation_component.dart';
import '../editors/pay_confirmation_component_editor.dart';
import 'pay_confirmation_component_selector.dart';
import '../extensions/product_display_component.dart';
import '../editors/product_display_component_editor.dart';
import 'product_display_component_selector.dart';
import '../extensions/shop_front_component.dart';
import '../editors/shop_front_component_editor.dart';
import 'shop_front_component_selector.dart';
import 'package:eliud_pkg_shop/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry()!.addInternalComponents('eliud_pkg_shop', ["carts", "orders", "orderOverviews", "pays", "payConfirmations", "products", "productDisplays", "shops", "shopFronts", ]);

    Registry.registry()!.register(componentName: "eliud_pkg_shop_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry()!.addDropDownSupporter("carts", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "carts", componentConstructor: CartComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("orderOverviews", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "orderOverviews", componentConstructor: OrderOverviewComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("pays", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "pays", componentConstructor: PayComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("payConfirmations", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "payConfirmations", componentConstructor: PayConfirmationComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("productDisplays", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "productDisplays", componentConstructor: ProductDisplayComponentConstructorDefault());
    Registry.registry()!.addDropDownSupporter("shopFronts", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "shopFronts", componentConstructor: ShopFrontComponentConstructorDefault());
    Registry.registry()!.addComponentSpec('eliud_pkg_shop', 'shop', [
      ComponentSpec('carts', CartComponentConstructorDefault(), CartComponentSelector(), CartComponentEditorConstructor(), ), 
      ComponentSpec('orderOverviews', OrderOverviewComponentConstructorDefault(), OrderOverviewComponentSelector(), OrderOverviewComponentEditorConstructor(), ), 
      ComponentSpec('pays', PayComponentConstructorDefault(), PayComponentSelector(), PayComponentEditorConstructor(), ), 
      ComponentSpec('payConfirmations', PayConfirmationComponentConstructorDefault(), PayConfirmationComponentSelector(), PayConfirmationComponentEditorConstructor(), ), 
      ComponentSpec('productDisplays', ProductDisplayComponentConstructorDefault(), ProductDisplayComponentSelector(), ProductDisplayComponentEditorConstructor(), ), 
      ComponentSpec('shopFronts', ShopFrontComponentConstructorDefault(), ShopFrontComponentSelector(), ShopFrontComponentEditorConstructor(), ), 
    ]);

  }
}


