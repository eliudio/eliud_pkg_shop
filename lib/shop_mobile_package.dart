import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:flutter/foundation.dart';

ShopPackage getShopPackage() => ShopMobilePackage();

class ShopMobilePackage extends ShopPackage {
  @override
  List<Object?> get props => [
        stateConditionCartsHasItems,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopMobilePackage &&
          runtimeType == other.runtimeType &&
          mapEquals(
              stateConditionCartsHasItems, other.stateConditionCartsHasItems);

  @override
  int get hashCode =>
      stateConditionCartsHasItems.hashCode ^ subscription.hashCode;
}
