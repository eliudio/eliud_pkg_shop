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

import 'package:eliud_pkg_shop/model/cart_repository.dart';
import 'package:eliud_pkg_shop/model/cart_list_event.dart';
import 'package:eliud_pkg_shop/model/cart_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'cart_model.dart';

typedef List<CartModel?> FilterCartModels(List<CartModel?> values);



class CartListBloc extends Bloc<CartListEvent, CartListState> {
  final FilterCartModels? filter;
  final CartRepository _cartRepository;
  StreamSubscription? _cartsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int cartLimit;

  CartListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required CartRepository cartRepository, this.cartLimit = 5})
      : _cartRepository = cartRepository,
        super(CartListLoading()) {
    on <LoadCartList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadCartListToState();
      } else {
        _mapLoadCartListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadCartListWithDetailsToState();
    });
    
    on <CartChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadCartListToState();
      } else {
        _mapLoadCartListWithDetailsToState();
      }
    });
      
    on <AddCartList> ((event, emit) async {
      await _mapAddCartListToState(event);
    });
    
    on <UpdateCartList> ((event, emit) async {
      await _mapUpdateCartListToState(event);
    });
    
    on <DeleteCartList> ((event, emit) async {
      await _mapDeleteCartListToState(event);
    });
    
    on <CartListUpdated> ((event, emit) {
      emit(_mapCartListUpdatedToState(event));
    });
  }

  List<CartModel?> _filter(List<CartModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadCartListToState() async {
    int amountNow =  (state is CartListLoaded) ? (state as CartListLoaded).values!.length : 0;
    _cartsListSubscription?.cancel();
    _cartsListSubscription = _cartRepository.listen(
          (list) => add(CartListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * cartLimit : null
    );
  }

  Future<void> _mapLoadCartListWithDetailsToState() async {
    int amountNow =  (state is CartListLoaded) ? (state as CartListLoaded).values!.length : 0;
    _cartsListSubscription?.cancel();
    _cartsListSubscription = _cartRepository.listenWithDetails(
            (list) => add(CartListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * cartLimit : null
    );
  }

  Future<void> _mapAddCartListToState(AddCartList event) async {
    var value = event.value;
    if (value != null) {
      await _cartRepository.add(value);
    }
  }

  Future<void> _mapUpdateCartListToState(UpdateCartList event) async {
    var value = event.value;
    if (value != null) {
      await _cartRepository.update(value);
    }
  }

  Future<void> _mapDeleteCartListToState(DeleteCartList event) async {
    var value = event.value;
    if (value != null) {
      await _cartRepository.delete(value);
    }
  }

  CartListLoaded _mapCartListUpdatedToState(
      CartListUpdated event) => CartListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _cartsListSubscription?.cancel();
    return super.close();
  }
}


