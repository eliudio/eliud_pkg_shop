import 'package:eliud_core_main/apis/action_api/actions/goto_page.dart';
import 'package:eliud_core_main/wizards/tools/document_identifier.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/pay_component.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:eliud_pkg_shop/wizards/workflows/payment_workflow_builder.dart';
import 'abstract_page_template.dart';
import 'pay_confirmation_page_builder.dart';

class PayPageBuilder extends AbstractPageTemplate {
  final BackgroundModel? background;
  final ShopModel? shop;
  final CartPaymentWorkflows? cartPaymentWorkflows;

  static const String thePageId = 'shop-pay';

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

  PayModel _payModel() {
    return PayModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: 'pay'),
      appId: app.documentID,
      description: pageTitle(),
      shop: shop,
      payAction: cartPaymentWorkflows != null
          ? getParameterAction(app, cartPaymentWorkflows!)
          : null,
      succeeded: GotoPage(app,
          pageID: constructDocumentId(
              uniqueId: uniqueId,
              documentId: PayConfirmationPageBuilder.thePageId)),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
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
