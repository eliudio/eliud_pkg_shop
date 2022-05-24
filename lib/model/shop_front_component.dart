/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_shop/model/shop_front_component_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_front_component_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_repository.dart';
import 'package:eliud_pkg_shop/model/shop_front_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractShopFrontComponent extends StatelessWidget {
  static String componentName = "shopFronts";
  final AppModel app;
  final String shopFrontId;

  AbstractShopFrontComponent({Key? key, required this.app, required this.shopFrontId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopFrontComponentBloc> (
          create: (context) => ShopFrontComponentBloc(
            shopFrontRepository: shopFrontRepository(appId: app.documentID)!)
        ..add(FetchShopFrontComponent(id: shopFrontId)),
      child: _shopFrontBlockBuilder(context),
    );
  }

  Widget _shopFrontBlockBuilder(BuildContext context) {
    return BlocBuilder<ShopFrontComponentBloc, ShopFrontComponentState>(builder: (context, state) {
      if (state is ShopFrontComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No ShopFront defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is ShopFrontComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is ShopFrontComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, ShopFrontModel value);
}

