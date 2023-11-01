import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/pay_component.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:eliud_pkg_shop/wizards/workflows/payment_workflow_builder.dart';
import 'abstract_page_template.dart';
import 'pay_confirmation_page_builder.dart';

class PayPageBuilder extends AbstractPageTemplate {
  final BackgroundModel? background;
  final ShopModel? shop;
  final CartPaymentWorkflows? cartPaymentWorkflows;

  static const String PAGE_ID = 'shop-pay';

  PayPageBuilder(
    String uniqueId,
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
    this.shop,
    this.background,
    this.cartPaymentWorkflows,
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

  PayModel _payModel() {
    return PayModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: 'pay'),
      appId: app.documentID,
      description: pageTitle(),
      shop: shop,
      payAction: cartPaymentWorkflows != null ? getParameterAction(app, cartPaymentWorkflows!) : null,
      succeeded: GotoPage(app, pageID: constructDocumentId(uniqueId: uniqueId, documentId: PayConfirmationPageBuilder.PAGE_ID)),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Payment';

  @override
  String pageDescription() => 'Payment page';

  @override
  String componentName() => AbstractPayComponent.componentName;

  @override
  String? componentID() {
    return _payModel().documentID;
  }

  @override
  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton
        .payRepository(app.documentID)!
        .add(_payModel());
  }
}
