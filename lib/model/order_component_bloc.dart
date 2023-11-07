/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/order_component_event.dart';
import 'package:eliud_pkg_shop/model/order_component_state.dart';
import 'package:eliud_pkg_shop/model/order_repository.dart';

class OrderComponentBloc
    extends Bloc<OrderComponentEvent, OrderComponentState> {
  final OrderRepository? orderRepository;
  StreamSubscription? _orderSubscription;

  void _mapLoadOrderComponentUpdateToState(String documentId) {
    _orderSubscription?.cancel();
    _orderSubscription = orderRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(OrderComponentUpdated(value: value));
      }
    });
  }

  OrderComponentBloc({this.orderRepository})
      : super(OrderComponentUninitialized()) {
    on<FetchOrderComponent>((event, emit) {
      _mapLoadOrderComponentUpdateToState(event.id!);
    });
    on<OrderComponentUpdated>((event, emit) {
      emit(OrderComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _orderSubscription?.cancel();
    return super.close();
  }
}
