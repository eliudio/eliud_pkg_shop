/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class ProductComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProductComponent extends ProductComponentEvent {
  final String id;

  FetchProductComponent({ this.id });
}

