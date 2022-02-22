import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/cart_component.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:flutter/material.dart';
import 'abstract_page_template.dart';
import 'pay_page_builder.dart';
import 'product_page_builder.dart';
import 'shop_page_builder.dart';

class CartPageBuilder extends AbstractPageTemplate {
  final BackgroundModel? background;
  final ShopModel? shop;

  static const String PAGE_ID = 'shop-cart';

  CartPageBuilder(
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
    PageProvider pageProvider,
    ActionProvider actionProvider,
    this.shop,
    this.background,
  ) : super(
          PAGE_ID,
          app,
          memberId,
          theHomeMenu,
          theAppBar,
          leftDrawer,
          rightDrawer,
          pageProvider,
          actionProvider,
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple,
        );

  static GotoPage openCartPage(AppModel app) => GotoPage(app,
      pageID: PAGE_ID,
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
        packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
      ));

  static MenuItemModel menuItemBag(AppModel app) {
    return MenuItemModel(
        documentID: newRandomKey(),
        text: 'Your bag',
        description: 'Your bag',
        icon: IconModel(
            codePoint: Icons.shopping_basket.codePoint,
            fontFamily: Icons.shopping_basket.fontFamily),
        action:
        openCartPage(app));
  }

  static MenuItemModel menuItemCart(AppModel app) {
    return MenuItemModel(
        documentID: newRandomKey(),
        text: 'Your cart',
        description: 'Your cart',
        icon: IconModel(
            codePoint: Icons.shopping_cart.codePoint,
            fontFamily: Icons.shopping_cart.fontFamily),
        action:
        openCartPage(app));
  }

  CartModel _cart() {
    return CartModel(
      documentID: 'cart',
      appId: app.documentID!,
      title: pageTitle(),
      description: 'Shopping bag',
      checkoutText: 'Checkout',
      shop: shop,
      itemImageBackground: null,
      itemDetailBackground: background,
      checkoutAction: PayPageBuilder.action(app),
      backToShopAction: ShopPageBuilder.action(app),
      openProductAction: ProductPageBuilder.action(app),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Your Bag';

  @override
  String pageImageID() => 'cartImage';

  @override
  String componentName() => AbstractCartComponent.componentName;

  @override
  String? componentID() {
    return _cart().documentID;
  }

  @override
  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton
        .cartRepository(app.documentID!)!
        .add(_cart());
  }

  @override
  String assetLocation() =>
      'packages/eliud_pkg_shop/assets/shop/decorating/charlotte_with_bags.png';
}
