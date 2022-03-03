import 'package:eliud_core/core/wizards/registry/action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/style/_default/tools/colors.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_shop/wizards/builders/page/pay_confirmation_page_builder.dart';
import 'package:flutter/material.dart';
import 'builders/page/cart_page_builder.dart';
import 'builders/page/order_overview_page_builder.dart';
import 'builders/page/pay_page_builder.dart';
import 'builders/page/product_page_builder.dart';
import 'builders/page/shop_page_builder.dart';
import 'builders/widgets/shop_widget.dart';

class ShopPageWizard extends NewAppWizardInfo {
  ShopPageWizard()
      : super(
          'shop',
          'Shop',
        );

  @override
  NewAppWizardParameters newAppWizardParameters() => ShopParameters(
      shopSpecifications: ActionSpecification(
        requiresAccessToLocalFileSystem: false,
        availableInLeftDrawer: true,
        availableInRightDrawer: false,
        availableInAppBar: false,
        availableInHomeMenu: true,
        available: false,
      ),
      cartSpecifications: ActionSpecification(
        requiresAccessToLocalFileSystem: false,
        availableInLeftDrawer: false,
        availableInRightDrawer: false,
        availableInAppBar: true,
        availableInHomeMenu: false,
        available: false,
      ),
      shopAsCart: true,
      );

  @override
  List<NewAppTask>? getCreateTasks(
    String uniqueId,
    AppModel app,
    NewAppWizardParameters parameters,
    MemberModel member,
    HomeMenuProvider homeMenuProvider,
    AppBarProvider appBarProvider,
    DrawerProvider leftDrawerProvider,
    DrawerProvider rightDrawerProvider,
    PageProvider pageProvider,
    ActionProvider actionProvider,
  ) {
    if (parameters is ShopParameters) {
        var memberId = member.documentID!;
        var tasks = <NewAppTask>[];

        tasks.add(() async {
          var shop = await ShopPageBuilder(
                  uniqueId,
                  app,
                  memberId,
                  homeMenuProvider(),
                  appBarProvider(),
                  leftDrawerProvider(),
                  rightDrawerProvider(),
                  pageProvider,
                  actionProvider)
              .create(parameters.shopImage, parameters.faderImage);
          await CartPageBuilder(
                  uniqueId,
                  app,
                  memberId,
                  homeMenuProvider(),
                  appBarProvider(),
                  leftDrawerProvider(),
                  rightDrawerProvider(),
                  pageProvider,
                  actionProvider,
                  shop,
                  cardBG())
              .create(parameters.cartImage);
          await PayPageBuilder(
                  uniqueId,
                  app,
                  memberId,
                  homeMenuProvider(),
                  appBarProvider(),
                  leftDrawerProvider(),
                  rightDrawerProvider(),
                  pageProvider,
                  actionProvider,
                  shop,
                  cardBG())
              .create(parameters.payImage);
          await OrderOverviewPageBuilder(
                  uniqueId,
                  app,
                  memberId,
                  homeMenuProvider(),
                  appBarProvider(),
                  leftDrawerProvider(),
                  rightDrawerProvider(),
                  pageProvider,
                  actionProvider,
                  shop,
                  cardBG())
              .create(parameters.orderImage);
          await PayConfirmationPageBuilder(
                  uniqueId,
                  app,
                  memberId,
                  homeMenuProvider(),
                  appBarProvider(),
                  leftDrawerProvider(),
                  rightDrawerProvider(),
                  pageProvider,
                  actionProvider,
                  shop,
                  cardBG())
              .create(parameters.payConfirmationImage);
          await ProductPageBuilder(
                  uniqueId,
                  app,
                  memberId,
                  homeMenuProvider(),
                  appBarProvider(),
                  leftDrawerProvider(),
                  rightDrawerProvider(),
                  pageProvider,
                  actionProvider,
                  shop)
              .create();
        });

        return tasks;
    } else {
      throw Exception(
          'Unexpected class for parameters: ' + parameters.toString());
    }
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

  @override
  AppModel updateApp(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel adjustMe,
  ) =>
      adjustMe;

  @override
  String? getPageID(String uniqueId, NewAppWizardParameters parameters,
          String pageType) =>
      null;

  @override
  ActionModel? getAction(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel app,
    String actionType,
  ) =>
      null;

  @override
  List<MenuItemModel>? getMenuItemsFor(String uniqueId, AppModel app,
      NewAppWizardParameters parameters, MenuType type) {
    if (parameters is ShopParameters) {
      return [
        if (parameters.shopSpecifications.should(type))
          ShopPageBuilder.menuItem(app, uniqueId),
        if (parameters.cartSpecifications.should(type) && parameters.shopAsCart)
          CartPageBuilder.menuItemCart(app, uniqueId),
        if (parameters.cartSpecifications.should(type) &&
            !parameters.shopAsCart)
          CartPageBuilder.menuItemBag(app, uniqueId),
      ];
    } else {
      throw Exception(
          'Unexpected class for parameters: ' + parameters.toString());
    }
  }

  @override
  Widget wizardParametersWidget(AppModel app,
      BuildContext context, NewAppWizardParameters parameters) {
    if (parameters is ShopParameters) {
      return ShopParametersWidget(
        app: app,
        parameters: parameters,
      );
    } else {
      return text(app, context,
          'Unexpected class for parameters: ' + parameters.toString());
    }
  }

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId, NewAppWizardParameters parameters, String pageType) => null;
}

class ShopParameters extends NewAppWizardParameters {
  final ActionSpecification shopSpecifications;
  bool shopAsCart; // or as bag
  final ActionSpecification cartSpecifications;
  PlatformMediumModel? shopImage;
  PlatformMediumModel? faderImage;
  PlatformMediumModel? cartImage;
  PlatformMediumModel? payImage;
  PlatformMediumModel? orderImage;
  PlatformMediumModel? payConfirmationImage;

  ShopParameters({
    required this.shopSpecifications,
    required this.cartSpecifications,
    required this.shopAsCart,
  }) {}
}
