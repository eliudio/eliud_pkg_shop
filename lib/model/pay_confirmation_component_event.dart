/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';

/*
 * PayConfirmationComponentEvent is the base class for events to be used with constructing a PayConfirmationComponentBloc 
 */
abstract class PayConfirmationComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchPayConfirmationComponent is the event to instruct the bloc to fetch the component
 */
class FetchPayConfirmationComponent extends PayConfirmationComponentEvent {
  final String? id;

  /*
   * Construct the FetchPayConfirmationComponent
   */
  FetchPayConfirmationComponent({this.id});
}

/*
 * PayConfirmationComponentUpdated is the event to inform the bloc that a component has been updated
 */
class PayConfirmationComponentUpdated extends PayConfirmationComponentEvent {
  final PayConfirmationModel value;

  /*
   * Construct the PayConfirmationComponentUpdated
   */
  PayConfirmationComponentUpdated({required this.value});
}
