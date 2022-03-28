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
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/order_overview_repository.dart';
import 'package:eliud_pkg_shop/model/order_overview_list_event.dart';
import 'package:eliud_pkg_shop/model/order_overview_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class OrderOverviewListBloc extends Bloc<OrderOverviewListEvent, OrderOverviewListState> {
  final OrderOverviewRepository _orderOverviewRepository;
  StreamSubscription? _orderOverviewsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int orderOverviewLimit;

  OrderOverviewListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required OrderOverviewRepository orderOverviewRepository, this.orderOverviewLimit = 5})
      : assert(orderOverviewRepository != null),
        _orderOverviewRepository = orderOverviewRepository,
        super(OrderOverviewListLoading());

  Stream<OrderOverviewListState> _mapLoadOrderOverviewListToState() async* {
    int amountNow =  (state is OrderOverviewListLoaded) ? (state as OrderOverviewListLoaded).values!.length : 0;
    _orderOverviewsListSubscription?.cancel();
    _orderOverviewsListSubscription = _orderOverviewRepository.listen(
          (list) => add(OrderOverviewListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * orderOverviewLimit : null
    );
  }

  Stream<OrderOverviewListState> _mapLoadOrderOverviewListWithDetailsToState() async* {
    int amountNow =  (state is OrderOverviewListLoaded) ? (state as OrderOverviewListLoaded).values!.length : 0;
    _orderOverviewsListSubscription?.cancel();
    _orderOverviewsListSubscription = _orderOverviewRepository.listenWithDetails(
            (list) => add(OrderOverviewListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * orderOverviewLimit : null
    );
  }

  Stream<OrderOverviewListState> _mapAddOrderOverviewListToState(AddOrderOverviewList event) async* {
    var value = event.value;
    if (value != null) 
      _orderOverviewRepository.add(value);
  }

  Stream<OrderOverviewListState> _mapUpdateOrderOverviewListToState(UpdateOrderOverviewList event) async* {
    var value = event.value;
    if (value != null) 
      _orderOverviewRepository.update(value);
  }

  Stream<OrderOverviewListState> _mapDeleteOrderOverviewListToState(DeleteOrderOverviewList event) async* {
    var value = event.value;
    if (value != null) 
      _orderOverviewRepository.delete(value);
  }

  Stream<OrderOverviewListState> _mapOrderOverviewListUpdatedToState(
      OrderOverviewListUpdated event) async* {
    yield OrderOverviewListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<OrderOverviewListState> mapEventToState(OrderOverviewListEvent event) async* {
    if (event is LoadOrderOverviewList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadOrderOverviewListToState();
      } else {
        yield* _mapLoadOrderOverviewListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadOrderOverviewListWithDetailsToState();
    } else if (event is OrderOverviewChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadOrderOverviewListToState();
      } else {
        yield* _mapLoadOrderOverviewListWithDetailsToState();
      }
    } else if (event is AddOrderOverviewList) {
      yield* _mapAddOrderOverviewListToState(event);
    } else if (event is UpdateOrderOverviewList) {
      yield* _mapUpdateOrderOverviewListToState(event);
    } else if (event is DeleteOrderOverviewList) {
      yield* _mapDeleteOrderOverviewListToState(event);
    } else if (event is OrderOverviewListUpdated) {
      yield* _mapOrderOverviewListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _orderOverviewsListSubscription?.cancel();
    return super.close();
  }
}


