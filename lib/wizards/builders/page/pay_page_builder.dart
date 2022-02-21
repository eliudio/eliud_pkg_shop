import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/pay_component.dart';
import 'package:eliud_pkg_shop/shop_package.dart';

import 'pay_confirmation_page_builder.dart';

class PayPageBuilder extends PageBuilder {
  final BackgroundModel? background;
  final ShopModel? shop;

  static const String identifier = 'juuwlepay';

  PayPageBuilder(
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

  static ActionModel action(AppModel app) => GotoPage(app,
      pageID: identifier,
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
        packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
      ));

  PayModel _payModel() {
    return PayModel(
      documentID: 'pay',
      appId: app.documentID!,
      title: pageTitle(),
      shop: shop,
      payAction: NewAppWizardRegistry.registry().getAction(app, 'payCart'),
      succeeded: GotoPage(app,
          pageID: PayConfirmationPageBuilder.identifier),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  String pageTitle() => 'Payment';

  String componentName() => AbstractPayComponent.componentName;

  String? componentID() {
    return _payModel().documentID;
  }

  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton
        .payRepository(app.documentID!)!
        .add(_payModel());
  }

  String assetLocation() =>
      'packages/eliud_pkg_shop/assets/juuwle_app/decorating/charlotte_with_credit_card.png';
}
