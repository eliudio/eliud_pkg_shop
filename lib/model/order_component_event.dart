/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';

abstract class OrderComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchOrderComponent extends OrderComponentEvent {
  final String? id;

  FetchOrderComponent({ this.id });
}

class OrderComponentUpdated extends OrderComponentEvent {
  final OrderModel value;

  OrderComponentUpdated({ required this.value });
}


