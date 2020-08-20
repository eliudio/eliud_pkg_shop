/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_component_bloc.dart';
import 'order_component_event.dart';
import 'order_model.dart';
import 'order_repository.dart';
import 'order_component_state.dart';

abstract class AbstractOrderComponent extends StatelessWidget {
  static String componentName = "orders";
  final String orderID;

  AbstractOrderComponent({this.orderID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderBloc> (
          create: (context) => OrderBloc(
            orderRepository: getOrderRepository())
        ..add(FetchOrder(id: orderID)),
      child: _orderBlockBuilder(context),
    );
  }

  Widget _orderBlockBuilder(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
      if (state is OrderLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No order defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is OrderError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, OrderModel value);
  Widget alertWidget({ title: String, content: String});
  OrderRepository getOrderRepository();
}


