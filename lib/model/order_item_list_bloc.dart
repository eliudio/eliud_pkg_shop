/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/order_item_repository.dart';
import 'package:eliud_pkg_shop/model/order_item_list_event.dart';
import 'package:eliud_pkg_shop/model/order_item_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class OrderItemListBloc extends Bloc<OrderItemListEvent, OrderItemListState> {
  final OrderItemRepository _orderItemRepository;
  StreamSubscription _orderItemsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  OrderItemListBloc(this.accessBloc,{ this.eliudQuery, @required OrderItemRepository orderItemRepository })
      : assert(orderItemRepository != null),
      _orderItemRepository = orderItemRepository,
      super(OrderItemListLoading());

  Stream<OrderItemListState> _mapLoadOrderItemListToState({ String orderBy, bool descending }) async* {
    _orderItemsListSubscription?.cancel();
    _orderItemsListSubscription = _orderItemRepository.listen((list) => add(OrderItemListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<OrderItemListState> _mapLoadOrderItemListWithDetailsToState() async* {
    _orderItemsListSubscription?.cancel();
    _orderItemsListSubscription = _orderItemRepository.listenWithDetails((list) => add(OrderItemListUpdated(value: list)), );
  }

  Stream<OrderItemListState> _mapAddOrderItemListToState(AddOrderItemList event) async* {
    _orderItemRepository.add(event.value);
  }

  Stream<OrderItemListState> _mapUpdateOrderItemListToState(UpdateOrderItemList event) async* {
    _orderItemRepository.update(event.value);
  }

  Stream<OrderItemListState> _mapDeleteOrderItemListToState(DeleteOrderItemList event) async* {
    _orderItemRepository.delete(event.value);
  }

  Stream<OrderItemListState> _mapOrderItemListUpdatedToState(OrderItemListUpdated event) async* {
    yield OrderItemListLoaded(values: event.value);
  }


  @override
  Stream<OrderItemListState> mapEventToState(OrderItemListEvent event) async* {
    final currentState = state;
    if (event is LoadOrderItemList) {
      yield* _mapLoadOrderItemListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadOrderItemListWithDetails) {
      yield* _mapLoadOrderItemListWithDetailsToState();
    } else if (event is AddOrderItemList) {
      yield* _mapAddOrderItemListToState(event);
    } else if (event is UpdateOrderItemList) {
      yield* _mapUpdateOrderItemListToState(event);
    } else if (event is DeleteOrderItemList) {
      yield* _mapDeleteOrderItemListToState(event);
    } else if (event is OrderItemListUpdated) {
      yield* _mapOrderItemListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _orderItemsListSubscription?.cancel();
    return super.close();
  }

}


