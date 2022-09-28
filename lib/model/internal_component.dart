/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/internal_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'package:eliud_core/tools/has_fab.dart';


import 'package:eliud_pkg_shop/model/cart_list_bloc.dart';
import 'package:eliud_pkg_shop/model/cart_list.dart';
import 'package:eliud_pkg_shop/model/cart_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/cart_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/order_list_bloc.dart';
import 'package:eliud_pkg_shop/model/order_list.dart';
import 'package:eliud_pkg_shop/model/order_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/order_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/order_overview_list_bloc.dart';
import 'package:eliud_pkg_shop/model/order_overview_list.dart';
import 'package:eliud_pkg_shop/model/order_overview_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/order_overview_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/pay_list_bloc.dart';
import 'package:eliud_pkg_shop/model/pay_list.dart';
import 'package:eliud_pkg_shop/model/pay_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/pay_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/pay_confirmation_list_bloc.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_list.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/product_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_list.dart';
import 'package:eliud_pkg_shop/model/product_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/product_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/product_display_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_display_list.dart';
import 'package:eliud_pkg_shop/model/product_display_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/product_display_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/shop_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_list.dart';
import 'package:eliud_pkg_shop/model/shop_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/shop_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/shop_front_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_front_list.dart';
import 'package:eliud_pkg_shop/model/shop_front_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class ListComponentFactory implements ComponentConstructor {
  Widget? createNew({Key? key, required AppModel app,  required String id, int? privilegeLevel, Map<String, dynamic>? parameters}) {
    return ListComponent(app: app, componentId: id);
  }

  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }
}


typedef DropdownButtonChanged(String? value, int? privilegeLevel);

