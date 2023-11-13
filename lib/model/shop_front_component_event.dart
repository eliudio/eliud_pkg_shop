/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';

/*
 * ShopFrontComponentEvent is the base class for events to be used with constructing a ShopFrontComponentBloc 
 */
abstract class ShopFrontComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchShopFrontComponent is the event to instruct the bloc to fetch the component
 */
class FetchShopFrontComponent extends ShopFrontComponentEvent {
  final String? id;

  /*
   * Construct the FetchShopFrontComponent
   */
  FetchShopFrontComponent({this.id});
}

/*
 * ShopFrontComponentUpdated is the event to inform the bloc that a component has been updated
 */
class ShopFrontComponentUpdated extends ShopFrontComponentEvent {
  final ShopFrontModel value;

  /*
   * Construct the ShopFrontComponentUpdated
   */
  ShopFrontComponentUpdated({required this.value});
}
