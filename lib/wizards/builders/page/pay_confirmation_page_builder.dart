import 'package:eliud_core/core/wizards/tools/document_identifier.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/pay_confirmation_component.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:eliud_pkg_shop/wizards/builders/page/shop_page_builder.dart';
import 'abstract_page_template.dart';

class PayConfirmationPageBuilder extends AbstractPageTemplate {
  final BackgroundModel? background;
  final ShopModel? shop;

  static const String thePageId = 'shop-payconfirmation';

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
          thePageId,
          app,
          memberId,
          theHomeMenu,
          theAppBar,
          leftDrawer,
          rightDrawer,
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple,
          packageCondition: ShopPackage.conditionCartsHasItems,
        );

  static ActionModel action(AppModel app, String uniqueId) => GotoPage(app,
      pageID: constructDocumentId(uniqueId: uniqueId, documentId: thePageId),
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.noPrivilegeRequired,
        packageCondition: ShopPackage.conditionCartsHasItems,
      ));

  PayConfirmationModel _payConfirmationModel() {
    return PayConfirmationModel(
      documentID: constructDocumentId(
          uniqueId: uniqueId, documentId: 'payconfirmation'),
      appId: app.documentID,
      description: pageTitle(),
      shop: shop,
      backToShopAction: GotoPage(app,
          pageID: constructDocumentId(
              uniqueId: uniqueId, documentId: ShopPageBuilder.thePageId)),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
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
