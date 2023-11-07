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

import 'package:eliud_pkg_shop/model/cart_component_event.dart';
import 'package:eliud_pkg_shop/model/cart_component_state.dart';
import 'package:eliud_pkg_shop/model/cart_repository.dart';

class CartComponentBloc extends Bloc<CartComponentEvent, CartComponentState> {
  final CartRepository? cartRepository;
  StreamSubscription? _cartSubscription;

  void _mapLoadCartComponentUpdateToState(String documentId) {
    _cartSubscription?.cancel();
    _cartSubscription = cartRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(CartComponentUpdated(value: value));
      }
    });
  }

  CartComponentBloc({this.cartRepository})
      : super(CartComponentUninitialized()) {
    on<FetchCartComponent>((event, emit) {
      _mapLoadCartComponentUpdateToState(event.id!);
    });
    on<CartComponentUpdated>((event, emit) {
      emit(CartComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
