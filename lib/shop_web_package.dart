import 'package:eliud_pkg_shop/shop_package.dart';

import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/js_repository_singleton.dart';
import 'package:eliud_pkg_shop/platform/payment_platform.dart';
import 'package:eliud_pkg_shop/platform/web.dart';

class ShopWebPackage extends ShopPackage {
  @override
  void init() {
    AbstractPaymentPlatform.platform = WebPaymentPlatform();
    AbstractRepositorySingleton.singleton = JsRepositorySingleton();
    super.init();
  }
}
