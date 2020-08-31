import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_event.dart';
import 'package:eliud_pkg_shop/bloc/cart/member_extension.dart';

class PostLoginAddProduct extends PostLoginAction {
  final CartBloc cartBloc;
  final CartEvent event;

  PostLoginAddProduct(this.cartBloc, this.event);

  void runTheAction() {
    cartBloc.add(event);
  }
}

class CartTools {
  static void addToCart(BuildContext context, ActionModel continueShoppingAction, ProductModel product, int amount) {
    _runEvent(context, AddProduct(amount, product, continueShoppingAction));
  }

  static void subtractFromCart(BuildContext context, ProductModel product, int amount) {
    _runEvent(context, RemoveProduct(amount, product));
  }

  static void _runEvent(BuildContext context, CartEvent event) {
    if (GlobalData.member() == null) {
      BlocProvider.of<AccessBloc>(context).add(LoginEvent(actions: PostLoginAddProduct(BlocProvider.of<CartBloc>(context), event)));
    } else {
      BlocProvider.of<CartBloc>(context).add(event);
    }
  }
}
