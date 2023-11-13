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

import 'package:eliud_pkg_shop/model/product_display_component_bloc.dart';
import 'package:eliud_pkg_shop/model/product_display_component_event.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_display_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

/*
 * AbstractProductDisplayComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractProductDisplayComponent extends StatelessWidget {
  static String componentName = "productDisplays";
  final AppModel app;
  final String productDisplayId;

  /*
   * Construct AbstractProductDisplayComponent
   */
  AbstractProductDisplayComponent(
      {super.key, required this.app, required this.productDisplayId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDisplayComponentBloc>(
      create: (context) => ProductDisplayComponentBloc(
          productDisplayRepository:
              productDisplayRepository(appId: app.documentID)!)
        ..add(FetchProductDisplayComponent(id: productDisplayId)),
      child: _productDisplayBlockBuilder(context),
    );
  }

  Widget _productDisplayBlockBuilder(BuildContext context) {
    return BlocBuilder<ProductDisplayComponentBloc,
        ProductDisplayComponentState>(builder: (context, state) {
      if (state is ProductDisplayComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is ProductDisplayComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is ProductDisplayComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, ProductDisplayModel value);
}
