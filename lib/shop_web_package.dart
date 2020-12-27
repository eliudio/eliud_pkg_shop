import 'package:eliud_pkg_shop/shop_package.dart';

import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/js_repository_singleton.dart';

class ShopWebPackage extends ShopPackage {
  @override
  void init() {
    AbstractRepositorySingleton.singleton = JsRepositorySingleton();
    super.init();
  }
}
