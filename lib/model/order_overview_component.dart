/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_shop/model/order_overview_component_bloc.dart';
import 'package:eliud_pkg_shop/model/order_overview_component_event.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';
import 'package:eliud_pkg_shop/model/order_overview_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractOrderOverviewComponent extends StatelessWidget {
  static String componentName = "orderOverviews";
  final AppModel app;
  final String orderOverviewId;

  AbstractOrderOverviewComponent({Key? key, required this.app, required this.orderOverviewId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderOverviewComponentBloc> (
          create: (context) => OrderOverviewComponentBloc(
            orderOverviewRepository: orderOverviewRepository(appId: app.documentID!)!)
        ..add(FetchOrderOverviewComponent(id: orderOverviewId)),
      child: _orderOverviewBlockBuilder(context),
    );
  }

  Widget _orderOverviewBlockBuilder(BuildContext context) {
    return BlocBuilder<OrderOverviewComponentBloc, OrderOverviewComponentState>(builder: (context, state) {
      if (state is OrderOverviewComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No OrderOverview defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is OrderOverviewComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is OrderOverviewComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, OrderOverviewModel value);
}

