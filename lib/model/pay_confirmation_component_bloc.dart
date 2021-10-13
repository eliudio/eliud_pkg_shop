/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component_event.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component_state.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';
import 'package:flutter/services.dart';


class PayConfirmationComponentBloc extends Bloc<PayConfirmationComponentEvent, PayConfirmationComponentState> {
  final PayConfirmationRepository? payConfirmationRepository;
  StreamSubscription? _payConfirmationSubscription;

  Stream<PayConfirmationComponentState> _mapLoadPayConfirmationComponentUpdateToState(String documentId) async* {
    _payConfirmationSubscription?.cancel();
    _payConfirmationSubscription = payConfirmationRepository!.listenTo(documentId, (value) {
      if (value != null) add(PayConfirmationComponentUpdated(value: value!));
    });
  }

  PayConfirmationComponentBloc({ this.payConfirmationRepository }): super(PayConfirmationComponentUninitialized());

  @override
  Stream<PayConfirmationComponentState> mapEventToState(PayConfirmationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPayConfirmationComponent) {
      yield* _mapLoadPayConfirmationComponentUpdateToState(event.id!);
    } else if (event is PayConfirmationComponentUpdated) {
      yield PayConfirmationComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _payConfirmationSubscription?.cancel();
    return super.close();
  }

}

