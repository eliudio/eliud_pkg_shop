/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';

abstract class ShopFrontListEvent extends Equatable {
  const ShopFrontListEvent();
  @override
  List<Object?> get props => [];
}

class LoadShopFrontList extends ShopFrontListEvent {}

class NewPage extends ShopFrontListEvent {}

class AddShopFrontList extends ShopFrontListEvent {
  final ShopFrontModel? value;

  const AddShopFrontList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddShopFrontList{ value: $value }';
}

class UpdateShopFrontList extends ShopFrontListEvent {
  final ShopFrontModel? value;

  const UpdateShopFrontList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateShopFrontList{ value: $value }';
}

class DeleteShopFrontList extends ShopFrontListEvent {
  final ShopFrontModel? value;

  const DeleteShopFrontList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteShopFrontList{ value: $value }';
}

class ShopFrontListUpdated extends ShopFrontListEvent {
  final List<ShopFrontModel?>? value;
  final bool? mightHaveMore;

  const ShopFrontListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'ShopFrontListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class ShopFrontChangeQuery extends ShopFrontListEvent {
  final EliudQuery? newQuery;

  const ShopFrontChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'ShopFrontChangeQuery{ value: $newQuery }';
}
