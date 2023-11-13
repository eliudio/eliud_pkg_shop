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
import 'package:eliud_pkg_shop/model/cart_model.dart';

/*
 * CartComponentEvent is the base class for events to be used with constructing a CartComponentBloc 
 */
abstract class CartComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchCartComponent is the event to instruct the bloc to fetch the component
 */
class FetchCartComponent extends CartComponentEvent {
  final String? id;

  /*
   * Construct the FetchCartComponent
   */
  FetchCartComponent({this.id});
}

/*
 * CartComponentUpdated is the event to inform the bloc that a component has been updated
 */
class CartComponentUpdated extends CartComponentEvent {
  final CartModel value;

  /*
   * Construct the CartComponentUpdated
   */
  CartComponentUpdated({required this.value});
}
