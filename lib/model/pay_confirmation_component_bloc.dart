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

class PayConfirmationComponentBloc extends Bloc<PayConfirmationComponentEvent, PayConfirmationComponentState> {
  final PayConfirmationRepository payConfirmationRepository;

  PayConfirmationComponentBloc({ this.payConfirmationRepository }): super(PayConfirmationComponentUninitialized());
  @override
  Stream<PayConfirmationComponentState> mapEventToState(PayConfirmationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPayConfirmationComponent) {
      try {
        if (currentState is PayConfirmationComponentUninitialized) {
          final PayConfirmationModel model = await _fetchPayConfirmation(event.id);

          if (model != null) {
            yield PayConfirmationComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield PayConfirmationComponentError(message: "PayConfirmation with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield PayConfirmationComponentError(message: "Unknown error whilst retrieving PayConfirmation");
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


