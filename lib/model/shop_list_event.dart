/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'shop_model.dart';

abstract class ShopListEvent extends Equatable {
  const ShopListEvent();
  @override
  List<Object> get props => [];
}

class LoadShopList extends ShopListEvent {}
class LoadShopListWithDetails extends ShopListEvent {}

class AddShopList extends ShopListEvent {
  final ShopModel value;

  const AddShopList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddShopList{ value: $value }';
}

class UpdateShopList extends ShopListEvent {
  final ShopModel value;

  const UpdateShopList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateShopList{ value: $value }';
}

class DeleteShopList extends ShopListEvent {
  final ShopModel value;

  const DeleteShopList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteShopList{ value: $value }';
}

class ShopListUpdated extends ShopListEvent {
  final List<ShopModel> value;

  const ShopListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ShopListUpdated{ value: $value }';
}

