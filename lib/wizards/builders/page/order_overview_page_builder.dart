import 'package:eliud_core_main/model/app_bar_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/drawer_model.dart';
import 'package:eliud_core_main/model/home_menu_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_main/wizards/tools/document_identifier.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/order_overview_component.dart';
import 'abstract_page_template.dart';

class OrderOverviewPageBuilder extends AbstractPageTemplate {
  final BackgroundModel? background;
  final ShopModel? shop;

  static String thePageId = 'shop-orders-${newRandomKey()}';

  OrderOverviewModel _orderOverview() {
    return OrderOverviewModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: 'orders'),
      appId: app.documentID,
      description: pageTitle(),
      shop: shop,
      itemImageBackground: null,
      itemDetailBackground: background,
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Your Orders';

  @override
  String pageDescription() => 'Your Orders Page';

  @override
  String componentName() => AbstractOrderOverviewComponent.componentName;

  OrderOverviewPageBuilder(
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
        );

  @override
  String? componentID() {
    return _orderOverview().documentID;
  }

  @override
  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton
        .orderOverviewRepository(app.documentID)!
        .add(_orderOverview());
  }
}
