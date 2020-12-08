/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';

abstract class PayListEvent extends Equatable {
  const PayListEvent();
  @override
  List<Object> get props => [];
}

class LoadPayList extends PayListEvent {
  final String orderBy;
  final bool descending;

  LoadPayList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadPayListWithDetails extends PayListEvent {}

class AddPayList extends PayListEvent {
  final PayModel value;

  const AddPayList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddPayList{ value: $value }';
}

class UpdatePayList extends PayListEvent {
  final PayModel value;

  const UpdatePayList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdatePayList{ value: $value }';
}

class DeletePayList extends PayListEvent {
  final PayModel value;

  const DeletePayList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeletePayList{ value: $value }';
}

class PayListUpdated extends PayListEvent {
  final List<PayModel> value;

  const PayListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'PayListUpdated{ value: $value }';
}

