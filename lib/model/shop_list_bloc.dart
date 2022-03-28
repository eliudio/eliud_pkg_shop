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
import 'package:eliud_core/tools/query/query_tools.dart';



class ShopListBloc extends Bloc<ShopListEvent, ShopListState> {
  final ShopRepository _shopRepository;
  StreamSubscription? _shopsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int shopLimit;

  ShopListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required ShopRepository shopRepository, this.shopLimit = 5})
      : assert(shopRepository != null),
        _shopRepository = shopRepository,
        super(ShopListLoading());

  Stream<ShopListState> _mapLoadShopListToState() async* {
    int amountNow =  (state is ShopListLoaded) ? (state as ShopListLoaded).values!.length : 0;
    _shopsListSubscription?.cancel();
    _shopsListSubscription = _shopRepository.listen(
          (list) => add(ShopListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * shopLimit : null
    );
  }

  Stream<ShopListState> _mapLoadShopListWithDetailsToState() async* {
    int amountNow =  (state is ShopListLoaded) ? (state as ShopListLoaded).values!.length : 0;
    _shopsListSubscription?.cancel();
    _shopsListSubscription = _shopRepository.listenWithDetails(
            (list) => add(ShopListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * shopLimit : null
    );
  }

  Stream<ShopListState> _mapAddShopListToState(AddShopList event) async* {
    var value = event.value;
    if (value != null) 
      _shopRepository.add(value);
  }

  Stream<ShopListState> _mapUpdateShopListToState(UpdateShopList event) async* {
    var value = event.value;
    if (value != null) 
      _shopRepository.update(value);
  }

  Stream<ShopListState> _mapDeleteShopListToState(DeleteShopList event) async* {
    var value = event.value;
    if (value != null) 
      _shopRepository.delete(value);
  }

  Stream<ShopListState> _mapShopListUpdatedToState(
      ShopListUpdated event) async* {
    yield ShopListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<ShopListState> mapEventToState(ShopListEvent event) async* {
    if (event is LoadShopList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadShopListToState();
      } else {
        yield* _mapLoadShopListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadShopListWithDetailsToState();
    } else if (event is ShopChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadShopListToState();
      } else {
        yield* _mapLoadShopListWithDetailsToState();
      }
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


