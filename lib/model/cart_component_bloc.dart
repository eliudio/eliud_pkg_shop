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
  final CartRepository? cartRepository;
  StreamSubscription? _cartSubscription;

  Stream<CartComponentState> _mapLoadCartComponentUpdateToState(String documentId) async* {
    _cartSubscription?.cancel();
    _cartSubscription = cartRepository!.listenTo(documentId, (value) {
      if (value != null) add(CartComponentUpdated(value: value));
    });
  }

  CartComponentBloc({ this.cartRepository }): super(CartComponentUninitialized());

  @override
  Stream<CartComponentState> mapEventToState(CartComponentEvent event) async* {
    final currentState = state;
    if (event is FetchCartComponent) {
      yield* _mapLoadCartComponentUpdateToState(event.id!);
    } else if (event is CartComponentUpdated) {
      yield CartComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }

}

