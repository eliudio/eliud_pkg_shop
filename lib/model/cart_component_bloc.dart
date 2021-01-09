/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:eliud_pkg_shop/model/cart_component_event.dart';
import 'package:eliud_pkg_shop/model/cart_component_state.dart';
import 'package:eliud_pkg_shop/model/cart_repository.dart';
import 'package:flutter/services.dart';


class CartComponentBloc extends Bloc<CartComponentEvent, CartComponentState> {
  final CartRepository cartRepository;

  CartComponentBloc({ this.cartRepository }): super(CartComponentUninitialized());
  @override
  Stream<CartComponentState> mapEventToState(CartComponentEvent event) async* {
    final currentState = state;
    if (event is FetchCartComponent) {
      try {
        if (currentState is CartComponentUninitialized) {
          bool permissionDenied = false;
          final model = await cartRepository.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield CartComponentPermissionDenied();
          } else {
            if (model != null) {
              yield CartComponentLoaded(value: model);
            } else {
              String id = event.id;
              yield CartComponentError(
                  message: "Cart with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield CartComponentError(message: "Unknown error whilst retrieving Cart");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

