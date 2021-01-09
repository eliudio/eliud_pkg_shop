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

abstract class PayConfirmationComponentState extends Equatable {
  const PayConfirmationComponentState();

  @override
  List<Object> get props => [];
}

class PayConfirmationComponentUninitialized extends PayConfirmationComponentState {}

class PayConfirmationComponentError extends PayConfirmationComponentState {
  final String message;
  PayConfirmationComponentError({ this.message });
}

class PayConfirmationComponentPermissionDenied extends PayConfirmationComponentState {
  PayConfirmationComponentPermissionDenied();
}

class PayConfirmationComponentLoaded extends PayConfirmationComponentState {
  final PayConfirmationModel value;

  const PayConfirmationComponentLoaded({ this.value });

  PayConfirmationComponentLoaded copyWith({ PayConfirmationModel copyThis }) {
    return PayConfirmationComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PayConfirmationComponentLoaded { value: $value }';
}

