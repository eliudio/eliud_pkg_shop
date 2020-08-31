/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_pkg_shop/model/cart_component_bloc.dart';
import 'package:eliud_pkg_shop/model/cart_component_event.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:eliud_pkg_shop/model/cart_repository.dart';
import 'package:eliud_pkg_shop/model/cart_component_state.dart';

abstract class AbstractCartComponent extends StatelessWidget {
  static String componentName = "carts";
  final String cartID;

  AbstractCartComponent({this.cartID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc> (
          create: (context) => CartBloc(
            cartRepository: getCartRepository())
        ..add(FetchCart(id: cartID)),
      child: _cartBlockBuilder(context),
    );
  }

  Widget _cartBlockBuilder(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No cart defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is CartError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, CartModel value);
  Widget alertWidget({ title: String, content: String});
  CartRepository getCartRepository();
}


