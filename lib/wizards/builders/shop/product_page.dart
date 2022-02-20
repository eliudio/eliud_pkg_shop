import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/product_display_component.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:eliud_pkg_shop/wizards/builders/shop/process/cart.dart';

class ProductPage extends PageBuilder {
  final ShopModel? shop;

  static const String identifier = 'productpage';

  ProductPage(
      String pageId,
      AppModel app,
      String memberId,
      HomeMenuModel theHomeMenu,
      AppBarModel theAppBar,
      DrawerModel leftDrawer,
      DrawerModel rightDrawer,
      this.shop,
      ) : super(pageId, app, memberId, theHomeMenu, theAppBar, leftDrawer,
      rightDrawer);

  static ActionModel action(AppModel app) => GotoPage(app,
      pageID: ProductPage.identifier,
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
        packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
      ));

  ProductDisplayModel _productDisplayOverview() {
    return ProductDisplayModel(
      documentID: 'product',
      appId: app.documentID!,
      title: pageTitle(),
      shop: shop,
      buyAction: MyCart.openCartPage(app),
      itemDetailBackground: null,
      addToBasketText: 'Add to basket',
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Product';

  @override
  String componentName() => AbstractProductDisplayComponent.componentName;

  @override
  String? componentID() {
    return _productDisplayOverview().documentID;
  }

  @override
  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton
        .productDisplayRepository(app.documentID!)!
        .add(_productDisplayOverview());
  }
}
