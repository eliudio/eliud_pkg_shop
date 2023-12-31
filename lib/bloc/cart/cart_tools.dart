import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/access_event.dart';
import 'package:eliud_core/access/state/logged_in.dart';
import 'package:eliud_core/core/widgets/member_widgets/login_widget.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_event.dart';
import 'package:eliud_pkg_shop_model/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostLoginAddProduct extends PostLoginAction {
  final CartBloc cartBloc;
  final CartEvent event;

  PostLoginAddProduct(AppModel app, this.cartBloc, this.event)
      : super(app: app);

  @override
  void runTheAction() {
    cartBloc.add(event);
  }
}

class CartTools {
  static void addToCart(BuildContext context, AppModel app,
      ActionModel? continueShoppingAction, ProductModel? product, int amount) {
    _runEvent(
        context, app, AddProduct(amount, product, continueShoppingAction));
  }

  static void subtractFromCart(
      BuildContext context, AppModel app, ProductModel product, int amount) {
    _runEvent(context, app, RemoveProduct(amount, product));
  }

  static void _runEvent(BuildContext context, AppModel app, CartEvent event) {
    var state = AccessBloc.getState(context);
    if (state is LoggedIn) {
      BlocProvider.of<CartBloc>(context).add(event);
    } else {
      openLoginWidget(context, app,
          actions: PostLoginAddProduct(
              app, BlocProvider.of<CartBloc>(context), event));
    }
  }
}
