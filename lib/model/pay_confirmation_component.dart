/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_pkg_shop/model/pay_confirmation_component_bloc.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component_event.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component_state.dart';

abstract class AbstractPayConfirmationComponent extends StatelessWidget {
  static String componentName = "payConfirmations";
  final String? payConfirmationID;

  AbstractPayConfirmationComponent({Key? key, this.payConfirmationID}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PayConfirmationComponentBloc> (
          create: (context) => PayConfirmationComponentBloc(
            payConfirmationRepository: getPayConfirmationRepository(context))
        ..add(FetchPayConfirmationComponent(id: payConfirmationID)),
      child: _payConfirmationBlockBuilder(context),
    );
  }

  Widget _payConfirmationBlockBuilder(BuildContext context) {
    return BlocBuilder<PayConfirmationComponentBloc, PayConfirmationComponentState>(builder: (context, state) {
      if (state is PayConfirmationComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No PayConfirmation defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PayConfirmationComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PayConfirmationComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PayConfirmationModel? value);
  Widget alertWidget({ title: String, content: String});
  PayConfirmationRepository getPayConfirmationRepository(BuildContext context);
}

