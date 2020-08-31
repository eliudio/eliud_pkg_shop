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

abstract class PayState extends Equatable {
  const PayState();

  @override
  List<Object> get props => [];
}

class PayUninitialized extends PayState {}

class PayError extends PayState {
  final String message;
  PayError({ this.message });
}

class PayLoaded extends PayState {
  final PayModel value;

  const PayLoaded({ this.value });

  PayLoaded copyWith({ PayModel copyThis }) {
    return PayLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PayModelLoaded { value: $value }';
}


