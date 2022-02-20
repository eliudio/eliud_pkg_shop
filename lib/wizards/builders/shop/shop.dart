import 'package:eliud_core/model/abstract_repository_singleton.dart'
    as corerepo;
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
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
import 'package:eliud_pkg_shop/wizards/builders/shop/pos_sizes.dart';
import 'package:eliud_pkg_shop/wizards/builders/shop/products.dart';

import 'process/cart.dart';
import 'product_page.dart';

class Shop {
  AppModel app;
  String pageId;
  String memberId;
  HomeMenuModel homeMenu;
  AppBarModel appBar;
  DrawerModel drawer;
  DrawerModel endDrawer;

  Shop({
    required this.app,
    required this.memberId,
    required this.appBar,
    required this.pageId,
    required this.homeMenu,
    required this.drawer,
    required this.endDrawer,
  });

  static String identifier = 'juuwleshop';

  static ActionModel action(AppModel app) => GotoPage(
    app,
    pageID: Shop.identifier,
  );

  Future<PageModel> _setupPage(
      AppBarModel appBar, String? presentationDocumentId) async {
    return await corerepo.AbstractRepositorySingleton.singleton
        .pageRepository(app.documentID!)!
        .add(_page(appBar, presentationDocumentId));
  }

  PageModel _page(AppBarModel appBar, String? presentationDocumentId) {
    var components = <BodyComponentModel>[];
    components.add(BodyComponentModel(
        documentID: '1',
        componentName: AbstractFaderComponent.componentName,
        componentId: faderIdentifier));
    components.add(BodyComponentModel(
        documentID: '2',
        componentName: AbstractDividerComponent.componentName,
        componentId: 'divider_1'));
    components.add(BodyComponentModel(
        documentID: '2',
        componentName: AbstractPresentationComponent.componentName,
        componentId: presentationDocumentId));

    return PageModel(
        documentID: identifier,
        appId: app.documentID!,
        title: 'Shop',
        drawer: drawer,
        endDrawer: endDrawer,
        appBar: appBar,
        homeMenu: homeMenu,
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
        image: thePlatformLogo));
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
        documentID: identifier,
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
      buyAction: MyCart.openCartPage(app),
      view: ShopFrontView.Slider,
      openProductAction:
          GotoPage(app, pageID: ProductPage.identifier),
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
      buyAction: MyCart.openCartPage(app),
      view: ShopFrontView.Grid,
      openProductAction:
          GotoPage(app, pageID: ProductPage.identifier),
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

  Future<PlatformMediumModel> uploadImage() async {
    return await PlatformMediumHelper(app, memberId,
        PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple)
        .createThumbnailUploadPhotoAsset(
        newRandomKey(),
        'packages/eliud_pkg_shop/assets/juuwle_app/decorating/charlotte_presenting.png'
    );
  }

  static String appBarIdentifier = 'store';

  Future<ShopModel> run() async {
    var image = await uploadImage();
    var presentationDocumentId = (await _setupPresentation(image)).documentID;
    await _setupShopFronts();
    var shop = await _setupShop();
    await Products(shop: shop, app: app, memberId: memberId, ).run();
    await _setupFader();
    await _setupPage(appBar, presentationDocumentId);
    return shop;
  }
}
