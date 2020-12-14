/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/shop_repository.dart';
import 'package:eliud_pkg_shop/model/shop_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_list_state.dart';


class ShopListBloc extends Bloc<ShopListEvent, ShopListState> {
  final ShopRepository _shopRepository;
  StreamSubscription _shopsListSubscription;

  ShopListBloc({ @required ShopRepository shopRepository })
      : assert(shopRepository != null),
      _shopRepository = shopRepository,
      super(ShopListLoading());

  Stream<ShopListState> _mapLoadShopListToState({ String orderBy, bool descending }) async* {
    _shopsListSubscription?.cancel();
    _shopsListSubscription = _shopRepository.listen((list) => add(ShopListUpdated(value: list)), orderBy: orderBy, descending: descending, );
  }

  Stream<ShopListState> _mapLoadShopListWithDetailsToState() async* {
    _shopsListSubscription?.cancel();
    _shopsListSubscription = _shopRepository.listenWithDetails((list) => add(ShopListUpdated(value: list)), );
  }

  Stream<ShopListState> _mapAddShopListToState(AddShopList event) async* {
    _shopRepository.add(event.value);
  }

  Stream<ShopListState> _mapUpdateShopListToState(UpdateShopList event) async* {
    _shopRepository.update(event.value);
  }

  Stream<ShopListState> _mapDeleteShopListToState(DeleteShopList event) async* {
    _shopRepository.delete(event.value);
  }

  Stream<ShopListState> _mapShopListUpdatedToState(ShopListUpdated event) async* {
    yield ShopListLoaded(values: event.value);
  }


  @override
  Stream<ShopListState> mapEventToState(ShopListEvent event) async* {
    final currentState = state;
    if (event is LoadShopList) {
      yield* _mapLoadShopListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadShopListWithDetails) {
      yield* _mapLoadShopListWithDetailsToState();
    } else if (event is AddShopList) {
      yield* _mapAddShopListToState(event);
    } else if (event is UpdateShopList) {
      yield* _mapUpdateShopListToState(event);
    } else if (event is DeleteShopList) {
      yield* _mapDeleteShopListToState(event);
    } else if (event is ShopListUpdated) {
      yield* _mapShopListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _shopsListSubscription?.cancel();
    return super.close();
  }

}


