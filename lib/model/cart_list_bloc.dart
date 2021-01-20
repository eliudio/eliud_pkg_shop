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
import 'package:eliud_core/tools/query/query_tools.dart';


const _cartLimit = 5;

class CartListBloc extends Bloc<CartListEvent, CartListState> {
  final CartRepository _cartRepository;
  StreamSubscription _cartsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  CartListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required CartRepository cartRepository})
      : assert(cartRepository != null),
        _cartRepository = cartRepository,
        super(CartListLoading());

  Stream<CartListState> _mapLoadCartListToState() async* {
    int amountNow =  (state is CartListLoaded) ? (state as CartListLoaded).values.length : 0;
    _cartsListSubscription?.cancel();
    _cartsListSubscription = _cartRepository.listen(
          (list) => add(CartListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _cartLimit : null
    );
  }

  Stream<CartListState> _mapLoadCartListWithDetailsToState() async* {
    int amountNow =  (state is CartListLoaded) ? (state as CartListLoaded).values.length : 0;
    _cartsListSubscription?.cancel();
    _cartsListSubscription = _cartRepository.listenWithDetails(
            (list) => add(CartListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _cartLimit : null
    );
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

  Stream<CartListState> _mapCartListUpdatedToState(
      CartListUpdated event) async* {
    yield CartListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<CartListState> mapEventToState(CartListEvent event) async* {
    if (event is LoadCartList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadCartListToState();
      } else {
        yield* _mapLoadCartListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


