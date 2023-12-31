import 'package:eliud_core_main/apis/wizard_api/action_specification.dart';
import 'package:eliud_core_main/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/decoration_color_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/model/menu_item_model.dart';
import 'package:eliud_core_main/model/platform_medium_model.dart';
import 'package:eliud_core_main/model/public_medium_model.dart';
import 'package:eliud_core_main/apis/style/_default/tools/colors.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_pkg_shop/wizards/builders/page/pay_confirmation_page_builder.dart';
import 'package:eliud_pkg_shop/wizards/payment_workflow_wizard.dart';
import 'package:eliud_pkg_shop/wizards/workflows/payment_workflow_builder.dart';
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
  String getPackageName() => "eliud_pkg_shop";

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
      paymentParameters: PaymentWorkflowWizard.defaultParameters());

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
  ) {
    if (parameters is ShopParameters) {
      var memberId = member.documentID;
      var tasks = <NewAppTask>[];

      tasks.add(() async {
        var cartPaymentWorkflows = await PaymentWorkflowBuilder(
          uniqueId,
          app.documentID,
          parameters: parameters.paymentParameters,
        ).create();
        parameters.paymentParameters
            .registerCartPaymentWorkflows(cartPaymentWorkflows);
        var shop = await ShopPageBuilder(
          uniqueId,
          app,
          memberId,
          homeMenuProvider(),
          appBarProvider(),
          leftDrawerProvider(),
          rightDrawerProvider(),
        ).create(parameters.shopImage, parameters.faderImage);
        await CartPageBuilder(
                uniqueId,
                app,
                memberId,
                homeMenuProvider(),
                appBarProvider(),
                leftDrawerProvider(),
                rightDrawerProvider(),
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
                shop,
                cardBG(),
                cartPaymentWorkflows)
            .create(parameters.payImage);
        await OrderOverviewPageBuilder(
                uniqueId,
                app,
                memberId,
                homeMenuProvider(),
                appBarProvider(),
                leftDrawerProvider(),
                rightDrawerProvider(),
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
                shop)
            .create();
      });

      return tasks;
    } else {
      throw Exception('Unexpected class for parameters: $parameters');
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
      beginGradientPosition: StartGradientPosition.centerLeft,
      endGradientPosition: EndGradientPosition.centerRight,
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
      throw Exception('Unexpected class for parameters: $parameters');
    }
  }

  @override
  Widget wizardParametersWidget(
      AppModel app, BuildContext context, NewAppWizardParameters parameters) {
    if (parameters is ShopParameters) {
      return ShopParametersWidget(
        app: app,
        parameters: parameters,
      );
    } else {
      return text(app, context, 'Unexpected class for parameters: $parameters');
    }
  }

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId,
          NewAppWizardParameters parameters, String mediumType) =>
      null;
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
  PaymentParameters paymentParameters;

  ShopParameters({
    required this.shopSpecifications,
    required this.cartSpecifications,
    required this.shopAsCart,
    required this.paymentParameters,
  });
}
