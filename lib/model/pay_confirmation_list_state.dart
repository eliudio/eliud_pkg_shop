/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'pay_confirmation_model.dart';

abstract class PayConfirmationListState extends Equatable {
  const PayConfirmationListState();

  @override
  List<Object> get props => [];
}

class PayConfirmationListLoading extends PayConfirmationListState {}

class PayConfirmationListLoaded extends PayConfirmationListState {
  final List<PayConfirmationModel> values;

  const PayConfirmationListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'PayConfirmationListLoaded { values: $values }';
}

class PayConfirmationNotLoaded extends PayConfirmationListState {}

