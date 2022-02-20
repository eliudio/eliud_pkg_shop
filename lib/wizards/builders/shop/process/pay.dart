import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/pay_component.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:eliud_pkg_shop/wizards/builders/shop/process/payconfirmation.dart';

class MyPay extends PageBuilder {
  final BackgroundModel? background;
  final ShopModel? shop;

  static const String identifier = 'juuwlepay';

  MyPay(
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
      pageID: MyPay.identifier,
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
      payAction: WorkflowSetup.payCart(),
      succeeded: GotoPage(app,
          pageID: MyPayConfirmation.identifier),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Payment';

  @override
  String componentName() => AbstractPayComponent.componentName;

  @override
  String? componentID() {
    return _payModel().documentID;
  }

  @override
  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton
        .payRepository(app.documentID!)!
        .add(_payModel());
  }

  @override
  String assetLocation() =>
      'packages/eliud_pkg_shop/assets/juuwle_app/decorating/charlotte_with_credit_card.png';
}
