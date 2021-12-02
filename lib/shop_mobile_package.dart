import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:flutter/foundation.dart';

class ShopMobilePackage extends ShopPackage {

  @override
  List<Object?> get props => [
    stateCONDITION_CARTS_HAS_ITEMS,
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is ShopMobilePackage &&
              runtimeType == other.runtimeType &&
              mapEquals(stateCONDITION_CARTS_HAS_ITEMS, other.stateCONDITION_CARTS_HAS_ITEMS);

}
