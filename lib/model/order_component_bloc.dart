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

import 'order_model.dart';
import 'order_component_event.dart';
import 'order_component_state.dart';
import 'order_repository.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({ this.orderRepository }): super(OrderUninitialized());
  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    final currentState = state;
    if (event is FetchOrder) {
      try {
        if (currentState is OrderUninitialized) {
          final OrderModel model = await _fetchOrder(event.id);

          if (model != null) {
            yield OrderLoaded(value: model);
          } else {
            String id = event.id;
            yield OrderError(message: "Order with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield OrderError(message: "Unknown error whilst retrieving Order");
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


