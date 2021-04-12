/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/pay_model.dart';
import 'package:eliud_pkg_shop/model/pay_component_event.dart';
import 'package:eliud_pkg_shop/model/pay_component_state.dart';
import 'package:eliud_pkg_shop/model/pay_repository.dart';
import 'package:flutter/services.dart';


class PayComponentBloc extends Bloc<PayComponentEvent, PayComponentState> {
  final PayRepository? payRepository;

  PayComponentBloc({ this.payRepository }): super(PayComponentUninitialized());
  @override
  Stream<PayComponentState> mapEventToState(PayComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPayComponent) {
      try {
        if (currentState is PayComponentUninitialized) {
          bool permissionDenied = false;
          final model = await payRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield PayComponentPermissionDenied();
          } else {
            if (model != null) {
              yield PayComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield PayComponentError(
                  message: "Pay with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield PayComponentError(message: "Unknown error whilst retrieving Pay");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

