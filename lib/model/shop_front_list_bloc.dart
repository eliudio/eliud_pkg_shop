/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'shop_front_repository.dart';
import 'shop_front_list_event.dart';
import 'shop_front_list_state.dart';


class ShopFrontListBloc extends Bloc<ShopFrontListEvent, ShopFrontListState> {
  final ShopFrontRepository _shopFrontRepository;
  StreamSubscription _shopFrontsListSubscription;

  ShopFrontListBloc({ @required ShopFrontRepository shopFrontRepository })
      : assert(shopFrontRepository != null),
      _shopFrontRepository = shopFrontRepository,
      super(ShopFrontListLoading());

  Stream<ShopFrontListState> _mapLoadShopFrontListToState() async* {
    _shopFrontsListSubscription?.cancel();
    _shopFrontsListSubscription = _shopFrontRepository.listen((list) => add(ShopFrontListUpdated(value: list)));
  }

  Stream<ShopFrontListState> _mapLoadShopFrontListWithDetailsToState() async* {
    _shopFrontsListSubscription?.cancel();
    _shopFrontsListSubscription = _shopFrontRepository.listenWithDetails((list) => add(ShopFrontListUpdated(value: list)));
  }

  Stream<ShopFrontListState> _mapAddShopFrontListToState(AddShopFrontList event) async* {
    _shopFrontRepository.add(event.value);
  }

  Stream<ShopFrontListState> _mapUpdateShopFrontListToState(UpdateShopFrontList event) async* {
    _shopFrontRepository.update(event.value);
  }

  Stream<ShopFrontListState> _mapDeleteShopFrontListToState(DeleteShopFrontList event) async* {
    _shopFrontRepository.delete(event.value);
  }

  Stream<ShopFrontListState> _mapShopFrontListUpdatedToState(ShopFrontListUpdated event) async* {
    yield ShopFrontListLoaded(values: event.value);
  }


  @override
  Stream<ShopFrontListState> mapEventToState(ShopFrontListEvent event) async* {
    final currentState = state;
    if (event is LoadShopFrontList) {
      yield* _mapLoadShopFrontListToState();
    } if (event is LoadShopFrontListWithDetails) {
      yield* _mapLoadShopFrontListWithDetailsToState();
    } else if (event is AddShopFrontList) {
      yield* _mapAddShopFrontListToState(event);
    } else if (event is UpdateShopFrontList) {
      yield* _mapUpdateShopFrontListToState(event);
    } else if (event is DeleteShopFrontList) {
      yield* _mapDeleteShopFrontListToState(event);
    } else if (event is ShopFrontListUpdated) {
      yield* _mapShopFrontListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _shopFrontsListSubscription?.cancel();
    return super.close();
  }

}


