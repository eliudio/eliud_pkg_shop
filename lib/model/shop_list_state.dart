/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';

abstract class ShopListState extends Equatable {
  const ShopListState();

  @override
  List<Object?> get props => [];
}

class ShopListLoading extends ShopListState {}

class ShopListLoaded extends ShopListState {
  final List<ShopModel?>? values;
  final bool? mightHaveMore;

  const ShopListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'ShopListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is ShopListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class ShopNotLoaded extends ShopListState {}

