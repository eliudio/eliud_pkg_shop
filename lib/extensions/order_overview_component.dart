import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_pkg_shop/model/order_list.dart';
import 'package:eliud_pkg_shop/model/order_list_bloc.dart';
import 'package:eliud_pkg_shop/model/order_list_event.dart';
import 'package:eliud_pkg_shop/model/order_overview_component.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderOverviewComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, String> parameters}) {
    return OrderOverviewComponent(id: id);
  }
}

class OrderOverviewComponent extends AbstractOrderOverviewComponent {
  OrderOverviewComponent({String id}) : super(orderOverviewID: id);

  @override
  Widget yourWidget(BuildContext context, OrderOverviewModel orderOverview) {
    var accessState = AccessBloc.getState(context);
    if (accessState.memberIsOwner()) {
      // allow owner of the app to see ALL orders and update shipment details
      return BlocProvider<OrderListBloc>(
        create: (context) =>
        OrderListBloc(
          orderRepository: AbstractRepositorySingleton.singleton.orderRepository(AccessBloc.appId(context)),
        )
          ..add(LoadOrderList()),
        child: OrderListWidget(readOnly: false, form: 'OrderShipmentForm'),
      );
    } else {
      // allow member to view his own orders
      return BlocProvider<OrderListBloc>(
        create: (context) =>
        OrderListBloc(
          orderRepository: AbstractRepositorySingleton.singleton
              .orderRepository(AccessBloc.appId(context)),
        )
          ..add(LoadOrderList()),
        child: OrderListWidget(readOnly: true),
      );
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  OrderOverviewRepository getOrderOverviewRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.orderOverviewRepository(AccessBloc.appId(context));
  }
}
