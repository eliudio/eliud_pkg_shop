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

import 'package:eliud_pkg_shop/model/order_item_repository.dart';
import 'package:eliud_pkg_shop/model/order_item_list_event.dart';
import 'package:eliud_pkg_shop/model/order_item_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'order_item_model.dart';

typedef FilterOrderItemModels = List<OrderItemModel?> Function(
    List<OrderItemModel?> values);

class OrderItemListBloc extends Bloc<OrderItemListEvent, OrderItemListState> {
  final FilterOrderItemModels? filter;
  final OrderItemRepository _orderItemRepository;
  StreamSubscription? _orderItemsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int orderItemLimit;

  OrderItemListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required OrderItemRepository orderItemRepository,
      this.orderItemLimit = 5})
      : _orderItemRepository = orderItemRepository,
        super(OrderItemListLoading()) {
    on<LoadOrderItemList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadOrderItemListToState();
      } else {
        _mapLoadOrderItemListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadOrderItemListWithDetailsToState();
    });

    on<OrderItemChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadOrderItemListToState();
      } else {
        _mapLoadOrderItemListWithDetailsToState();
      }
    });

    on<AddOrderItemList>((event, emit) async {
      await _mapAddOrderItemListToState(event);
    });

    on<UpdateOrderItemList>((event, emit) async {
      await _mapUpdateOrderItemListToState(event);
    });

    on<DeleteOrderItemList>((event, emit) async {
      await _mapDeleteOrderItemListToState(event);
    });

    on<OrderItemListUpdated>((event, emit) {
      emit(_mapOrderItemListUpdatedToState(event));
    });
  }

  List<OrderItemModel?> _filter(List<OrderItemModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadOrderItemListToState() async {
    int amountNow = (state is OrderItemListLoaded)
        ? (state as OrderItemListLoaded).values!.length
        : 0;
    _orderItemsListSubscription?.cancel();
    _orderItemsListSubscription = _orderItemRepository.listen(
        (list) => add(OrderItemListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * orderItemLimit : null);
  }

  Future<void> _mapLoadOrderItemListWithDetailsToState() async {
    int amountNow = (state is OrderItemListLoaded)
        ? (state as OrderItemListLoaded).values!.length
        : 0;
    _orderItemsListSubscription?.cancel();
    _orderItemsListSubscription = _orderItemRepository.listenWithDetails(
        (list) => add(OrderItemListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * orderItemLimit : null);
  }

  Future<void> _mapAddOrderItemListToState(AddOrderItemList event) async {
    var value = event.value;
    if (value != null) {
      await _orderItemRepository.add(value);
    }
  }

  Future<void> _mapUpdateOrderItemListToState(UpdateOrderItemList event) async {
    var value = event.value;
    if (value != null) {
      await _orderItemRepository.update(value);
    }
  }

  Future<void> _mapDeleteOrderItemListToState(DeleteOrderItemList event) async {
    var value = event.value;
    if (value != null) {
      await _orderItemRepository.delete(value);
    }
  }

  OrderItemListLoaded _mapOrderItemListUpdatedToState(
          OrderItemListUpdated event) =>
      OrderItemListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _orderItemsListSubscription?.cancel();
    return super.close();
  }
}
