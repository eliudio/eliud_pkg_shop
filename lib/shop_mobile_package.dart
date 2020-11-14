import 'package:eliud_pkg_shop/platform/mobile_payment_platform.dart';
import 'package:eliud_pkg_shop/shop_package.dart';

import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_singleton.dart';
import 'platform/payment_platform.dart';

class ShopMobilePackage extends ShopPackage {
  @override
  void init() {
    AbstractPaymentPlatform.platform = MobilePaymentPlatform();
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    super.init();
  }
}
