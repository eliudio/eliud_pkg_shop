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

import 'shop_front_component_bloc.dart';
import 'shop_front_component_event.dart';
import 'shop_front_model.dart';
import 'shop_front_repository.dart';
import 'shop_front_component_state.dart';

abstract class AbstractShopFrontComponent extends StatelessWidget {
  static String componentName = "shopFronts";
  final String shopFrontID;

  AbstractShopFrontComponent({this.shopFrontID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopFrontBloc> (
          create: (context) => ShopFrontBloc(
            shopFrontRepository: getShopFrontRepository())
        ..add(FetchShopFront(id: shopFrontID)),
      child: _shopFrontBlockBuilder(context),
    );
  }

  Widget _shopFrontBlockBuilder(BuildContext context) {
    return BlocBuilder<ShopFrontBloc, ShopFrontState>(builder: (context, state) {
      if (state is ShopFrontLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No shopFront defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is ShopFrontError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, ShopFrontModel value);
  Widget alertWidget({ title: String, content: String});
  ShopFrontRepository getShopFrontRepository();
}


