/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';

abstract class ShopFrontListState extends Equatable {
  const ShopFrontListState();

  @override
  List<Object> get props => [];
}

class ShopFrontListLoading extends ShopFrontListState {}

class ShopFrontListLoaded extends ShopFrontListState {
  final List<ShopFrontModel> values;

  const ShopFrontListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'ShopFrontListLoaded { values: $values }';
}

class ShopFrontNotLoaded extends ShopFrontListState {}

