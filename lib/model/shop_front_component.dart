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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_pkg_shop/model/shop_front_component_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_front_component_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_repository.dart';
import 'package:eliud_pkg_shop/model/shop_front_component_state.dart';

abstract class AbstractShopFrontComponent extends StatelessWidget {
  static String componentName = "shopFronts";
  final String? shopFrontID;

  AbstractShopFrontComponent({this.shopFrontID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopFrontComponentBloc> (
          create: (context) => ShopFrontComponentBloc(
            shopFrontRepository: getShopFrontRepository(context))
        ..add(FetchShopFrontComponent(id: shopFrontID)),
      child: _shopFrontBlockBuilder(context),
    );
  }

  Widget _shopFrontBlockBuilder(BuildContext context) {
    return BlocBuilder<ShopFrontComponentBloc, ShopFrontComponentState>(builder: (context, state) {
      if (state is ShopFrontComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No ShopFront defined');
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
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, ShopFrontModel? value);
  Widget alertWidget({ title: String, content: String});
  ShopFrontRepository getShopFrontRepository(BuildContext context);
}

