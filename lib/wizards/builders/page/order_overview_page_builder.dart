import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_pkg_shop/model/order_overview_component.dart';

class OrderOverviewPageBuilder  extends PageBuilder {
  final BackgroundModel? background;
  final ShopModel? shop;

  static const String identifier = 'juuwleorders';

  OrderOverviewModel _orderOverview() {
    return OrderOverviewModel(
        documentID: 'orders',
        appId: app.documentID!,
        title: pageTitle(),
        shop: shop,
        itemImageBackground: null,
        itemDetailBackground: background,
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple
        ),
    );
  }

  String pageTitle() => 'Your Orders';

  String componentName() => AbstractOrderOverviewComponent.componentName;

  OrderOverviewPageBuilder(
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

  String? componentID() {
    return _orderOverview().documentID;
  }

  Future<void> setupComponent() async {
    await AbstractRepositorySingleton.singleton.orderOverviewRepository(app.documentID)!.add(_orderOverview());
  }

  String assetLocation() => 'packages/eliud_pkg_shop/assets/juuwle_app/decorating/charlotte_with_bags.png';
}
