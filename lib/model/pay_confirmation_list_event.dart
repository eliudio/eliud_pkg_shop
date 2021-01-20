/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';

abstract class PayConfirmationListEvent extends Equatable {
  const PayConfirmationListEvent();
  @override
  List<Object> get props => [];
}

class LoadPayConfirmationList extends PayConfirmationListEvent {}

class NewPage extends PayConfirmationListEvent {}

class AddPayConfirmationList extends PayConfirmationListEvent {
  final PayConfirmationModel value;

  const AddPayConfirmationList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddPayConfirmationList{ value: $value }';
}

class UpdatePayConfirmationList extends PayConfirmationListEvent {
  final PayConfirmationModel value;

  const UpdatePayConfirmationList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdatePayConfirmationList{ value: $value }';
}

class DeletePayConfirmationList extends PayConfirmationListEvent {
  final PayConfirmationModel value;

  const DeletePayConfirmationList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeletePayConfirmationList{ value: $value }';
}

class PayConfirmationListUpdated extends PayConfirmationListEvent {
  final List<PayConfirmationModel> value;
  final bool mightHaveMore;

  const PayConfirmationListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'PayConfirmationListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

