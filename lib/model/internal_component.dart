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


import 'package:eliud_core/tools/component_constructor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/pay_list_bloc.dart';
import 'package:eliud_pkg_shop/model/pay_list.dart';
import 'package:eliud_pkg_shop/model/pay_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/pay_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/pay_confirmation_list_bloc.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_list.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/shop_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_list.dart';
import 'package:eliud_pkg_shop/model/shop_dropdown_button.dart';
import 'package:eliud_pkg_shop/model/shop_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class ListComponentFactory implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
    return ListComponent(componentId: id);
  }
}


typedef DropdownButtonChanged(String value);

class DropdownButtonComponentFactory implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters, String value, DropdownButtonChanged trigger, bool optional}) {
  
    if (id == "carts")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "orders")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "orderOverviews")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "pays")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "payConfirmations")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "products")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "shops")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "shopFronts")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    return null;
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final String componentId;
  Widget widget;

  @override
  Widget fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'carts') return _cartBuild();
    if (componentId == 'orders') return _orderBuild();
    if (componentId == 'orderOverviews') return _orderOverviewBuild();
    if (componentId == 'pays') return _payBuild();
    if (componentId == 'payConfirmations') return _payConfirmationBuild();
    if (componentId == 'products') return _productBuild();
    if (componentId == 'shops') return _shopBuild();
    if (componentId == 'shopFronts') return _shopFrontBuild();
    return Image(image: AssetImage('assets/images/component_not_available.png'));
  }

  Widget initWidget() {
    if (componentId == 'carts') widget = CartListWidget();
    if (componentId == 'orders') widget = OrderListWidget();
    if (componentId == 'orderOverviews') widget = OrderOverviewListWidget();
    if (componentId == 'pays') widget = PayListWidget();
    if (componentId == 'payConfirmations') widget = PayConfirmationListWidget();
    if (componentId == 'products') widget = ProductListWidget();
    if (componentId == 'shops') widget = ShopListWidget();
    if (componentId == 'shopFronts') widget = ShopFrontListWidget();
  }

  Widget _cartBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartListBloc>(
          create: (context) => CartListBloc(
            cartRepository: cartRepository(),
          )..add(LoadCartList()),
        )
      ],
      child: widget,
    );
  }

  Widget _orderBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderListBloc>(
          create: (context) => OrderListBloc(
            orderRepository: orderRepository(),
          )..add(LoadOrderList()),
        )
      ],
      child: widget,
    );
  }

  Widget _orderOverviewBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderOverviewListBloc>(
          create: (context) => OrderOverviewListBloc(
            orderOverviewRepository: orderOverviewRepository(),
          )..add(LoadOrderOverviewList()),
        )
      ],
      child: widget,
    );
  }

  Widget _payBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayListBloc>(
          create: (context) => PayListBloc(
            payRepository: payRepository(),
          )..add(LoadPayList()),
        )
      ],
      child: widget,
    );
  }

  Widget _payConfirmationBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayConfirmationListBloc>(
          create: (context) => PayConfirmationListBloc(
            payConfirmationRepository: payConfirmationRepository(),
          )..add(LoadPayConfirmationList()),
        )
      ],
      child: widget,
    );
  }

  Widget _productBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(
            productRepository: productRepository(),
          )..add(LoadProductList()),
        )
      ],
      child: widget,
    );
  }

  Widget _shopBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopListBloc>(
          create: (context) => ShopListBloc(
            shopRepository: shopRepository(),
          )..add(LoadShopList()),
        )
      ],
      child: widget,
    );
  }

  Widget _shopFrontBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopFrontListBloc>(
          create: (context) => ShopFrontListBloc(
            shopFrontRepository: shopFrontRepository(),
          )..add(LoadShopFrontList()),
        )
      ],
      child: widget,
    );
  }

}


typedef Changed(String value);

class DropdownButtonComponent extends StatelessWidget {
  final String componentId;
  final String value;
  final Changed trigger;
  final bool optional;

  DropdownButtonComponent({this.componentId, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'carts') return _cartBuild();
    if (componentId == 'orders') return _orderBuild();
    if (componentId == 'orderOverviews') return _orderOverviewBuild();
    if (componentId == 'pays') return _payBuild();
    if (componentId == 'payConfirmations') return _payConfirmationBuild();
    if (componentId == 'products') return _productBuild();
    if (componentId == 'shops') return _shopBuild();
    if (componentId == 'shopFronts') return _shopFrontBuild();
    return Image(image: AssetImage('assets/images/component_not_available.png'));
  }


  Widget _cartBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartListBloc>(
          create: (context) => CartListBloc(
            cartRepository: cartRepository(),
          )..add(LoadCartList()),
        )
      ],
      child: CartDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _orderBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderListBloc>(
          create: (context) => OrderListBloc(
            orderRepository: orderRepository(),
          )..add(LoadOrderList()),
        )
      ],
      child: OrderDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _orderOverviewBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderOverviewListBloc>(
          create: (context) => OrderOverviewListBloc(
            orderOverviewRepository: orderOverviewRepository(),
          )..add(LoadOrderOverviewList()),
        )
      ],
      child: OrderOverviewDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _payBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayListBloc>(
          create: (context) => PayListBloc(
            payRepository: payRepository(),
          )..add(LoadPayList()),
        )
      ],
      child: PayDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _payConfirmationBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayConfirmationListBloc>(
          create: (context) => PayConfirmationListBloc(
            payConfirmationRepository: payConfirmationRepository(),
          )..add(LoadPayConfirmationList()),
        )
      ],
      child: PayConfirmationDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _productBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(
            productRepository: productRepository(),
          )..add(LoadProductList()),
        )
      ],
      child: ProductDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _shopBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopListBloc>(
          create: (context) => ShopListBloc(
            shopRepository: shopRepository(),
          )..add(LoadShopList()),
        )
      ],
      child: ShopDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _shopFrontBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopFrontListBloc>(
          create: (context) => ShopFrontListBloc(
            shopFrontRepository: shopFrontRepository(),
          )..add(LoadShopFrontList()),
        )
      ],
      child: ShopFrontDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

}


