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

/*
 * OrderComponentEvent is the base class for events to be used with constructing a OrderComponentBloc 
 */
abstract class OrderComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchOrderComponent is the event to instruct the bloc to fetch the component
 */
class FetchOrderComponent extends OrderComponentEvent {
  final String? id;

  /*
   * Construct the FetchOrderComponent
   */
  FetchOrderComponent({this.id});
}

/*
 * OrderComponentUpdated is the event to inform the bloc that a component has been updated
 */
class OrderComponentUpdated extends OrderComponentEvent {
  final OrderModel value;

  /*
   * Construct the OrderComponentUpdated
   */
  OrderComponentUpdated({required this.value});
}
