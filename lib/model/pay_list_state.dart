/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';

abstract class PayListState extends Equatable {
  const PayListState();

  @override
  List<Object?> get props => [];
}

class PayListLoading extends PayListState {}

class PayListLoaded extends PayListState {
  final List<PayModel?>? values;
  final bool? mightHaveMore;

  const PayListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'PayListLoaded { values: $values }';
}

class PayNotLoaded extends PayListState {}

