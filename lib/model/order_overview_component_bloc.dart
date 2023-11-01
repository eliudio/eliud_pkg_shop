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

import 'package:eliud_pkg_shop/model/order_overview_component_event.dart';
import 'package:eliud_pkg_shop/model/order_overview_component_state.dart';
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';


class OrderOverviewComponentBloc extends Bloc<OrderOverviewComponentEvent, OrderOverviewComponentState> {
  final OrderOverviewRepository? orderOverviewRepository;
  StreamSubscription? _orderOverviewSubscription;

  void _mapLoadOrderOverviewComponentUpdateToState(String documentId) {
    _orderOverviewSubscription?.cancel();
    _orderOverviewSubscription = orderOverviewRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(OrderOverviewComponentUpdated(value: value));
      }
    });
  }

  OrderOverviewComponentBloc({ this.orderOverviewRepository }): super(OrderOverviewComponentUninitialized()) {
    on <FetchOrderOverviewComponent> ((event, emit) {
      _mapLoadOrderOverviewComponentUpdateToState(event.id!);
    });
    on <OrderOverviewComponentUpdated> ((event, emit) {
      emit(OrderOverviewComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _orderOverviewSubscription?.cancel();
    return super.close();
  }

}

