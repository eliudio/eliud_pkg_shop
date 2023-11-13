/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';

/*
 * PayComponentEvent is the base class for events to be used with constructing a PayComponentBloc 
 */
abstract class PayComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchPayComponent is the event to instruct the bloc to fetch the component
 */
class FetchPayComponent extends PayComponentEvent {
  final String? id;

  /*
   * Construct the FetchPayComponent
   */
  FetchPayComponent({this.id});
}

/*
 * PayComponentUpdated is the event to inform the bloc that a component has been updated
 */
class PayComponentUpdated extends PayComponentEvent {
  final PayModel value;

  /*
   * Construct the PayComponentUpdated
   */
  PayComponentUpdated({required this.value});
}
