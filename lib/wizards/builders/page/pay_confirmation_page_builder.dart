import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
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
    String uniqueId,
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
    this.shop,
    this.background,
  ) : super(
          uniqueId,
          PAGE_ID,
          app,
          memberId,
          theHomeMenu,
          theAppBar,
          leftDrawer,
          rightDrawer,
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple,
          packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
        );

  static ActionModel action(AppModel app, String uniqueId) => GotoPage(app,
      pageID: constructDocumentId(uniqueId: uniqueId, documentId: PAGE_ID),
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
        packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
      ));

  PayConfirmationModel _payConfirmationModel() {
    return PayConfirmationModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: 'payconfirmation'),
      appId: app.documentID,
      description: pageTitle(),
      shop: shop,
      backToShopAction: GotoPage(app, pageID: constructDocumentId(uniqueId: uniqueId, documentId: ShopPageBuilder.PAGE_ID)),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Success';

  @override
  String pageDescription() => 'Success page';

  @override
  String componentName() => AbstractPayConfirmationComponent.componentName;

  @override
  String? componentID() {
    return _payConfirmationModel().documentID;
  }

  @override
  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton
        .payConfirmationRepository(app.documentID)!
        .add(_payConfirmationModel());
  }

}
