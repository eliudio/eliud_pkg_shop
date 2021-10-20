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

import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/order_component_event.dart';
import 'package:eliud_pkg_shop/model/order_component_state.dart';
import 'package:eliud_pkg_shop/model/order_repository.dart';
import 'package:flutter/services.dart';


class OrderComponentBloc extends Bloc<OrderComponentEvent, OrderComponentState> {
  final OrderRepository? orderRepository;
  StreamSubscription? _orderSubscription;

  Stream<OrderComponentState> _mapLoadOrderComponentUpdateToState(String documentId) async* {
    _orderSubscription?.cancel();
    _orderSubscription = orderRepository!.listenTo(documentId, (value) {
      if (value != null) add(OrderComponentUpdated(value: value));
    });
  }

  OrderComponentBloc({ this.orderRepository }): super(OrderComponentUninitialized());

  @override
  Stream<OrderComponentState> mapEventToState(OrderComponentEvent event) async* {
    final currentState = state;
    if (event is FetchOrderComponent) {
      yield* _mapLoadOrderComponentUpdateToState(event.id!);
    } else if (event is OrderComponentUpdated) {
      yield OrderComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _orderSubscription?.cancel();
    return super.close();
  }

}

