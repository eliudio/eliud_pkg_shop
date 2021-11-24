/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_shop/model/cart_component_bloc.dart';
import 'package:eliud_pkg_shop/model/cart_component_event.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:eliud_pkg_shop/model/cart_repository.dart';
import 'package:eliud_pkg_shop/model/cart_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractCartComponent extends StatelessWidget {
  static String componentName = "carts";
  final String theAppId;
  final String cartId;

  AbstractCartComponent({Key? key, required this.theAppId, required this.cartId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartComponentBloc> (
          create: (context) => CartComponentBloc(
            cartRepository: cartRepository(appId: theAppId)!)
        ..add(FetchCartComponent(id: cartId)),
      child: _cartBlockBuilder(context),
    );
  }

  Widget _cartBlockBuilder(BuildContext context) {
    return BlocBuilder<CartComponentBloc, CartComponentState>(builder: (context, state) {
      if (state is CartComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Cart defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is CartComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is CartComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, CartModel value);
}

