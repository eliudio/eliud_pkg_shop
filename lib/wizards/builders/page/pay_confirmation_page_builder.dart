import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:eliud_pkg_shop/wizards/builders/page/shop_page_builder.dart';
import 'abstract_page_template.dart';

class PayConfirmationPageBuilder extends AbstractPageTemplate {
  final BackgroundModel? background;
  final ShopModel? shop;

  static const String PAGE_ID = 'shop-payconfirmation';

  PayConfirmationPageBuilder(
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
          packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
        );

  static ActionModel action(AppModel app) => GotoPage(app,
      pageID: PAGE_ID,
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
        packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
      ));

  PayConfirmationModel _payConfirmationModel() {
    return PayConfirmationModel(
      documentID: 'payconfirmation',
      appId: app.documentID!,
      title: pageTitle(),
      shop: shop,
      backToShopAction: GotoPage(app, pageID: ShopPageBuilder.PAGE_ID),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Success';

  @override
  String componentName() => AbstractPayConfirmationComponent.componentName;

  @override
  String? componentID() {
    return _payConfirmationModel().documentID;
  }

  @override
  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton
        .payConfirmationRepository(app.documentID!)!
        .add(_payConfirmationModel());
  }

  @override
  String assetLocation() =>
      'packages/eliud_pkg_shop/assets/shop/decorating/charlotte_with_credit_card.png';
}
