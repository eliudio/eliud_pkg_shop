import 'package:eliud_core_main/apis/action_api/actions/goto_page.dart';
import 'package:eliud_core_main/wizards/tools/document_identifier.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/product_display_component.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'absract_basic_page_template.dart';
import 'cart_page_builder.dart';

class ProductPageBuilder extends AbstractBasicPageTemplate {
  final ShopModel? shop;

  static String thePageId = 'shop-product';

  ProductPageBuilder(
    String uniqueId,
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
    this.shop,
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
        );

  static ActionModel action(AppModel app, String uniqueId) => GotoPage(app,
      pageID: constructDocumentId(uniqueId: uniqueId, documentId: thePageId),
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.noPrivilegeRequired,
        packageCondition: ShopPackage.conditionCartsHasItems,
      ));

  ProductDisplayModel _productDisplayOverview() {
    return ProductDisplayModel(
      documentID:
          constructDocumentId(uniqueId: uniqueId, documentId: 'product'),
      appId: app.documentID,
      description: pageTitle(),
      shop: shop,
      buyAction: CartPageBuilder.openCartPage(app, uniqueId),
      itemDetailBackground: null,
      addToBasketText: 'Add to basket',
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Product';

  @override
  String pageDescription() => 'Product page';

  @override
  String componentName() => AbstractProductDisplayComponent.componentName;

  @override
  String? componentID() {
    return _productDisplayOverview().documentID;
  }

  @override
  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton
        .productDisplayRepository(app.documentID)!
        .add(_productDisplayOverview());
  }
}
