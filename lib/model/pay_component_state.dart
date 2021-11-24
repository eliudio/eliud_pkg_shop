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

abstract class PayComponentState extends Equatable {
  const PayComponentState();

  @override
  List<Object?> get props => [];
}

class PayComponentUninitialized extends PayComponentState {}

class PayComponentError extends PayComponentState {
  final String? message;
  PayComponentError({ this.message });
}

class PayComponentPermissionDenied extends PayComponentState {
  PayComponentPermissionDenied();
}

class PayComponentLoaded extends PayComponentState {
  final PayModel value;

  const PayComponentLoaded({ required this.value });

  PayComponentLoaded copyWith({ PayModel? copyThis }) {
    return PayComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PayComponentLoaded { value: $value }';
}

