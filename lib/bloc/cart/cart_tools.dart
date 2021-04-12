import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_event.dart';

class PostLoginAddProduct extends PostLoginAction {
  final CartBloc cartBloc;
  final CartEvent event;

  PostLoginAddProduct(this.cartBloc, this.event);

  @override
  void runTheAction() {
    cartBloc.add(event);
  }
}

class CartTools {
  static void addToCart(BuildContext context, ActionModel? continueShoppingAction, ProductModel? product, int amount) {
    print("addToCart 1");
    _runEvent(context, AddProduct(amount, product, continueShoppingAction));
  }

  static void subtractFromCart(BuildContext context, ProductModel product, int amount) {
    _runEvent(context, RemoveProduct(amount, product));
  }

  static void _runEvent(BuildContext context, CartEvent event) {
    print("runEvent ");
    var state = AccessBloc.getState(context);
    if (state is LoggedIn) {
      BlocProvider.of<CartBloc>(context).add(event);
    } else {
      BlocProvider.of<AccessBloc>(context).add(LoginEvent(actions: PostLoginAddProduct(BlocProvider.of<CartBloc>(context), event)));
    }
  }
}
