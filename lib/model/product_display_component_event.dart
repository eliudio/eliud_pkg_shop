/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';

abstract class ProductDisplayComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProductDisplayComponent extends ProductDisplayComponentEvent {
  final String? id;

  FetchProductDisplayComponent({ this.id });
}

class ProductDisplayComponentUpdated extends ProductDisplayComponentEvent {
  final ProductDisplayModel value;

  ProductDisplayComponentUpdated({ required this.value });
}


