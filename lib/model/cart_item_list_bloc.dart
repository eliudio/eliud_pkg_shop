/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/cart_item_repository.dart';
import 'package:eliud_pkg_shop/model/cart_item_list_event.dart';
import 'package:eliud_pkg_shop/model/cart_item_list_state.dart';


class CartItemListBloc extends Bloc<CartItemListEvent, CartItemListState> {
  final CartItemRepository _cartItemRepository;
  StreamSubscription _cartItemsListSubscription;

  CartItemListBloc({ @required CartItemRepository cartItemRepository })
      : assert(cartItemRepository != null),
      _cartItemRepository = cartItemRepository,
      super(CartItemListLoading());

  Stream<CartItemListState> _mapLoadCartItemListToState({ String orderBy, bool descending }) async* {
    _cartItemsListSubscription?.cancel();
    _cartItemsListSubscription = _cartItemRepository.listen( (list) => add(CartItemListUpdated(value: list)), orderBy: orderBy, descending: descending);
  }

  Stream<CartItemListState> _mapLoadCartItemListWithDetailsToState() async* {
    _cartItemsListSubscription?.cancel();
    _cartItemsListSubscription = _cartItemRepository.listenWithDetails( (list) => add(CartItemListUpdated(value: list)));
  }

  Stream<CartItemListState> _mapAddCartItemListToState(AddCartItemList event) async* {
    _cartItemRepository.add(event.value);
  }

  Stream<CartItemListState> _mapUpdateCartItemListToState(UpdateCartItemList event) async* {
    _cartItemRepository.update(event.value);
  }

  Stream<CartItemListState> _mapDeleteCartItemListToState(DeleteCartItemList event) async* {
    _cartItemRepository.delete(event.value);
  }

  Stream<CartItemListState> _mapCartItemListUpdatedToState(CartItemListUpdated event) async* {
    yield CartItemListLoaded(values: event.value);
  }


  @override
  Stream<CartItemListState> mapEventToState(CartItemListEvent event) async* {
    final currentState = state;
    if (event is LoadCartItemList) {
      yield* _mapLoadCartItemListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadCartItemListWithDetails) {
      yield* _mapLoadCartItemListWithDetailsToState();
    } else if (event is AddCartItemList) {
      yield* _mapAddCartItemListToState(event);
    } else if (event is UpdateCartItemList) {
      yield* _mapUpdateCartItemListToState(event);
    } else if (event is DeleteCartItemList) {
      yield* _mapDeleteCartItemListToState(event);
    } else if (event is CartItemListUpdated) {
      yield* _mapCartItemListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _cartItemsListSubscription?.cancel();
    return super.close();
  }

}


