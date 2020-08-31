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
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';

class AdminApp {
  final String appID;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;
  
  AdminApp(this.appID, this._drawer, this._endDrawer, this._appBar, this._homeMenu, this.menuItemColor, this.selectedMenuItemColor, this.backgroundColor);


  static MenuDefModel _adminMenuDef(String appID) {
    List<MenuItemModel> menuItems = List<MenuItemModel>();

    menuItems.add(
      MenuItemModel(
        documentID: "Carts",
        text: "Carts",
        description: "Carts",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "cartspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Orders",
        text: "Orders",
        description: "Orders",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "orderspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "OrderOverviews",
        text: "OrderOverviews",
        description: "OrderOverviews",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "orderoverviewspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Pays",
        text: "Pays",
        description: "Pays",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "payspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "PayConfirmations",
        text: "PayConfirmations",
        description: "PayConfirmations",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "payconfirmationspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Products",
        text: "Products",
        description: "Products",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "productspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Shops",
        text: "Shops",
        description: "Shops",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "shopspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "ShopFronts",
        text: "ShopFronts",
        description: "ShopFronts",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "shopfrontspage"))
    );


    MenuDefModel menu = MenuDefModel(
      admin: true,
      documentID: "ADMIN_MENU_DEF_1",
      appId: appID,
      name: "Menu Definition 1",
      menuItems: menuItems
    );
    return menu;
  }

  static Future<MenuDefModel> _setupMenuDef(String appID) {
    return menuDefRepository().add(_adminMenuDef(appID));
  }


  PageModel _cartsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-carts", componentName: "internalWidgets", componentId: "carts"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "cartspage",
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
      documentID: "internalWidget-orders", componentName: "internalWidgets", componentId: "orders"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "orderspage",
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
      documentID: "internalWidget-orderOverviews", componentName: "internalWidgets", componentId: "orderOverviews"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "orderoverviewspage",
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
      documentID: "internalWidget-pays", componentName: "internalWidgets", componentId: "pays"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "payspage",
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
      documentID: "internalWidget-payConfirmations", componentName: "internalWidgets", componentId: "payConfirmations"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "payconfirmationspage",
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
      documentID: "internalWidget-products", componentName: "internalWidgets", componentId: "products"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "productspage",
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
      documentID: "internalWidget-shops", componentName: "internalWidgets", componentId: "shops"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "shopspage",
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
      documentID: "internalWidget-shopFronts", componentName: "internalWidgets", componentId: "shopFronts"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "shopfrontspage",
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

  static Future<void> deleteAll(String appID) async {
    return await imageRepository().deleteAll()
        .then((_) => cartRepository().deleteAll())
        .then((_) => orderRepository().deleteAll())
        .then((_) => orderOverviewRepository().deleteAll())
        .then((_) => payRepository().deleteAll())
        .then((_) => payConfirmationRepository().deleteAll())
        .then((_) => productRepository().deleteAll())
        .then((_) => shopRepository().deleteAll())
        .then((_) => shopFrontRepository().deleteAll())
    ;
  }

  static Future<MenuDefModel> menu(String appID) async {
    return _setupMenuDef(appID);
  }

  Future<void> run() async {
    return _setupAdminPages();
  }


}

