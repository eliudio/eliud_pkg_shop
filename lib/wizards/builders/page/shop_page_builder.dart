import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart'
    as corerepo;
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/style/_default/tools/colors.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/storage/platform_medium_helper.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/divider_component.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart'
    as shoprepo;
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/shop_front_component.dart';
import 'package:eliud_pkg_shop/wizards/builders/util/pos_sizes.dart';
import 'package:eliud_pkg_shop/wizards/builders/util/products.dart';
import 'package:flutter/material.dart';
import 'cart_page_builder.dart';
import 'product_page_builder.dart';

class ShopPageBuilder extends PageBuilder {
  static String SHOP_COMPONENT_IDENTIFIER = "shop";
  static String SHOP_PAGE_ID = 'shop';

  ShopPageBuilder(
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
    PageProvider pageProvider,
    ActionProvider actionProvider,
  ) : super(SHOP_PAGE_ID, app, memberId, theHomeMenu, theAppBar, leftDrawer,
            rightDrawer, pageProvider, actionProvider);

  static String PAGE_ID = 'shop-front';

  static ActionModel action(AppModel app) => GotoPage(
        app,
        pageID: PAGE_ID,
      );

  static MenuItemModel menuItem(AppModel app) => MenuItemModel(
      documentID: newRandomKey(),
      text: 'Shop',
      description: 'Shop',
      icon: IconModel(
          codePoint: Icons.shopping_basket.codePoint,
          fontFamily: Icons.settings.fontFamily),
      action: GotoPage(app, pageID: PAGE_ID));


  Future<PageModel> _setupPage(String? presentationDocumentId) async {
    return await corerepo.AbstractRepositorySingleton.singleton
        .pageRepository(app.documentID!)!
        .add(_page(presentationDocumentId));
  }

  PageModel _page(String? presentationDocumentId) {
    var components = <BodyComponentModel>[];
    components.add(BodyComponentModel(
        documentID: '1',
        componentName: AbstractFaderComponent.componentName,
        componentId: faderIdentifier));
    components.add(BodyComponentModel(
        documentID: '2',
        componentName: AbstractDividerComponent.componentName,
        componentId: 'divider_1'));
    if (presentationDocumentId != null) {
      components.add(BodyComponentModel(
          documentID: '2',
          componentName: AbstractPresentationComponent.componentName,
          componentId: presentationDocumentId));
    }

    return PageModel(
        documentID: SHOP_PAGE_ID,
        appId: app.documentID!,
        title: 'Shop',
        drawer: leftDrawer,
        endDrawer: rightDrawer,
        appBar: theAppBar,
        homeMenu: theHomeMenu,
        layout: PageLayout.ListView,
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple,
        ),
        bodyComponents: components);
  }

  Future<FaderModel> _setupFader() async {
    return await AbstractRepositorySingleton.singleton
        .faderRepository(app.documentID!)!
        .add(_fader());
  }

  static String faderIdentifier = 'juuwlefader';
  FaderModel _fader() {
    var items = <ListedItemModel>[];
    items.add(ListedItemModel(
      documentID: 'juuwle',
      description: 'Juuwle',
      posSize: halfScreen(app.documentID!),
//        image: thePlatformLogo
    ));
    var model = FaderModel(
      documentID: faderIdentifier,
      name: 'Juuwle Fader',
      animationMilliseconds: 1000,
      imageSeconds: 5,
      items: items,
      appId: app.documentID!,
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
    return model;
  }

  Future<ShopModel> _setupShop() async {
    return await shoprepo.AbstractRepositorySingleton.singleton
        .shopRepository(app.documentID!)!
        .add(_shop());
  }

  ShopModel _shop() {
    var document = ShopModel(
        documentID: 'mainshop',
        description: 'Main shop',
        shortDescription: 'Main shop',
        currency: 'eur',
        appId: app.documentID!);
    return document;
  }

  static String shopFrontIdentifier1 = 'front1';

  ShopFrontModel _shopFront1() {
    return ShopFrontModel(
      documentID: shopFrontIdentifier1,
      appId: app.documentID!,
      title: 'Featured',
      description: 'These are my featured products',
      shop: _shop(),
      addToCartColor: EliudColors.red,
      itemCardBackground: cardBG(),
      buyAction: CartPageBuilder.openCartPage(app),
      view: ShopFrontView.Slider,
      openProductAction: GotoPage(app, pageID: ProductPageBuilder.PAGE_ID),
      size: 250,
      cardElevation: 10,
      cardAxisSpacing: 20,
      scrollDirection: ScrollDirection.Vertical,
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  static String shopFrontIdentifier2 = 'front2';

  ShopFrontModel _shopFront2() {
    return ShopFrontModel(
      documentID: shopFrontIdentifier2,
      appId: app.documentID!,
      title: 'My products',
      description: 'These are my lovely products',
      shop: _shop(),
      addToCartColor: EliudColors.red,
      itemCardBackground: cardBG(),
      buyAction: CartPageBuilder.openCartPage(app),
      view: ShopFrontView.Grid,
      openProductAction: GotoPage(app, pageID: ProductPageBuilder.PAGE_ID),
      size: 250,
      cardElevation: 10,
      cardAxisSpacing: 20,
      scrollDirection: ScrollDirection.Vertical,
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  Future<void> _setupShopFronts() async {
    await shoprepo.AbstractRepositorySingleton.singleton
        .shopFrontRepository(app.documentID!)!
        .add(_shopFront1());
    await shoprepo.AbstractRepositorySingleton.singleton
        .shopFrontRepository(app.documentID!)!
        .add(_shopFront2());
  }

  static BackgroundModel cardBG() {
    var decorationColorModels = <DecorationColorModel>[];
    var decorationColorModel1 = DecorationColorModel(
      documentID: '1',
      color: EliudColors.white,
    );
    decorationColorModels.add(decorationColorModel1);
    var decorationColorModel2 = DecorationColorModel(
      documentID: '2',
      color: EliudColors.whiteTransparent,
    );

    decorationColorModels.add(decorationColorModel2);
    var backgroundModel = BackgroundModel(
      border: true,
      beginGradientPosition: StartGradientPosition.CenterLeft,
      endGradientPosition: EndGradientPosition.CenterRight,
      decorationColors: decorationColorModels,
    );
    return backgroundModel;
  }

  static String itemBackground = 'card_bg';

  PresentationModel _presentation(PlatformMediumModel memberMediumModel) {
    return PresentationModel(
      documentID: 'shop',
      appId: app.documentID!,
      bodyComponents: [
        BodyComponentModel(
            documentID: '1',
            componentName: AbstractShopFrontComponent.componentName,
            componentId: _shopFront2().documentID)
      ],
      image: memberMediumModel,
      imagePositionRelative: PresentationRelativeImagePosition.Aside,
      imageAlignment: PresentationImageAlignment.Left,
      imageWidth: .33,
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  Future<PresentationModel> _setupPresentation(
      PlatformMediumModel memberMediumModel) async {
    var presentationModel = _presentation(memberMediumModel);
    await AbstractRepositorySingleton.singleton
        .presentationRepository(app.documentID!)!
        .add(presentationModel);
    return presentationModel;
  }

  Future<ShopModel> create(PlatformMediumModel? image) async {
    var presentationDocumentId;
    if (image != null) {
      presentationDocumentId = (await _setupPresentation(image)).documentID;
    }
    await _setupShopFronts();
    var shop = await _setupShop();
    await Products(
      shop: shop,
      app: app,
      memberId: memberId,
    ).run();
    await _setupFader();
    await _setupPage(presentationDocumentId);
    return shop;
  }
}
