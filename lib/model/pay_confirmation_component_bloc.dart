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

  PayConfirmationComponentBloc({ this.payConfirmationRepository }): super(PayConfirmationComponentUninitialized());
  @override
  Stream<PayConfirmationComponentState> mapEventToState(PayConfirmationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPayConfirmationComponent) {
      try {
        if (currentState is PayConfirmationComponentUninitialized) {
          bool permissionDenied = false;
          final model = await payConfirmationRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield PayConfirmationComponentPermissionDenied();
          } else {
            if (model != null) {
              yield PayConfirmationComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield PayConfirmationComponentError(
                  message: "PayConfirmation with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield PayConfirmationComponentError(message: "Unknown error whilst retrieving PayConfirmation");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

