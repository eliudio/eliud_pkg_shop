import 'package:eliud_pkg_shop/shop_package.dart';

import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_singleton.dart';

class ShopMobilePackage extends ShopPackage {
  @override
  void init() {
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    super.init();
  }
}
