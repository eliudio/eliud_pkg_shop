/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_shop/model/product_component_bloc.dart';
import 'package:eliud_pkg_shop/model/product_component_event.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/product_repository.dart';
import 'package:eliud_pkg_shop/model/product_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractProductComponent extends StatelessWidget {
  static String componentName = "products";
  final String theAppId;
  final String productId;

  AbstractProductComponent({Key? key, required this.theAppId, required this.productId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductComponentBloc> (
          create: (context) => ProductComponentBloc(
            productRepository: productRepository(appId: theAppId)!)
        ..add(FetchProductComponent(id: productId)),
      child: _productBlockBuilder(context),
    );
  }

  Widget _productBlockBuilder(BuildContext context) {
    return BlocBuilder<ProductComponentBloc, ProductComponentState>(builder: (context, state) {
      if (state is ProductComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Product defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is ProductComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is ProductComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, ProductModel value);
}

