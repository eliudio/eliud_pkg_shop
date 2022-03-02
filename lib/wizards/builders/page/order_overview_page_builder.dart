import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/order_overview_component.dart';
import 'abstract_page_template.dart';

class OrderOverviewPageBuilder extends AbstractPageTemplate {
  final BackgroundModel? background;
  final ShopModel? shop;

  static String PAGE_ID = 'shop-orders-' + newRandomKey();

  OrderOverviewModel _orderOverview() {
    return OrderOverviewModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: 'orders'),
      appId: app.documentID!,
      title: pageTitle(),
      shop: shop,
      itemImageBackground: null,
      itemDetailBackground: background,
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  @override
  String pageTitle() => 'Your Orders';

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
    PageProvider pageProvider,
    ActionProvider actionProvider,
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
          pageProvider,
          actionProvider,
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple,
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
