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


import 'package:eliud_pkg_shop/model/order_component_bloc.dart';
import 'package:eliud_pkg_shop/model/order_component_event.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/order_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractOrderComponent extends StatelessWidget {
  static String componentName = "orders";
  final AppModel app;
  final String orderId;

  AbstractOrderComponent({Key? key, required this.app, required this.orderId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderComponentBloc> (
          create: (context) => OrderComponentBloc(
            orderRepository: orderRepository(appId: app.documentID)!)
        ..add(FetchOrderComponent(id: orderId)),
      child: _orderBlockBuilder(context),
    );
  }

  Widget _orderBlockBuilder(BuildContext context) {
    return BlocBuilder<OrderComponentBloc, OrderComponentState>(builder: (context, state) {
      if (state is OrderComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is OrderComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is OrderComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, OrderModel value);
}

