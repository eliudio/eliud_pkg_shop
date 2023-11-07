import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:flutter/foundation.dart';

ShopPackage getShopPackage() => ShopWebPackage();

class ShopWebPackage extends ShopPackage {
  @override
  List<Object?> get props => [
        stateConditionCartsHasItems,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopWebPackage &&
          runtimeType == other.runtimeType &&
          mapEquals(
              stateConditionCartsHasItems, other.stateConditionCartsHasItems);

  @override
  int get hashCode =>
      stateConditionCartsHasItems.hashCode ^ subscription.hashCode;
}
