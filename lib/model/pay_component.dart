/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/pay_component_bloc.dart';
import 'package:eliud_pkg_shop/model/pay_component_event.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';
import 'package:eliud_pkg_shop/model/pay_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

/*
 * AbstractPayComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractPayComponent extends StatelessWidget {
  static String componentName = "pays";
  final AppModel app;
  final String payId;

  /*
   * Construct AbstractPayComponent
   */
  AbstractPayComponent({super.key, required this.app, required this.payId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PayComponentBloc>(
      create: (context) =>
          PayComponentBloc(payRepository: payRepository(appId: app.documentID)!)
            ..add(FetchPayComponent(id: payId)),
      child: _payBlockBuilder(context),
    );
  }

  Widget _payBlockBuilder(BuildContext context) {
    return BlocBuilder<PayComponentBloc, PayComponentState>(
        builder: (context, state) {
      if (state is PayComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is PayComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PayComponentError) {
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
  Widget yourWidget(BuildContext context, PayModel value);
}
