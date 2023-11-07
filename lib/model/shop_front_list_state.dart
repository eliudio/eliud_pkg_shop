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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';

abstract class ShopFrontListState extends Equatable {
  const ShopFrontListState();

  @override
  List<Object?> get props => [];
}

class ShopFrontListLoading extends ShopFrontListState {}

class ShopFrontListLoaded extends ShopFrontListState {
  final List<ShopFrontModel?>? values;
  final bool? mightHaveMore;

  const ShopFrontListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'ShopFrontListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is ShopFrontListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class ShopFrontNotLoaded extends ShopFrontListState {}
