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
import 'package:eliud_core/tools/query/query_tools.dart';


const _orderItemLimit = 5;

class OrderItemListBloc extends Bloc<OrderItemListEvent, OrderItemListState> {
  final OrderItemRepository _orderItemRepository;
  StreamSubscription? _orderItemsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  OrderItemListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required OrderItemRepository orderItemRepository})
      : assert(orderItemRepository != null),
        _orderItemRepository = orderItemRepository,
        super(OrderItemListLoading());

  Stream<OrderItemListState> _mapLoadOrderItemListToState() async* {
    int amountNow =  (state is OrderItemListLoaded) ? (state as OrderItemListLoaded).values!.length : 0;
    _orderItemsListSubscription?.cancel();
    _orderItemsListSubscription = _orderItemRepository.listen(
          (list) => add(OrderItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _orderItemLimit : null
    );
  }

  Stream<OrderItemListState> _mapLoadOrderItemListWithDetailsToState() async* {
    int amountNow =  (state is OrderItemListLoaded) ? (state as OrderItemListLoaded).values!.length : 0;
    _orderItemsListSubscription?.cancel();
    _orderItemsListSubscription = _orderItemRepository.listenWithDetails(
            (list) => add(OrderItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _orderItemLimit : null
    );
  }

  Stream<OrderItemListState> _mapAddOrderItemListToState(AddOrderItemList event) async* {
    var value = event.value;
    if (value != null) 
      _orderItemRepository.add(value);
  }

  Stream<OrderItemListState> _mapUpdateOrderItemListToState(UpdateOrderItemList event) async* {
    var value = event.value;
    if (value != null) 
      _orderItemRepository.update(value);
  }

  Stream<OrderItemListState> _mapDeleteOrderItemListToState(DeleteOrderItemList event) async* {
    var value = event.value;
    if (value != null) 
      _orderItemRepository.delete(value);
  }

  Stream<OrderItemListState> _mapOrderItemListUpdatedToState(
      OrderItemListUpdated event) async* {
    yield OrderItemListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<OrderItemListState> mapEventToState(OrderItemListEvent event) async* {
    if (event is LoadOrderItemList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadOrderItemListToState();
      } else {
        yield* _mapLoadOrderItemListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


