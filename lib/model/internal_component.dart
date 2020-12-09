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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
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
  Widget createNew({String id, Map<String, Object> parameters}) {
    return ListComponent(componentId: id);
  }
}


typedef DropdownButtonChanged(String value);

class DropdownButtonComponentFactory implements ComponentDropDown {

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

  Widget createNew({String id, Map<String, Object> parameters, String value, DropdownButtonChanged trigger, bool optional}) {

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

    if (id == "productDisplays")
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

  Widget initWidget() {
    if (componentId == 'carts') widget = CartListWidget();
    if (componentId == 'orders') widget = OrderListWidget();
    if (componentId == 'orderOverviews') widget = OrderOverviewListWidget();
    if (componentId == 'pays') widget = PayListWidget();
    if (componentId == 'payConfirmations') widget = PayConfirmationListWidget();
    if (componentId == 'products') widget = ProductListWidget();
    if (componentId == 'productDisplays') widget = ProductDisplayListWidget();
    if (componentId == 'shops') widget = ShopListWidget();
    if (componentId == 'shopFronts') widget = ShopFrontListWidget();
  }

  Widget _cartBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartListBloc>(
          create: (context) => CartListBloc(
            
            cartRepository: cartRepository(appId: AccessBloc.appId(context)),
          )..add(LoadCartList()),
        )
      ],
      child: widget,
    );
  }

  Widget _orderBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderListBloc>(
          create: (context) => OrderListBloc(
            
            orderRepository: orderRepository(appId: AccessBloc.appId(context)),
          )..add(LoadOrderList()),
        )
      ],
      child: widget,
    );
  }

  Widget _orderOverviewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderOverviewListBloc>(
          create: (context) => OrderOverviewListBloc(
            
            orderOverviewRepository: orderOverviewRepository(appId: AccessBloc.appId(context)),
          )..add(LoadOrderOverviewList()),
        )
      ],
      child: widget,
    );
  }

  Widget _payBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayListBloc>(
          create: (context) => PayListBloc(
            
            payRepository: payRepository(appId: AccessBloc.appId(context)),
          )..add(LoadPayList()),
        )
      ],
      child: widget,
    );
  }

  Widget _payConfirmationBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayConfirmationListBloc>(
          create: (context) => PayConfirmationListBloc(
            
            payConfirmationRepository: payConfirmationRepository(appId: AccessBloc.appId(context)),
          )..add(LoadPayConfirmationList()),
        )
      ],
      child: widget,
    );
  }

  Widget _productBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(
            
            productRepository: productRepository(appId: AccessBloc.appId(context)),
          )..add(LoadProductList()),
        )
      ],
      child: widget,
    );
  }

  Widget _productDisplayBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductDisplayListBloc>(
          create: (context) => ProductDisplayListBloc(
            
            productDisplayRepository: productDisplayRepository(appId: AccessBloc.appId(context)),
          )..add(LoadProductDisplayList()),
        )
      ],
      child: widget,
    );
  }

  Widget _shopBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopListBloc>(
          create: (context) => ShopListBloc(
            
            shopRepository: shopRepository(appId: AccessBloc.appId(context)),
          )..add(LoadShopList()),
        )
      ],
      child: widget,
    );
  }

  Widget _shopFrontBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopFrontListBloc>(
          create: (context) => ShopFrontListBloc(
            
            shopFrontRepository: shopFrontRepository(appId: AccessBloc.appId(context)),
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
            
            cartRepository: cartRepository(appId: AccessBloc.appId(context)),
          )..add(LoadCartList()),
        )
      ],
      child: CartDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _orderBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderListBloc>(
          create: (context) => OrderListBloc(
            
            orderRepository: orderRepository(appId: AccessBloc.appId(context)),
          )..add(LoadOrderList()),
        )
      ],
      child: OrderDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _orderOverviewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderOverviewListBloc>(
          create: (context) => OrderOverviewListBloc(
            
            orderOverviewRepository: orderOverviewRepository(appId: AccessBloc.appId(context)),
          )..add(LoadOrderOverviewList()),
        )
      ],
      child: OrderOverviewDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _payBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayListBloc>(
          create: (context) => PayListBloc(
            
            payRepository: payRepository(appId: AccessBloc.appId(context)),
          )..add(LoadPayList()),
        )
      ],
      child: PayDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _payConfirmationBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayConfirmationListBloc>(
          create: (context) => PayConfirmationListBloc(
            
            payConfirmationRepository: payConfirmationRepository(appId: AccessBloc.appId(context)),
          )..add(LoadPayConfirmationList()),
        )
      ],
      child: PayConfirmationDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _productBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(
            
            productRepository: productRepository(appId: AccessBloc.appId(context)),
          )..add(LoadProductList()),
        )
      ],
      child: ProductDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _productDisplayBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductDisplayListBloc>(
          create: (context) => ProductDisplayListBloc(
            
            productDisplayRepository: productDisplayRepository(appId: AccessBloc.appId(context)),
          )..add(LoadProductDisplayList()),
        )
      ],
      child: ProductDisplayDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _shopBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopListBloc>(
          create: (context) => ShopListBloc(
            
            shopRepository: shopRepository(appId: AccessBloc.appId(context)),
          )..add(LoadShopList()),
        )
      ],
      child: ShopDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _shopFrontBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopFrontListBloc>(
          create: (context) => ShopFrontListBloc(
            
            shopFrontRepository: shopFrontRepository(appId: AccessBloc.appId(context)),
          )..add(LoadShopFrontList()),
        )
      ],
      child: ShopFrontDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

}


