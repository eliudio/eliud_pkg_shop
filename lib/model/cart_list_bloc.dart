/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/cart_repository.dart';
import 'package:eliud_pkg_shop/model/cart_list_event.dart';
import 'package:eliud_pkg_shop/model/cart_list_state.dart';


class CartListBloc extends Bloc<CartListEvent, CartListState> {
  final CartRepository _cartRepository;
  StreamSubscription _cartsListSubscription;

  CartListBloc({ @required CartRepository cartRepository })
      : assert(cartRepository != null),
      _cartRepository = cartRepository,
      super(CartListLoading());

  Stream<CartListState> _mapLoadCartListToState() async* {
    _cartsListSubscription?.cancel();
    _cartsListSubscription = _cartRepository.listen( (list) => add(CartListUpdated(value: list)));
  }

  Stream<CartListState> _mapLoadCartListWithDetailsToState() async* {
    _cartsListSubscription?.cancel();
    _cartsListSubscription = _cartRepository.listenWithDetails( (list) => add(CartListUpdated(value: list)));
  }

  Stream<CartListState> _mapAddCartListToState(AddCartList event) async* {
    _cartRepository.add(event.value);
  }

  Stream<CartListState> _mapUpdateCartListToState(UpdateCartList event) async* {
    _cartRepository.update(event.value);
  }

  Stream<CartListState> _mapDeleteCartListToState(DeleteCartList event) async* {
    _cartRepository.delete(event.value);
  }

  Stream<CartListState> _mapCartListUpdatedToState(CartListUpdated event) async* {
    yield CartListLoaded(values: event.value);
  }


  @override
  Stream<CartListState> mapEventToState(CartListEvent event) async* {
    final currentState = state;
    if (event is LoadCartList) {
      yield* _mapLoadCartListToState();
    } if (event is LoadCartListWithDetails) {
      yield* _mapLoadCartListWithDetailsToState();
    } else if (event is AddCartList) {
      yield* _mapAddCartListToState(event);
    } else if (event is UpdateCartList) {
      yield* _mapUpdateCartListToState(event);
    } else if (event is DeleteCartList) {
      yield* _mapDeleteCartListToState(event);
    } else if (event is CartListUpdated) {
      yield* _mapCartListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _cartsListSubscription?.cancel();
    return super.close();
  }

}


