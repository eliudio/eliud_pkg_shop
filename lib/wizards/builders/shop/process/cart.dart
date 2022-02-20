import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/cart_component.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:eliud_pkg_shop/wizards/builders/shop/process/pay.dart';
import 'package:eliud_pkg_shop/wizards/builders/shop/shop.dart';

import '../product_page.dart';

class MyCart extends PageBuilder {
  final BackgroundModel? background;
  final ShopModel? shop;

  static const String identifier = 'juuwlecart';

  MyCart(
      String pageId,
      AppModel app,
      String memberId,
      HomeMenuModel theHomeMenu,
      AppBarModel theAppBar,
      DrawerModel leftDrawer,
      DrawerModel rightDrawer,
      this.shop,
      this.background,
      ) : super(pageId, app, memberId, theHomeMenu, theAppBar, leftDrawer,
      rightDrawer);

  static GotoPage openCartPage(AppModel app) => GotoPage(app, pageID: MyCart.identifier, conditions:
      DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
        packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
      )
  );

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
        checkoutAction: MyPay.action(app),
        backToShopAction: Shop.action(app),
        openProductAction: ProductPage.action(app),
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple
        ),
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
    await AbstractRepositorySingleton.singleton.
    cartRepository(app.documentID!)!.add(_cart());
  }

  @override
  String assetLocation() => 'packages/eliud_pkg_shop/assets/juuwle_app/decorating/charlotte_with_bags.png';
}
