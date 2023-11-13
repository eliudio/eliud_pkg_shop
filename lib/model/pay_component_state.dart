/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';

/* 
 * PayComponentState is the base class for state for PayComponentBloc
 */
abstract class PayComponentState extends Equatable {
  const PayComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * PayComponentUninitialized is the uninitialized state of the PayComponentBloc 
 */
class PayComponentUninitialized extends PayComponentState {}

/* 
 * PayComponentError is the error state of the PayComponentBloc 
 */
class PayComponentError extends PayComponentState {
  final String? message;
  PayComponentError({this.message});
}

/* 
 * PayComponentPermissionDenied is to indicate permission denied state of the PayComponentBloc 
 */
class PayComponentPermissionDenied extends PayComponentState {
  PayComponentPermissionDenied();
}

/* 
 * PayComponentLoaded is used to set the state of the PayComponentBloc to the loaded state
 */
class PayComponentLoaded extends PayComponentState {
  final PayModel value;

  /* 
   * construct PayComponentLoaded
   */
  const PayComponentLoaded({required this.value});

  /* 
   * copy method
   */
  PayComponentLoaded copyWith({PayModel? copyThis}) {
    return PayComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PayComponentLoaded { value: $value }';
}
