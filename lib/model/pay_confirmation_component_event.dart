/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';

abstract class PayConfirmationComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPayConfirmationComponent extends PayConfirmationComponentEvent {
  final String? id;

  FetchPayConfirmationComponent({ this.id });
}

class PayConfirmationComponentUpdated extends PayConfirmationComponentEvent {
  final PayConfirmationModel value;

  PayConfirmationComponentUpdated({ required this.value });
}


