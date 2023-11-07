/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';

abstract class CartComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCartComponent extends CartComponentEvent {
  final String? id;

  FetchCartComponent({this.id});
}

class CartComponentUpdated extends CartComponentEvent {
  final CartModel value;

  CartComponentUpdated({required this.value});
}
