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

import 'order_overview_component_bloc.dart';
import 'order_overview_component_event.dart';
import 'order_overview_model.dart';
import 'order_overview_repository.dart';
import 'order_overview_component_state.dart';

abstract class AbstractOrderOverviewComponent extends StatelessWidget {
  static String componentName = "orderOverviews";
  final String orderOverviewID;

  AbstractOrderOverviewComponent({this.orderOverviewID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderOverviewBloc> (
          create: (context) => OrderOverviewBloc(
            orderOverviewRepository: getOrderOverviewRepository())
        ..add(FetchOrderOverview(id: orderOverviewID)),
      child: _orderOverviewBlockBuilder(context),
    );
  }

  Widget _orderOverviewBlockBuilder(BuildContext context) {
    return BlocBuilder<OrderOverviewBloc, OrderOverviewState>(builder: (context, state) {
      if (state is OrderOverviewLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No orderOverview defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is OrderOverviewError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, OrderOverviewModel value);
  Widget alertWidget({ title: String, content: String});
  OrderOverviewRepository getOrderOverviewRepository();
}


