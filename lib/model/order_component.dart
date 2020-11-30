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

import 'package:eliud_pkg_shop/model/order_component_bloc.dart';
import 'package:eliud_pkg_shop/model/order_component_event.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/order_repository.dart';
import 'package:eliud_pkg_shop/model/order_component_state.dart';

abstract class AbstractOrderComponent extends StatelessWidget {
  static String componentName = "orders";
  final String orderID;

  AbstractOrderComponent({this.orderID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderComponentBloc> (
          create: (context) => OrderComponentBloc(
            orderRepository: getOrderRepository(context))
        ..add(FetchOrderComponent(id: orderID)),
      child: _orderBlockBuilder(context),
    );
  }

  Widget _orderBlockBuilder(BuildContext context) {
    return BlocBuilder<OrderComponentBloc, OrderComponentState>(builder: (context, state) {
      if (state is OrderComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No order defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is OrderComponentError) {
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
  OrderRepository getOrderRepository(BuildContext context);
}


