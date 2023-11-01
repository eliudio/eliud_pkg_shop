/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/order_overview_repository.dart';
import 'package:eliud_pkg_shop/model/order_overview_list_event.dart';
import 'package:eliud_pkg_shop/model/order_overview_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'order_overview_model.dart';

typedef List<OrderOverviewModel?> FilterOrderOverviewModels(List<OrderOverviewModel?> values);



class OrderOverviewListBloc extends Bloc<OrderOverviewListEvent, OrderOverviewListState> {
  final FilterOrderOverviewModels? filter;
  final OrderOverviewRepository _orderOverviewRepository;
  StreamSubscription? _orderOverviewsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int orderOverviewLimit;

  OrderOverviewListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required OrderOverviewRepository orderOverviewRepository, this.orderOverviewLimit = 5})
      : _orderOverviewRepository = orderOverviewRepository,
        super(OrderOverviewListLoading()) {
    on <LoadOrderOverviewList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadOrderOverviewListToState();
      } else {
        _mapLoadOrderOverviewListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadOrderOverviewListWithDetailsToState();
    });
    
    on <OrderOverviewChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadOrderOverviewListToState();
      } else {
        _mapLoadOrderOverviewListWithDetailsToState();
      }
    });
      
    on <AddOrderOverviewList> ((event, emit) async {
      await _mapAddOrderOverviewListToState(event);
    });
    
    on <UpdateOrderOverviewList> ((event, emit) async {
      await _mapUpdateOrderOverviewListToState(event);
    });
    
    on <DeleteOrderOverviewList> ((event, emit) async {
      await _mapDeleteOrderOverviewListToState(event);
    });
    
    on <OrderOverviewListUpdated> ((event, emit) {
      emit(_mapOrderOverviewListUpdatedToState(event));
    });
  }

  List<OrderOverviewModel?> _filter(List<OrderOverviewModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadOrderOverviewListToState() async {
    int amountNow =  (state is OrderOverviewListLoaded) ? (state as OrderOverviewListLoaded).values!.length : 0;
    _orderOverviewsListSubscription?.cancel();
    _orderOverviewsListSubscription = _orderOverviewRepository.listen(
          (list) => add(OrderOverviewListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * orderOverviewLimit : null
    );
  }

  Future<void> _mapLoadOrderOverviewListWithDetailsToState() async {
    int amountNow =  (state is OrderOverviewListLoaded) ? (state as OrderOverviewListLoaded).values!.length : 0;
    _orderOverviewsListSubscription?.cancel();
    _orderOverviewsListSubscription = _orderOverviewRepository.listenWithDetails(
            (list) => add(OrderOverviewListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * orderOverviewLimit : null
    );
  }

  Future<void> _mapAddOrderOverviewListToState(AddOrderOverviewList event) async {
    var value = event.value;
    if (value != null) {
      await _orderOverviewRepository.add(value);
    }
  }

  Future<void> _mapUpdateOrderOverviewListToState(UpdateOrderOverviewList event) async {
    var value = event.value;
    if (value != null) {
      await _orderOverviewRepository.update(value);
    }
  }

  Future<void> _mapDeleteOrderOverviewListToState(DeleteOrderOverviewList event) async {
    var value = event.value;
    if (value != null) {
      await _orderOverviewRepository.delete(value);
    }
  }

  OrderOverviewListLoaded _mapOrderOverviewListUpdatedToState(
      OrderOverviewListUpdated event) => OrderOverviewListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _orderOverviewsListSubscription?.cancel();
    return super.close();
  }
}


