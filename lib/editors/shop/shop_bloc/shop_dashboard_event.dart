import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:equatable/equatable.dart';

abstract class ShopDashboardBaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShopDashboardInitialise extends ShopDashboardBaseEvent {
  final ShopModel model;

  ShopDashboardInitialise(this.model);
}

class ProductListUpdated extends ShopDashboardBaseEvent {
  final List<ProductModel> values;

  ProductListUpdated(this.values);
}

class SelectForEditEvent extends ShopDashboardBaseEvent {
  final ProductModel item;

  SelectForEditEvent({required this.item});
}

class ShopDashboardApplyChanges extends ShopDashboardBaseEvent {
  final ShopModel model;

  ShopDashboardApplyChanges({required this.model});
}
