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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  final OrderRepository _orderRepository;
  StreamSubscription _ordersListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  OrderListBloc(this.accessBloc,{ this.eliudQuery, @required OrderRepository orderRepository })
      : assert(orderRepository != null),
      _orderRepository = orderRepository,
      super(OrderListLoading());

  Stream<OrderListState> _mapLoadOrderListToState({ String orderBy, bool descending }) async* {
    _ordersListSubscription?.cancel();
    _ordersListSubscription = _orderRepository.listen((list) => add(OrderListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<OrderListState> _mapLoadOrderListWithDetailsToState({ String orderBy, bool descending }) async* {
    _ordersListSubscription?.cancel();
    _ordersListSubscription = _orderRepository.listenWithDetails((list) => add(OrderListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<OrderListState> _mapAddOrderListToState(AddOrderList event) async* {
    _orderRepository.add(event.value);
  }

  Stream<OrderListState> _mapUpdateOrderListToState(UpdateOrderList event) async* {
    _orderRepository.update(event.value);
  }

  Stream<OrderListState> _mapDeleteOrderListToState(DeleteOrderList event) async* {
    _orderRepository.delete(event.value);
  }

  Stream<OrderListState> _mapOrderListUpdatedToState(OrderListUpdated event) async* {
    yield OrderListLoaded(values: event.value);
  }


  @override
  Stream<OrderListState> mapEventToState(OrderListEvent event) async* {
    final currentState = state;
    if (event is LoadOrderList) {
      yield* _mapLoadOrderListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadOrderListWithDetails) {
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


