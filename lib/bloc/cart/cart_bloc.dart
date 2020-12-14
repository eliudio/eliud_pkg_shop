
import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/router.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/bloc/cart/member_extension.dart';

import 'cart_event.dart';
import 'cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  final NavigatorBloc navigatorBloc;
  final AccessBloc accessBloc;

  CartBloc(this.navigatorBloc, this.accessBloc): super(CartUninitialised());

  List<CartItemModel> copyListAndChangeAmount(
      List<CartItemModel> original, ProductModel product, int changeBy) {
    var copy = ListTool.copyAllExcept(
        original, (t) => ((t.product!= null) && (t.product.documentID == product.documentID) && (t.appId == product.appId)));
    CartItemModel cartItemModel;
    original.forEach((element) {
      if ((element.product != null) && (element.product.documentID == product.documentID) && (element.appId == product.appId)) cartItemModel = element;
    });

    CartItemModel newCartItem;
    if (cartItemModel == null) {
      if (changeBy <= 0) return null;

      newCartItem = CartItemModel(
          documentID: newRandomKey(), product: product, amount: changeBy, appId: product.appId);
    } else {
      newCartItem =
          cartItemModel.copyWith(amount: cartItemModel.amount + changeBy);
    }
    if (newCartItem.amount > 0) {
      copy.add(newCartItem);
    }
    return copy;
  }

  Future<void> updateCartChangeAmount(LoggedIn accessState, ProductModel product, int amount) async {
    var member = accessState.member;
    if (member != null) {
      var items = await member.items();

      var newItems = copyListAndChangeAmount(
          items, product, amount);
      var newMember = member.copyWithItems(newItems);
      await memberRepository()
          .update(newMember);

      accessBloc.add(MemberUpdated(newMember));
    }
  }

  Future<void> emptyCart(LoggedIn accessState, ) async {
    var member = accessState.member;
    if (member != null) {
      var newMember = member.copyWithItems([]);
      await memberRepository()
          .update(newMember);
      accessBloc.add(MemberUpdated(newMember));
    }
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    var accessState = accessBloc.state;
    if (accessState is LoggedIn) {
      var member = accessState.member;
      if (event is LoadCart) {
        // load cart for this user which is in globaldata. However, the cart is part of the user and hence already loaded
        yield CartInitialised(await member.items());
      } else {
        if (event is AddProduct) {
          await updateCartChangeAmount(accessState, event.product, event.amount);
          Router.navigateToPage(navigatorBloc, event.continueShoppingAction);
          yield CartInitialised(await member.items());
        } else if (event is SimpleAddProduct) {
          await updateCartChangeAmount(accessState, event.product, event.amount);
          yield CartInitialised(await member.items());
        } else if (event is RemoveProduct) {
          await updateCartChangeAmount(accessState, event.product, -event.amount);
          yield CartInitialised(await member.items());
        } else if (event is EmptyCart) {
          await emptyCart(accessState);
          yield CartInitialised(await member.items());
        }
      }
    }
  }

}


