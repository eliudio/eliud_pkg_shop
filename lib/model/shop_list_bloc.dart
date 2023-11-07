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

import 'package:eliud_pkg_shop/model/shop_repository.dart';
import 'package:eliud_pkg_shop/model/shop_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'shop_model.dart';

typedef FilterShopModels = List<ShopModel?> Function(List<ShopModel?> values);

class ShopListBloc extends Bloc<ShopListEvent, ShopListState> {
  final FilterShopModels? filter;
  final ShopRepository _shopRepository;
  StreamSubscription? _shopsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int shopLimit;

  ShopListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required ShopRepository shopRepository,
      this.shopLimit = 5})
      : _shopRepository = shopRepository,
        super(ShopListLoading()) {
    on<LoadShopList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadShopListToState();
      } else {
        _mapLoadShopListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadShopListWithDetailsToState();
    });

    on<ShopChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadShopListToState();
      } else {
        _mapLoadShopListWithDetailsToState();
      }
    });

    on<AddShopList>((event, emit) async {
      await _mapAddShopListToState(event);
    });

    on<UpdateShopList>((event, emit) async {
      await _mapUpdateShopListToState(event);
    });

    on<DeleteShopList>((event, emit) async {
      await _mapDeleteShopListToState(event);
    });

    on<ShopListUpdated>((event, emit) {
      emit(_mapShopListUpdatedToState(event));
    });
  }

  List<ShopModel?> _filter(List<ShopModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadShopListToState() async {
    int amountNow = (state is ShopListLoaded)
        ? (state as ShopListLoaded).values!.length
        : 0;
    _shopsListSubscription?.cancel();
    _shopsListSubscription = _shopRepository.listen(
        (list) => add(ShopListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * shopLimit : null);
  }

  Future<void> _mapLoadShopListWithDetailsToState() async {
    int amountNow = (state is ShopListLoaded)
        ? (state as ShopListLoaded).values!.length
        : 0;
    _shopsListSubscription?.cancel();
    _shopsListSubscription = _shopRepository.listenWithDetails(
        (list) => add(ShopListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * shopLimit : null);
  }

  Future<void> _mapAddShopListToState(AddShopList event) async {
    var value = event.value;
    if (value != null) {
      await _shopRepository.add(value);
    }
  }

  Future<void> _mapUpdateShopListToState(UpdateShopList event) async {
    var value = event.value;
    if (value != null) {
      await _shopRepository.update(value);
    }
  }

  Future<void> _mapDeleteShopListToState(DeleteShopList event) async {
    var value = event.value;
    if (value != null) {
      await _shopRepository.delete(value);
    }
  }

  ShopListLoaded _mapShopListUpdatedToState(ShopListUpdated event) =>
      ShopListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _shopsListSubscription?.cancel();
    return super.close();
  }
}
