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

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProduct extends ProductEvent {
  final String id;

  FetchProduct({ this.id });
}

