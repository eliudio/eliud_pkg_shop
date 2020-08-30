import 'package:eliud_pkg_shop/platform/mobile_payment_platform.dart';
import 'package:eliud_pkg_shop/shop_package.dart';

import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';
import 'platform/payment_platform.dart';

class ShopMobilePlugin extends ShopPlugin {
  @override
  void init() {
    AbstractPaymentPlatform.platform = MobilePaymentPlatform();
    super.init();
  }

  @override
  void initRepository(String appID) {
    AbstractRepositorySingleton.singleton = RepositorySingleton(appID);
  }
}
