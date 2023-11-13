/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';

/* 
 * ProductDisplayComponentState is the base class for state for ProductDisplayComponentBloc
 */
abstract class ProductDisplayComponentState extends Equatable {
  const ProductDisplayComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * ProductDisplayComponentUninitialized is the uninitialized state of the ProductDisplayComponentBloc 
 */
class ProductDisplayComponentUninitialized
    extends ProductDisplayComponentState {}

/* 
 * ProductDisplayComponentError is the error state of the ProductDisplayComponentBloc 
 */
class ProductDisplayComponentError extends ProductDisplayComponentState {
  final String? message;
  ProductDisplayComponentError({this.message});
}

/* 
 * ProductDisplayComponentPermissionDenied is to indicate permission denied state of the ProductDisplayComponentBloc 
 */
class ProductDisplayComponentPermissionDenied
    extends ProductDisplayComponentState {
  ProductDisplayComponentPermissionDenied();
}

/* 
 * ProductDisplayComponentLoaded is used to set the state of the ProductDisplayComponentBloc to the loaded state
 */
class ProductDisplayComponentLoaded extends ProductDisplayComponentState {
  final ProductDisplayModel value;

  /* 
   * construct ProductDisplayComponentLoaded
   */
  const ProductDisplayComponentLoaded({required this.value});

  /* 
   * copy method
   */
  ProductDisplayComponentLoaded copyWith({ProductDisplayModel? copyThis}) {
    return ProductDisplayComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ProductDisplayComponentLoaded { value: $value }';
}
