/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/admin_app.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/admin_app_base.dart';
import 'package:eliud_core/tools/action_model.dart';

import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class AdminApp extends AdminAppInstallerBase {
  final String appID;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;
  
  AdminApp(this.appID, this._drawer, this._endDrawer, this._appBar, this._homeMenu, this.menuItemColor, this.selectedMenuItemColor, this.backgroundColor);


  PageModel _cartsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-carts", componentName: "eliud_pkg_shop_internalWidgets", componentId: "carts"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "eliud_pkg_shop_carts_page",
        title: "Carts",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _ordersPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-orders", componentName: "eliud_pkg_shop_internalWidgets", componentId: "orders"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "eliud_pkg_shop_orders_page",
        title: "Orders",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _orderOverviewsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-orderOverviews", componentName: "eliud_pkg_shop_internalWidgets", componentId: "orderOverviews"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "eliud_pkg_shop_orderoverviews_page",
        title: "OrderOverviews",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _paysPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-pays", componentName: "eliud_pkg_shop_internalWidgets", componentId: "pays"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "eliud_pkg_shop_pays_page",
        title: "Pays",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _payConfirmationsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-payConfirmations", componentName: "eliud_pkg_shop_internalWidgets", componentId: "payConfirmations"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "eliud_pkg_shop_payconfirmations_page",
        title: "PayConfirmations",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _productsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-products", componentName: "eliud_pkg_shop_internalWidgets", componentId: "products"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "eliud_pkg_shop_products_page",
        title: "Products",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _shopsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-shops", componentName: "eliud_pkg_shop_internalWidgets", componentId: "shops"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "eliud_pkg_shop_shops_page",
        title: "Shops",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _shopFrontsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-shopFronts", componentName: "eliud_pkg_shop_internalWidgets", componentId: "shopFronts"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "eliud_pkg_shop_shopfronts_page",
        title: "ShopFronts",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  Future<void> _setupAdminPages() {

    return pageRepository().add(_cartsPages())

        .then((_) => pageRepository().add(_ordersPages()))

        .then((_) => pageRepository().add(_orderOverviewsPages()))

        .then((_) => pageRepository().add(_paysPages()))

        .then((_) => pageRepository().add(_payConfirmationsPages()))

        .then((_) => pageRepository().add(_productsPages()))

        .then((_) => pageRepository().add(_shopsPages()))

        .then((_) => pageRepository().add(_shopFrontsPages()))

    ;
  }

  @override
  Future<void> run() async {
    return _setupAdminPages();
  }


}

class AdminMenu extends AdminAppMenuInstallerBase {

  Future<MenuDefModel> menu(String appID) async {
    List<MenuItemModel> menuItems = List<MenuItemModel>();

    menuItems.add(
      MenuItemModel(
        documentID: "Carts",
        text: "Carts",
        description: "Carts",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "eliud_pkg_shop_carts_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Orders",
        text: "Orders",
        description: "Orders",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "eliud_pkg_shop_orders_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "OrderOverviews",
        text: "OrderOverviews",
        description: "OrderOverviews",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "eliud_pkg_shop_orderoverviews_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Pays",
        text: "Pays",
        description: "Pays",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "eliud_pkg_shop_pays_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "PayConfirmations",
        text: "PayConfirmations",
        description: "PayConfirmations",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "eliud_pkg_shop_payconfirmations_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Products",
        text: "Products",
        description: "Products",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "eliud_pkg_shop_products_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Shops",
        text: "Shops",
        description: "Shops",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "eliud_pkg_shop_shops_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "ShopFronts",
        text: "ShopFronts",
        description: "ShopFronts",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "eliud_pkg_shop_shopfronts_page"))
    );


    MenuDefModel menu = MenuDefModel(
      admin: true,
      documentID: "eliud_pkg_shop_admin_menu",
      appId: appID,
      name: "eliud_pkg_shop",
      menuItems: menuItems
    );
    await menuDefRepository().add(menu);
    return menu;
  }
}

class AdminAppWiper extends AdminAppWiperBase {

  @override
  Future<void> deleteAll(String appID) async {
    await cartRepository().deleteAll();
    await orderRepository().deleteAll();
    await orderOverviewRepository().deleteAll();
    await payRepository().deleteAll();
    await payConfirmationRepository().deleteAll();
    await productRepository().deleteAll();
    await shopRepository().deleteAll();
    await shopFrontRepository().deleteAll();
    ;
  }


}

