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

import 'package:eliud_pkg_shop/model/shop_front_repository.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _shopFrontLimit = 5;

class ShopFrontListBloc extends Bloc<ShopFrontListEvent, ShopFrontListState> {
  final ShopFrontRepository _shopFrontRepository;
  StreamSubscription? _shopFrontsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  ShopFrontListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required ShopFrontRepository shopFrontRepository})
      : assert(shopFrontRepository != null),
        _shopFrontRepository = shopFrontRepository,
        super(ShopFrontListLoading());

  Stream<ShopFrontListState> _mapLoadShopFrontListToState() async* {
    int amountNow =  (state is ShopFrontListLoaded) ? (state as ShopFrontListLoaded).values!.length : 0;
    _shopFrontsListSubscription?.cancel();
    _shopFrontsListSubscription = _shopFrontRepository.listen(
          (list) => add(ShopFrontListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _shopFrontLimit : null
    );
  }

  Stream<ShopFrontListState> _mapLoadShopFrontListWithDetailsToState() async* {
    int amountNow =  (state is ShopFrontListLoaded) ? (state as ShopFrontListLoaded).values!.length : 0;
    _shopFrontsListSubscription?.cancel();
    _shopFrontsListSubscription = _shopFrontRepository.listenWithDetails(
            (list) => add(ShopFrontListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _shopFrontLimit : null
    );
  }

  Stream<ShopFrontListState> _mapAddShopFrontListToState(AddShopFrontList event) async* {
    var value = event.value;
    if (value != null) 
      _shopFrontRepository.add(value);
  }

  Stream<ShopFrontListState> _mapUpdateShopFrontListToState(UpdateShopFrontList event) async* {
    var value = event.value;
    if (value != null) 
      _shopFrontRepository.update(value);
  }

  Stream<ShopFrontListState> _mapDeleteShopFrontListToState(DeleteShopFrontList event) async* {
    var value = event.value;
    if (value != null) 
      _shopFrontRepository.delete(value);
  }

  Stream<ShopFrontListState> _mapShopFrontListUpdatedToState(
      ShopFrontListUpdated event) async* {
    yield ShopFrontListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<ShopFrontListState> mapEventToState(ShopFrontListEvent event) async* {
    if (event is LoadShopFrontList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadShopFrontListToState();
      } else {
        yield* _mapLoadShopFrontListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


