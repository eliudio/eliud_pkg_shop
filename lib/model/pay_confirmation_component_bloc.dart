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

class PayConfirmationBloc extends Bloc<PayConfirmationEvent, PayConfirmationState> {
  final PayConfirmationRepository payConfirmationRepository;

  PayConfirmationBloc({ this.payConfirmationRepository }): super(PayConfirmationUninitialized());
  @override
  Stream<PayConfirmationState> mapEventToState(PayConfirmationEvent event) async* {
    final currentState = state;
    if (event is FetchPayConfirmation) {
      try {
        if (currentState is PayConfirmationUninitialized) {
          final PayConfirmationModel model = await _fetchPayConfirmation(event.id);

          if (model != null) {
            yield PayConfirmationLoaded(value: model);
          } else {
            String id = event.id;
            yield PayConfirmationError(message: "PayConfirmation with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield PayConfirmationError(message: "Unknown error whilst retrieving PayConfirmation");
      }
    }
  }

  Future<PayConfirmationModel> _fetchPayConfirmation(String id) async {
    return payConfirmationRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


