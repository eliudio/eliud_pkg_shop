/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/order_overview_model.dart';
import 'package:eliud_pkg_shop/model/order_overview_component_event.dart';
import 'package:eliud_pkg_shop/model/order_overview_component_state.dart';
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';
import 'package:flutter/services.dart';


class OrderOverviewComponentBloc extends Bloc<OrderOverviewComponentEvent, OrderOverviewComponentState> {
  final OrderOverviewRepository? orderOverviewRepository;
  StreamSubscription? _orderOverviewSubscription;

  Stream<OrderOverviewComponentState> _mapLoadOrderOverviewComponentUpdateToState(String documentId) async* {
    _orderOverviewSubscription?.cancel();
    _orderOverviewSubscription = orderOverviewRepository!.listenTo(documentId, (value) {
      if (value != null) add(OrderOverviewComponentUpdated(value: value));
    });
  }

  OrderOverviewComponentBloc({ this.orderOverviewRepository }): super(OrderOverviewComponentUninitialized());

  @override
  Stream<OrderOverviewComponentState> mapEventToState(OrderOverviewComponentEvent event) async* {
    final currentState = state;
    if (event is FetchOrderOverviewComponent) {
      yield* _mapLoadOrderOverviewComponentUpdateToState(event.id!);
    } else if (event is OrderOverviewComponentUpdated) {
      yield OrderOverviewComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _orderOverviewSubscription?.cancel();
    return super.close();
  }

}

