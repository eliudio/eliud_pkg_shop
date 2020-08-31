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

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({ this.cartRepository }): super(CartUninitialized());
  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    final currentState = state;
    if (event is FetchCart) {
      try {
        if (currentState is CartUninitialized) {
          final CartModel model = await _fetchCart(event.id);

          if (model != null) {
            yield CartLoaded(value: model);
          } else {
            String id = event.id;
            yield CartError(message: "Cart with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield CartError(message: "Unknown error whilst retrieving Cart");
      }
    }
  }

  Future<CartModel> _fetchCart(String id) async {
    return cartRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


