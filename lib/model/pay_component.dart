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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_pkg_shop/model/pay_component_bloc.dart';
import 'package:eliud_pkg_shop/model/pay_component_event.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';
import 'package:eliud_pkg_shop/model/pay_repository.dart';
import 'package:eliud_pkg_shop/model/pay_component_state.dart';

abstract class AbstractPayComponent extends StatelessWidget {
  static String componentName = "pays";
  final String? payID;

  AbstractPayComponent({this.payID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PayComponentBloc> (
          create: (context) => PayComponentBloc(
            payRepository: getPayRepository(context))
        ..add(FetchPayComponent(id: payID)),
      child: _payBlockBuilder(context),
    );
  }

  Widget _payBlockBuilder(BuildContext context) {
    return BlocBuilder<PayComponentBloc, PayComponentState>(builder: (context, state) {
      if (state is PayComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No Pay defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PayComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PayComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PayModel? value);
  Widget alertWidget({ title: String, content: String});
  PayRepository getPayRepository(BuildContext context);
}

