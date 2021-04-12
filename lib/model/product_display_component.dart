/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_pkg_shop/model/product_display_component_bloc.dart';
import 'package:eliud_pkg_shop/model/product_display_component_event.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_display_repository.dart';
import 'package:eliud_pkg_shop/model/product_display_component_state.dart';

abstract class AbstractProductDisplayComponent extends StatelessWidget {
  static String componentName = "productDisplays";
  final String? productDisplayID;

  AbstractProductDisplayComponent({this.productDisplayID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDisplayComponentBloc> (
          create: (context) => ProductDisplayComponentBloc(
            productDisplayRepository: getProductDisplayRepository(context))
        ..add(FetchProductDisplayComponent(id: productDisplayID)),
      child: _productDisplayBlockBuilder(context),
    );
  }

  Widget _productDisplayBlockBuilder(BuildContext context) {
    return BlocBuilder<ProductDisplayComponentBloc, ProductDisplayComponentState>(builder: (context, state) {
      if (state is ProductDisplayComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No ProductDisplay defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is ProductDisplayComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is ProductDisplayComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, ProductDisplayModel? value);
  Widget alertWidget({ title: String, content: String});
  ProductDisplayRepository getProductDisplayRepository(BuildContext context);
}

