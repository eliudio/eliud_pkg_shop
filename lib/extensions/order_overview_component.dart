import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/order_list.dart';
import 'package:eliud_pkg_shop/model/order_list_bloc.dart';
import 'package:eliud_pkg_shop/model/order_list_event.dart';
import 'package:eliud_pkg_shop/model/order_overview_component.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderOverviewComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String appId, required String id, Map<String, dynamic>? parameters}) {
    return OrderOverviewComponent(key: key, appId: appId, id: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await orderOverviewRepository(appId: appId)!.get(id);
}

class OrderOverviewComponent extends AbstractOrderOverviewComponent {
  OrderOverviewComponent({Key? key, required String appId, required String id}) : super(key: key, theAppId: appId, orderOverviewId: id);

  @override
  Widget yourWidget(BuildContext context, OrderOverviewModel? orderOverview) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
          if (accessState is AccessDetermined) {
            if (accessState.memberIsOwner(accessState.currentApp.documentID!)) {
              // allow owner of the app to see ALL orders and update shipment details
              return BlocProvider<OrderListBloc>(
                create: (context) =>
                OrderListBloc(
                  orderRepository: AbstractRepositorySingleton.singleton.orderRepository(AccessBloc.currentAppId(context))!,
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
                      .orderRepository(AccessBloc.currentAppId(context))!,
                )
                  ..add(LoadOrderList()),
                child: OrderListWidget(readOnly: true),
              );
            }
          } else {
            return progressIndicator(context);
          }
        });
  }
}
