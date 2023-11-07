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

import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'PayListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is PayListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class PayNotLoaded extends PayListState {}
