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


class OrderOverviewListBloc extends Bloc<OrderOverviewListEvent, OrderOverviewListState> {
  final OrderOverviewRepository _orderOverviewRepository;
  StreamSubscription _orderOverviewsListSubscription;

  OrderOverviewListBloc({ @required OrderOverviewRepository orderOverviewRepository })
      : assert(orderOverviewRepository != null),
      _orderOverviewRepository = orderOverviewRepository,
      super(OrderOverviewListLoading());

  Stream<OrderOverviewListState> _mapLoadOrderOverviewListToState({ String orderBy, bool descending }) async* {
    _orderOverviewsListSubscription?.cancel();
    _orderOverviewsListSubscription = _orderOverviewRepository.listen( (list) => add(OrderOverviewListUpdated(value: list)), orderBy: orderBy, descending: descending);
  }

  Stream<OrderOverviewListState> _mapLoadOrderOverviewListWithDetailsToState() async* {
    _orderOverviewsListSubscription?.cancel();
    _orderOverviewsListSubscription = _orderOverviewRepository.listenWithDetails( (list) => add(OrderOverviewListUpdated(value: list)));
  }

  Stream<OrderOverviewListState> _mapAddOrderOverviewListToState(AddOrderOverviewList event) async* {
    _orderOverviewRepository.add(event.value);
  }

  Stream<OrderOverviewListState> _mapUpdateOrderOverviewListToState(UpdateOrderOverviewList event) async* {
    _orderOverviewRepository.update(event.value);
  }

  Stream<OrderOverviewListState> _mapDeleteOrderOverviewListToState(DeleteOrderOverviewList event) async* {
    _orderOverviewRepository.delete(event.value);
  }

  Stream<OrderOverviewListState> _mapOrderOverviewListUpdatedToState(OrderOverviewListUpdated event) async* {
    yield OrderOverviewListLoaded(values: event.value);
  }


  @override
  Stream<OrderOverviewListState> mapEventToState(OrderOverviewListEvent event) async* {
    final currentState = state;
    if (event is LoadOrderOverviewList) {
      yield* _mapLoadOrderOverviewListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadOrderOverviewListWithDetails) {
      yield* _mapLoadOrderOverviewListWithDetailsToState();
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


