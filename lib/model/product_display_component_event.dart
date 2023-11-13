/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';

/*
 * ProductDisplayComponentEvent is the base class for events to be used with constructing a ProductDisplayComponentBloc 
 */
abstract class ProductDisplayComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchProductDisplayComponent is the event to instruct the bloc to fetch the component
 */
class FetchProductDisplayComponent extends ProductDisplayComponentEvent {
  final String? id;

  /*
   * Construct the FetchProductDisplayComponent
   */
  FetchProductDisplayComponent({this.id});
}

/*
 * ProductDisplayComponentUpdated is the event to inform the bloc that a component has been updated
 */
class ProductDisplayComponentUpdated extends ProductDisplayComponentEvent {
  final ProductDisplayModel value;

  /*
   * Construct the ProductDisplayComponentUpdated
   */
  ProductDisplayComponentUpdated({required this.value});
}
