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

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCart extends CartEvent {
  final String id;

  FetchCart({ this.id });
}

