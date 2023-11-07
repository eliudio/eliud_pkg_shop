/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';

abstract class OrderOverviewComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchOrderOverviewComponent extends OrderOverviewComponentEvent {
  final String? id;

  FetchOrderOverviewComponent({this.id});
}

class OrderOverviewComponentUpdated extends OrderOverviewComponentEvent {
  final OrderOverviewModel value;

  OrderOverviewComponentUpdated({required this.value});
}
