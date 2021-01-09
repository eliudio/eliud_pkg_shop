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
  final OrderOverviewRepository orderOverviewRepository;

  OrderOverviewComponentBloc({ this.orderOverviewRepository }): super(OrderOverviewComponentUninitialized());
  @override
  Stream<OrderOverviewComponentState> mapEventToState(OrderOverviewComponentEvent event) async* {
    final currentState = state;
    if (event is FetchOrderOverviewComponent) {
      try {
        if (currentState is OrderOverviewComponentUninitialized) {
          bool permissionDenied = false;
          final model = await orderOverviewRepository.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield OrderOverviewComponentPermissionDenied();
          } else {
            if (model != null) {
              yield OrderOverviewComponentLoaded(value: model);
            } else {
              String id = event.id;
              yield OrderOverviewComponentError(
                  message: "OrderOverview with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield OrderOverviewComponentError(message: "Unknown error whilst retrieving OrderOverview");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

