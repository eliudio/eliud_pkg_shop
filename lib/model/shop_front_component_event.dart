/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';

abstract class ShopFrontComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchShopFrontComponent extends ShopFrontComponentEvent {
  final String? id;

  FetchShopFrontComponent({this.id});
}

class ShopFrontComponentUpdated extends ShopFrontComponentEvent {
  final ShopFrontModel value;

  ShopFrontComponentUpdated({required this.value});
}
