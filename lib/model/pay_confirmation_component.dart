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

import 'pay_confirmation_component_bloc.dart';
import 'pay_confirmation_component_event.dart';
import 'pay_confirmation_model.dart';
import 'pay_confirmation_repository.dart';
import 'pay_confirmation_component_state.dart';

abstract class AbstractPayConfirmationComponent extends StatelessWidget {
  static String componentName = "payConfirmations";
  final String payConfirmationID;

  AbstractPayConfirmationComponent({this.payConfirmationID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PayConfirmationBloc> (
          create: (context) => PayConfirmationBloc(
            payConfirmationRepository: getPayConfirmationRepository())
        ..add(FetchPayConfirmation(id: payConfirmationID)),
      child: _payConfirmationBlockBuilder(context),
    );
  }

  Widget _payConfirmationBlockBuilder(BuildContext context) {
    return BlocBuilder<PayConfirmationBloc, PayConfirmationState>(builder: (context, state) {
      if (state is PayConfirmationLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No payConfirmation defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PayConfirmationError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PayConfirmationModel value);
  Widget alertWidget({ title: String, content: String});
  PayConfirmationRepository getPayConfirmationRepository();
}


