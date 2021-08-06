/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/order_repository.dart';
import 'package:eliud_pkg_shop/model/order_list_event.dart';
import 'package:eliud_pkg_shop/model/order_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  final OrderRepository _orderRepository;
  StreamSubscription? _ordersListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int orderLimit;

  OrderListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required OrderRepository orderRepository, this.orderLimit = 5})
      : assert(orderRepository != null),
        _orderRepository = orderRepository,
        super(OrderListLoading());

  Stream<OrderListState> _mapLoadOrderListToState() async* {
    int amountNow =  (state is OrderListLoaded) ? (state as OrderListLoaded).values!.length : 0;
    _ordersListSubscription?.cancel();
    _ordersListSubscription = _orderRepository.listen(
          (list) => add(OrderListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * orderLimit : null
    );
  }

  Stream<OrderListState> _mapLoadOrderListWithDetailsToState() async* {
    int amountNow =  (state is OrderListLoaded) ? (state as OrderListLoaded).values!.length : 0;
    _ordersListSubscription?.cancel();
    _ordersListSubscription = _orderRepository.listenWithDetails(
            (list) => add(OrderListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * orderLimit : null
    );
  }

  Stream<OrderListState> _mapAddOrderListToState(AddOrderList event) async* {
    var value = event.value;
    if (value != null) 
      _orderRepository.add(value);
  }

  Stream<OrderListState> _mapUpdateOrderListToState(UpdateOrderList event) async* {
    var value = event.value;
    if (value != null) 
      _orderRepository.update(value);
  }

  Stream<OrderListState> _mapDeleteOrderListToState(DeleteOrderList event) async* {
    var value = event.value;
    if (value != null) 
      _orderRepository.delete(value);
  }

  Stream<OrderListState> _mapOrderListUpdatedToState(
      OrderListUpdated event) async* {
    yield OrderListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<OrderListState> mapEventToState(OrderListEvent event) async* {
    if (event is LoadOrderList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadOrderListToState();
      } else {
        yield* _mapLoadOrderListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadOrderListWithDetailsToState();
    } else if (event is AddOrderList) {
      yield* _mapAddOrderListToState(event);
    } else if (event is UpdateOrderList) {
      yield* _mapUpdateOrderListToState(event);
    } else if (event is DeleteOrderList) {
      yield* _mapDeleteOrderListToState(event);
    } else if (event is OrderListUpdated) {
      yield* _mapOrderListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _ordersListSubscription?.cancel();
    return super.close();
  }
}


