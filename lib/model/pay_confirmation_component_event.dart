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

abstract class PayConfirmationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPayConfirmation extends PayConfirmationEvent {
  final String id;

  FetchPayConfirmation({ this.id });
}

