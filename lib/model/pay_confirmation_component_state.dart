/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';

/* 
 * PayConfirmationComponentState is the base class for state for PayConfirmationComponentBloc
 */
abstract class PayConfirmationComponentState extends Equatable {
  const PayConfirmationComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * PayConfirmationComponentUninitialized is the uninitialized state of the PayConfirmationComponentBloc 
 */
class PayConfirmationComponentUninitialized
    extends PayConfirmationComponentState {}

/* 
 * PayConfirmationComponentError is the error state of the PayConfirmationComponentBloc 
 */
class PayConfirmationComponentError extends PayConfirmationComponentState {
  final String? message;
  PayConfirmationComponentError({this.message});
}

/* 
 * PayConfirmationComponentPermissionDenied is to indicate permission denied state of the PayConfirmationComponentBloc 
 */
class PayConfirmationComponentPermissionDenied
    extends PayConfirmationComponentState {
  PayConfirmationComponentPermissionDenied();
}

/* 
 * PayConfirmationComponentLoaded is used to set the state of the PayConfirmationComponentBloc to the loaded state
 */
class PayConfirmationComponentLoaded extends PayConfirmationComponentState {
  final PayConfirmationModel value;

  /* 
   * construct PayConfirmationComponentLoaded
   */
  const PayConfirmationComponentLoaded({required this.value});

  /* 
   * copy method
   */
  PayConfirmationComponentLoaded copyWith({PayConfirmationModel? copyThis}) {
    return PayConfirmationComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PayConfirmationComponentLoaded { value: $value }';
}
