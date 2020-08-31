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

class OrderOverviewBloc extends Bloc<OrderOverviewEvent, OrderOverviewState> {
  final OrderOverviewRepository orderOverviewRepository;

  OrderOverviewBloc({ this.orderOverviewRepository }): super(OrderOverviewUninitialized());
  @override
  Stream<OrderOverviewState> mapEventToState(OrderOverviewEvent event) async* {
    final currentState = state;
    if (event is FetchOrderOverview) {
      try {
        if (currentState is OrderOverviewUninitialized) {
          final OrderOverviewModel model = await _fetchOrderOverview(event.id);

          if (model != null) {
            yield OrderOverviewLoaded(value: model);
          } else {
            String id = event.id;
            yield OrderOverviewError(message: "OrderOverview with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield OrderOverviewError(message: "Unknown error whilst retrieving OrderOverview");
      }
    }
  }

  Future<OrderOverviewModel> _fetchOrderOverview(String id) async {
    return orderOverviewRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


