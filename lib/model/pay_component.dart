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

import 'package:eliud_pkg_shop/model/pay_component_bloc.dart';
import 'package:eliud_pkg_shop/model/pay_component_event.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';
import 'package:eliud_pkg_shop/model/pay_repository.dart';
import 'package:eliud_pkg_shop/model/pay_component_state.dart';

abstract class AbstractPayComponent extends StatelessWidget {
  static String componentName = "pays";
  final String payID;

  AbstractPayComponent({this.payID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PayBloc> (
          create: (context) => PayBloc(
            payRepository: getPayRepository())
        ..add(FetchPay(id: payID)),
      child: _payBlockBuilder(context),
    );
  }

  Widget _payBlockBuilder(BuildContext context) {
    return BlocBuilder<PayBloc, PayState>(builder: (context, state) {
      if (state is PayLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No pay defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PayError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PayModel value);
  Widget alertWidget({ title: String, content: String});
  PayRepository getPayRepository();
}


