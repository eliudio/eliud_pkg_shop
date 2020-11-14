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

class OrderComponentBloc extends Bloc<OrderComponentEvent, OrderComponentState> {
  final OrderRepository orderRepository;

  OrderComponentBloc({ this.orderRepository }): super(OrderComponentUninitialized());
  @override
  Stream<OrderComponentState> mapEventToState(OrderComponentEvent event) async* {
    final currentState = state;
    if (event is FetchOrderComponent) {
      try {
        if (currentState is OrderComponentUninitialized) {
          final OrderModel model = await _fetchOrder(event.id);

          if (model != null) {
            yield OrderComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield OrderComponentError(message: "Order with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield OrderComponentError(message: "Unknown error whilst retrieving Order");
      }
    }
  }

  Future<OrderModel> _fetchOrder(String id) async {
    return orderRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