class DropdownButtonComponentFactory implements ComponentDropDown {
  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }


  bool supports(String id) {

    if (id == "carts") return true;
    if (id == "orders") return true;
    if (id == "orderOverviews") return true;
    if (id == "pays") return true;
    if (id == "payConfirmations") return true;
    if (id == "products") return true;
    if (id == "productDisplays") return true;
    if (id == "shops") return true;
    if (id == "shopFronts") return true;
    return false;
  }

  Widget createNew({Key? key, required AppModel app, required String id, int? privilegeLevel, Map<String, dynamic>? parameters, String? value, DropdownButtonChanged? trigger, bool? optional}) {

    if (id == "carts")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "orders")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "orderOverviews")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "pays")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "payConfirmations")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "products")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "productDisplays")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "shops")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "shopFronts")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    return Text("Id $id not found");
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final AppModel app;
  final String? componentId;
  Widget? widget;
  int? privilegeLevel;

  @override
  Widget? fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({required this.app, this.privilegeLevel, this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'carts') return _cartBuild(context);
    if (componentId == 'orders') return _orderBuild(context);
    if (componentId == 'orderOverviews') return _orderOverviewBuild(context);
    if (componentId == 'pays') return _payBuild(context);
    if (componentId == 'payConfirmations') return _payConfirmationBuild(context);
    if (componentId == 'products') return _productBuild(context);
    if (componentId == 'productDisplays') return _productDisplayBuild(context);
    if (componentId == 'shops') return _shopBuild(context);
    if (componentId == 'shopFronts') return _shopFrontBuild(context);
    return Text('Component with componentId == $componentId not found');
  }

  void initWidget() {
    if (componentId == 'carts') widget = CartListWidget(app: app);
    if (componentId == 'orders') widget = OrderListWidget(app: app);
    if (componentId == 'orderOverviews') widget = OrderOverviewListWidget(app: app);
    if (componentId == 'pays') widget = PayListWidget(app: app);
    if (componentId == 'payConfirmations') widget = PayConfirmationListWidget(app: app);
    if (componentId == 'products') widget = ProductListWidget(app: app);
    if (componentId == 'productDisplays') widget = ProductDisplayListWidget(app: app);
    if (componentId == 'shops') widget = ShopListWidget(app: app);
    if (componentId == 'shopFronts') widget = ShopFrontListWidget(app: app);
  }

  Widget _cartBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartListBloc>(
          create: (context) => CartListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            cartRepository: cartRepository(appId: app.documentID)!,
          )..add(LoadCartList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _orderBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderListBloc>(
          create: (context) => OrderListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            orderRepository: orderRepository(appId: app.documentID)!,
          )..add(LoadOrderList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _orderOverviewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderOverviewListBloc>(
          create: (context) => OrderOverviewListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            orderOverviewRepository: orderOverviewRepository(appId: app.documentID)!,
          )..add(LoadOrderOverviewList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _payBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayListBloc>(
          create: (context) => PayListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            payRepository: payRepository(appId: app.documentID)!,
          )..add(LoadPayList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _payConfirmationBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayConfirmationListBloc>(
          create: (context) => PayConfirmationListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            payConfirmationRepository: payConfirmationRepository(appId: app.documentID)!,
          )..add(LoadPayConfirmationList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _productBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            productRepository: productRepository(appId: app.documentID)!,
          )..add(LoadProductList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _productDisplayBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductDisplayListBloc>(
          create: (context) => ProductDisplayListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            productDisplayRepository: productDisplayRepository(appId: app.documentID)!,
          )..add(LoadProductDisplayList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _shopBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopListBloc>(
          create: (context) => ShopListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            shopRepository: shopRepository(appId: app.documentID)!,
          )..add(LoadShopList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _shopFrontBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopFrontListBloc>(
          create: (context) => ShopFrontListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            shopFrontRepository: shopFrontRepository(appId: app.documentID)!,
          )..add(LoadShopFrontList()),
        )
      ],
      child: widget!,
    );
  }

}


typedef Changed(String? value, int? privilegeLevel);

class DropdownButtonComponent extends StatelessWidget {
  final AppModel app;
  final String? componentId;
  final String? value;
  final Changed? trigger;
  final bool? optional;
  int? privilegeLevel;

  DropdownButtonComponent({required this.app, this.componentId, this.privilegeLevel, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'carts') return _cartBuild(context);
    if (componentId == 'orders') return _orderBuild(context);
    if (componentId == 'orderOverviews') return _orderOverviewBuild(context);
    if (componentId == 'pays') return _payBuild(context);
    if (componentId == 'payConfirmations') return _payConfirmationBuild(context);
    if (componentId == 'products') return _productBuild(context);
    if (componentId == 'productDisplays') return _productDisplayBuild(context);
    if (componentId == 'shops') return _shopBuild(context);
    if (componentId == 'shopFronts') return _shopFrontBuild(context);
    return Text('Component with componentId == $componentId not found');
  }


  Widget _cartBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartListBloc>(
          create: (context) => CartListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            cartRepository: cartRepository(appId: app.documentID)!,
          )..add(LoadCartList()),
        )
      ],
      child: CartDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _orderBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderListBloc>(
          create: (context) => OrderListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            orderRepository: orderRepository(appId: app.documentID)!,
          )..add(LoadOrderList()),
        )
      ],
      child: OrderDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _orderOverviewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderOverviewListBloc>(
          create: (context) => OrderOverviewListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            orderOverviewRepository: orderOverviewRepository(appId: app.documentID)!,
          )..add(LoadOrderOverviewList()),
        )
      ],
      child: OrderOverviewDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _payBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayListBloc>(
          create: (context) => PayListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            payRepository: payRepository(appId: app.documentID)!,
          )..add(LoadPayList()),
        )
      ],
      child: PayDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _payConfirmationBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayConfirmationListBloc>(
          create: (context) => PayConfirmationListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            payConfirmationRepository: payConfirmationRepository(appId: app.documentID)!,
          )..add(LoadPayConfirmationList()),
        )
      ],
      child: PayConfirmationDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _productBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            productRepository: productRepository(appId: app.documentID)!,
          )..add(LoadProductList()),
        )
      ],
      child: ProductDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _productDisplayBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductDisplayListBloc>(
          create: (context) => ProductDisplayListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            productDisplayRepository: productDisplayRepository(appId: app.documentID)!,
          )..add(LoadProductDisplayList()),
        )
      ],
      child: ProductDisplayDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _shopBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopListBloc>(
          create: (context) => ShopListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            shopRepository: shopRepository(appId: app.documentID)!,
          )..add(LoadShopList()),
        )
      ],
      child: ShopDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _shopFrontBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopFrontListBloc>(
          create: (context) => ShopFrontListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            shopFrontRepository: shopFrontRepository(appId: app.documentID)!,
          )..add(LoadShopFrontList()),
        )
      ],
      child: ShopFrontDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

}


