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

import 'package:equatable/equatable.dart';
import 'shop_model.dart';

abstract class ShopListState extends Equatable {
  const ShopListState();

  @override
  List<Object> get props => [];
}

class ShopListLoading extends ShopListState {}

class ShopListLoaded extends ShopListState {
  final List<ShopModel> values;

  const ShopListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'ShopListLoaded { values: $values }';
}

class ShopNotLoaded extends ShopListState {}

