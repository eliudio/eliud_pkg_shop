import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ShopDashboardBaseState extends Equatable {
  const ShopDashboardBaseState();

  @override
  List<Object?> get props => [];
}

class ShopDashboardUninitialised extends ShopDashboardBaseState {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ShopDashboardUninitialised;

  @override
  int get hashCode => 0;
}

class ShopDashboardInitialised extends ShopDashboardBaseState {
  final ShopModel shop;
  final List<ProductModel>? values;

  const ShopDashboardInitialised({required this.shop, this.values});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopDashboardInitialised &&
          shop == other.shop &&
          ListEquality().equals(values, other.values);

  @override
  int get hashCode => shop.hashCode ^ values.hashCode;
}

class ShopDashboardLoaded extends ShopDashboardInitialised {
  ShopDashboardLoaded({required super.shop, super.values});
}

class ShopDashboardError extends ShopDashboardInitialised {
  final String error;

  ShopDashboardError(
      {required this.error,
      required super.shop,
      required List<ProductModel> super.values});
}
