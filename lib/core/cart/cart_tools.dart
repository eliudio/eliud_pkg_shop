import 'package:eliud_model/core/access/bloc/access_bloc.dart';
import 'package:eliud_model/core/access/bloc/access_event.dart';
import 'package:eliud_model/core/global_data.dart';
import 'package:eliud_model/model/app_model.dart';
import 'package:eliud_model/model/member_model.dart';
import 'package:eliud_model/model/product_model.dart';
import 'package:eliud_model/model/shop_front_model.dart';
import 'package:eliud_model/shared/action_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_model/core/cart/cart_bloc.dart';

import 'cart_event.dart';

class CartTools {
  static bool hasItems(AppModel app, MemberModel member) {
    if (app == null) return false;
    if (!(app is AppModel))
      return false;
    if (member == null) return false;
    if (member.items == null) return false;
    if (member.items.isEmpty) return false;
    var found = false;
    member.items.forEach((element) {
      if ((element.product) == null) {
        // this is possible when a member returns, still having products in his basket, which now do not exist in the shop any more. Ignore. Actually, at some point we should get rid of these, perhaps even informing the member of these products. Anyway... for now we ignore
      } else {
        if (element.product.appId == app.documentID) {
          found = true;
        }
      }
    });
    return found;
  }

  static void addToCart(BuildContext context, ActionModel continueShoppingAction, ProductModel product, int amount) {
    _runEvent(context, AddProduct(amount, product, continueShoppingAction));
  }

  static void subtractFromCart(BuildContext context, ProductModel product, int amount) {
    _runEvent(context, RemoveProduct(amount, product));
  }

  static void _runEvent(BuildContext context, CartEvent event) {
    if (GlobalData.member() == null) {
      BlocProvider.of<AccessBloc>(context).add(LoginEvent(event: event));
    } else {
      BlocProvider.of<CartBloc>(context).add(event);
    }
  }

  static double totalValue() {
    if (!hasItems(GlobalData.app(), GlobalData.member())) return 0;
    double value = GlobalData.member().items.map((item) => item.amount * (item.product != null ? item.product.price : 0)).reduce((value, element) => value + element);
    return value;
  }

  static int amountOfProducts() {
    if (GlobalData.member() == null) return 0;
    if (GlobalData.member().items == null) return 0;
    if (GlobalData.member().items.length == 0) return 0;
    return GlobalData.member().items.map((item) => item.amount).reduce((value, element) => value + element);
  }
}
