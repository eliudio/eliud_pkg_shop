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

/*
 * OrderOverviewComponentEvent is the base class for events to be used with constructing a OrderOverviewComponentBloc 
 */
abstract class OrderOverviewComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchOrderOverviewComponent is the event to instruct the bloc to fetch the component
 */
class FetchOrderOverviewComponent extends OrderOverviewComponentEvent {
  final String? id;

  /*
   * Construct the FetchOrderOverviewComponent
   */
  FetchOrderOverviewComponent({this.id});
}

/*
 * OrderOverviewComponentUpdated is the event to inform the bloc that a component has been updated
 */
class OrderOverviewComponentUpdated extends OrderOverviewComponentEvent {
  final OrderOverviewModel value;

  /*
   * Construct the OrderOverviewComponentUpdated
   */
  OrderOverviewComponentUpdated({required this.value});
}
