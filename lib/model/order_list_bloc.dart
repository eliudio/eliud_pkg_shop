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

import 'package:eliud_pkg_shop/model/order_repository.dart';
import 'package:eliud_pkg_shop/model/order_list_event.dart';
import 'package:eliud_pkg_shop/model/order_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'order_model.dart';

typedef FilterOrderModels = List<OrderModel?> Function(
    List<OrderModel?> values);

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  final FilterOrderModels? filter;
  final OrderRepository _orderRepository;
  StreamSubscription? _ordersListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int orderLimit;

  OrderListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required OrderRepository orderRepository,
      this.orderLimit = 5})
      : _orderRepository = orderRepository,
        super(OrderListLoading()) {
    on<LoadOrderList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadOrderListToState();
      } else {
        _mapLoadOrderListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadOrderListWithDetailsToState();
    });

    on<OrderChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadOrderListToState();
      } else {
        _mapLoadOrderListWithDetailsToState();
      }
    });

    on<AddOrderList>((event, emit) async {
      await _mapAddOrderListToState(event);
    });

    on<UpdateOrderList>((event, emit) async {
      await _mapUpdateOrderListToState(event);
    });

    on<DeleteOrderList>((event, emit) async {
      await _mapDeleteOrderListToState(event);
    });

    on<OrderListUpdated>((event, emit) {
      emit(_mapOrderListUpdatedToState(event));
    });
  }

  List<OrderModel?> _filter(List<OrderModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadOrderListToState() async {
    int amountNow = (state is OrderListLoaded)
        ? (state as OrderListLoaded).values!.length
        : 0;
    _ordersListSubscription?.cancel();
    _ordersListSubscription = _orderRepository.listen(
        (list) => add(OrderListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * orderLimit : null);
  }

  Future<void> _mapLoadOrderListWithDetailsToState() async {
    int amountNow = (state is OrderListLoaded)
        ? (state as OrderListLoaded).values!.length
        : 0;
    _ordersListSubscription?.cancel();
    _ordersListSubscription = _orderRepository.listenWithDetails(
        (list) => add(OrderListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * orderLimit : null);
  }

  Future<void> _mapAddOrderListToState(AddOrderList event) async {
    var value = event.value;
    if (value != null) {
      await _orderRepository.add(value);
    }
  }

  Future<void> _mapUpdateOrderListToState(UpdateOrderList event) async {
    var value = event.value;
    if (value != null) {
      await _orderRepository.update(value);
    }
  }

  Future<void> _mapDeleteOrderListToState(DeleteOrderList event) async {
    var value = event.value;
    if (value != null) {
      await _orderRepository.delete(value);
    }
  }

  OrderListLoaded _mapOrderListUpdatedToState(OrderListUpdated event) =>
      OrderListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _ordersListSubscription?.cancel();
    return super.close();
  }
}
