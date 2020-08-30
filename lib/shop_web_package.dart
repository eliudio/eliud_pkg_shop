import 'package:eliud_pkg_shop/shop_package.dart';

import 'model/abstract_repository_singleton.dart';
import 'model/js_repository_singleton.dart';
import 'platform/payment_platform.dart';
import 'platform/web.dart';

abstract class ShopWebPlugin extends ShopPlugin {
  @override
  void init() {
    AbstractPaymentPlatform.platform = WebPaymentPlatform();
    super.init();
  }

  @override
  void initRepository(String appID) {
    AbstractRepositorySingleton.singleton = JsRepositorySingleton(appID);
  }
}
