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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_pkg_shop/model/order_overview_component_bloc.dart';
import 'package:eliud_pkg_shop/model/order_overview_component_event.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';
import 'package:eliud_pkg_shop/model/order_overview_component_state.dart';

abstract class AbstractOrderOverviewComponent extends StatelessWidget {
  static String componentName = "orderOverviews";
  final String orderOverviewID;

  AbstractOrderOverviewComponent({this.orderOverviewID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderOverviewComponentBloc> (
          create: (context) => OrderOverviewComponentBloc(
            orderOverviewRepository: getOrderOverviewRepository(context))
        ..add(FetchOrderOverviewComponent(id: orderOverviewID)),
      child: _orderOverviewBlockBuilder(context),
    );
  }

  Widget _orderOverviewBlockBuilder(BuildContext context) {
    return BlocBuilder<OrderOverviewComponentBloc, OrderOverviewComponentState>(builder: (context, state) {
      if (state is OrderOverviewComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No orderOverview defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is OrderOverviewComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, OrderOverviewModel value);
  Widget alertWidget({ title: String, content: String});
  OrderOverviewRepository getOrderOverviewRepository(BuildContext context);
}


