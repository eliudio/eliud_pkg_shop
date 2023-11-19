import 'package:eliud_core/core/wizards/tools/document_identifier.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/background_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core_model/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/cart_component.dart';
import 'package:eliud_pkg_shop_model/model/cart_model.dart';
import 'package:eliud_pkg_shop_model/model/shop_model.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:flutter/material.dart';
import 'abstract_page_template.dart';
import 'pay_page_builder.dart';
import 'product_page_builder.dart';
import 'shop_page_builder.dart';

class CartPageBuilder extends AbstractPageTemplate {
  final BackgroundModel? background;
  final ShopModel? shop;

  static const String thePageId = 'shop-cart';

  CartPageBuilder(
    String uniqueId,
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
    this.shop,
    this.background,
  ) : super(
          uniqueId,
          thePageId,
          app,
          memberId,
          theHomeMenu,
          theAppBar,
          leftDrawer,
          rightDrawer,
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple,
        );

  static GotoPage openCartPage(AppModel app, String uniqueId) => GotoPage(app,
      pageID: constructDocumentId(uniqueId: uniqueId, documentId: thePageId),
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.noPrivilegeRequired,
        packageCondition: ShopPackage.conditionCartsHasItems,
      ));

  static MenuItemModel menuItemBag(AppModel app, String uniqueId) {
    return MenuItemModel(
        documentID: newRandomKey(),
        text: 'Your bag',
        description: 'Your bag',
        icon: IconModel(
            codePoint: Icons.shopping_basket.codePoint,
            fontFamily: Icons.shopping_basket.fontFamily),
        action: openCartPage(app, uniqueId));
  }

  static MenuItemModel menuItemCart(AppModel app, String uniqueId) {
    return MenuItemModel(
        documentID: newRandomKey(),
        text: 'Your cart',
        description: 'Your cart',
        icon: IconModel(
            codePoint: Icons.shopping_cart.codePoint,
            fontFamily: Icons.shopping_cart.fontFamily),
        action: openCartPage(app, uniqueId));
  }

  CartModel _cart() {
    return CartModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: 'cart'),
      appId: app.documentID,
      title: pageTitle(),
      description: 'Shopping bag',
      checkoutText: 'Checkout',
      shop: shop,
      itemImageBackground: null,
      itemDetailBackground: background,
      checkoutAction: PayPageBuilder.action(app, uniqueId),
      backToShopAction: ShopPageBuilder.action(app, uniqueId),
      openProductAction: ProductPageBuilder.action(app, uniqueId),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Your Bag';

  @override
  String pageDescription() => 'Your Bag Page';

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
        .cartRepository(app.documentID)!
        .add(_cart());
  }
}
