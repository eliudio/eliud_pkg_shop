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
import 'pay_confirmation_model.dart';

abstract class PayConfirmationState extends Equatable {
  const PayConfirmationState();

  @override
  List<Object> get props => [];
}

class PayConfirmationUninitialized extends PayConfirmationState {}

class PayConfirmationError extends PayConfirmationState {
  final String message;
  PayConfirmationError({ this.message });
}

class PayConfirmationLoaded extends PayConfirmationState {
  final PayConfirmationModel value;

  const PayConfirmationLoaded({ this.value });

  PayConfirmationLoaded copyWith({ PayConfirmationModel copyThis }) {
    return PayConfirmationLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PayConfirmationModelLoaded { value: $value }';
}


