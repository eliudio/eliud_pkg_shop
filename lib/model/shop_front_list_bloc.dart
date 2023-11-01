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

import 'package:eliud_pkg_shop/model/shop_front_repository.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'shop_front_model.dart';

typedef List<ShopFrontModel?> FilterShopFrontModels(List<ShopFrontModel?> values);



class ShopFrontListBloc extends Bloc<ShopFrontListEvent, ShopFrontListState> {
  final FilterShopFrontModels? filter;
  final ShopFrontRepository _shopFrontRepository;
  StreamSubscription? _shopFrontsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int shopFrontLimit;

  ShopFrontListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required ShopFrontRepository shopFrontRepository, this.shopFrontLimit = 5})
      : _shopFrontRepository = shopFrontRepository,
        super(ShopFrontListLoading()) {
    on <LoadShopFrontList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadShopFrontListToState();
      } else {
        _mapLoadShopFrontListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadShopFrontListWithDetailsToState();
    });
    
    on <ShopFrontChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadShopFrontListToState();
      } else {
        _mapLoadShopFrontListWithDetailsToState();
      }
    });
      
    on <AddShopFrontList> ((event, emit) async {
      await _mapAddShopFrontListToState(event);
    });
    
    on <UpdateShopFrontList> ((event, emit) async {
      await _mapUpdateShopFrontListToState(event);
    });
    
    on <DeleteShopFrontList> ((event, emit) async {
      await _mapDeleteShopFrontListToState(event);
    });
    
    on <ShopFrontListUpdated> ((event, emit) {
      emit(_mapShopFrontListUpdatedToState(event));
    });
  }

  List<ShopFrontModel?> _filter(List<ShopFrontModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadShopFrontListToState() async {
    int amountNow =  (state is ShopFrontListLoaded) ? (state as ShopFrontListLoaded).values!.length : 0;
    _shopFrontsListSubscription?.cancel();
    _shopFrontsListSubscription = _shopFrontRepository.listen(
          (list) => add(ShopFrontListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * shopFrontLimit : null
    );
  }

  Future<void> _mapLoadShopFrontListWithDetailsToState() async {
    int amountNow =  (state is ShopFrontListLoaded) ? (state as ShopFrontListLoaded).values!.length : 0;
    _shopFrontsListSubscription?.cancel();
    _shopFrontsListSubscription = _shopFrontRepository.listenWithDetails(
            (list) => add(ShopFrontListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * shopFrontLimit : null
    );
  }

  Future<void> _mapAddShopFrontListToState(AddShopFrontList event) async {
    var value = event.value;
    if (value != null) {
      await _shopFrontRepository.add(value);
    }
  }

  Future<void> _mapUpdateShopFrontListToState(UpdateShopFrontList event) async {
    var value = event.value;
    if (value != null) {
      await _shopFrontRepository.update(value);
    }
  }

  Future<void> _mapDeleteShopFrontListToState(DeleteShopFrontList event) async {
    var value = event.value;
    if (value != null) {
      await _shopFrontRepository.delete(value);
    }
  }

  ShopFrontListLoaded _mapShopFrontListUpdatedToState(
      ShopFrontListUpdated event) => ShopFrontListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _shopFrontsListSubscription?.cancel();
    return super.close();
  }
}


