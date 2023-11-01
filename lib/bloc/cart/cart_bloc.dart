import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';
import 'package:eliud_pkg_shop/model/member_cart_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AccessBloc accessBloc;
  final String appId;

  List<CartItemModel>? _copyListAndChangeAmount(
      List<CartItemModel> original, ProductModel? product, int changeBy) {
    var copy = ListTool.copyAllExcept(
        original,
        (dynamic t) => ((t.product != null) &&
            (t.product.documentID == product!.documentID) &&
            (t.appId == product.appId)));
    CartItemModel? cartItemModel;
    original.forEach((element) {
      if ((element.product != null) &&
          (element.product!.documentID == product!.documentID) &&
          (element.appId == product.appId)) cartItemModel = element;
    });

    CartItemModel newCartItem;
    if (cartItemModel == null) {
      if (changeBy <= 0) return null;

      newCartItem = CartItemModel(
          documentID: newRandomKey(),
          product: product,
          amount: changeBy,
          appId: product!.appId);
    } else {
      newCartItem =
          cartItemModel!.copyWith(amount: cartItemModel!.amount! + changeBy);
    }
    if (newCartItem.amount! > 0) {
      copy.add(newCartItem);
    }
    return copy;
  }

  Future<void> _updateCartChangeAmount(
      LoggedIn accessState, ProductModel? product, int amount) async {
    var member = accessState.member;
    var cart =
        await memberCartRepository(appId: appId)!.get(member.documentID);
    List<CartItemModel>? items;
    if ((cart != null) && (cart.cartItems != null)) {
      items = cart.cartItems!;
      var newItems = _copyListAndChangeAmount(items, product, amount);
      await memberCartRepository(appId: appId)!
          .update(cart.copyWith(cartItems: newItems));
    } else {
      await memberCartRepository(appId: appId)!.add(MemberCartModel(
          documentID: member.documentID,
          appId: appId,
          cartItems: _copyListAndChangeAmount([], product, amount)));
    }
    }

  Future<void> _emptyCart(
    LoggedIn accessState,
  ) async {
    var member = accessState.member;
    var cart =
        await memberCartRepository(appId: appId)!.get(member.documentID);
    if (cart != null) {
      await memberCartRepository(appId: appId)!
          .update(cart.copyWith(cartItems: []));
    }
    }

  Future<CartInitialised> toEmit(LoggedIn accessState) async {
    var member = accessState.member;
    var cart = await memberCartRepository(appId: appId)!.get(member.documentID);
    return CartInitialised(cart != null ? cart.cartItems : null);
  }

  CartBloc(
    this.appId,
    this.accessBloc,
  ) : super(CartUninitialised()) {
    var accessState = accessBloc.state;
    on<LoadCart>((event, emit) async {
      if (accessState is LoggedIn) {
        emit(await toEmit(accessState));
      }
    });

    on<AddProduct>((event, emit) async {
      if (accessState is LoggedIn) {
        await _updateCartChangeAmount(accessState, event.product, event.amount);
        var action = event.continueShoppingAction!;
        if (action is GotoPage) {
          accessBloc.add(GotoPageEvent(
            action.app,
            action.pageID,
          ));
        } else {
          print('The continueShoppingAction is not a GotoPage action');
        }
        emit(await toEmit(accessState));
      }
    });

    on<SimpleAddProduct>((event, emit) async {
      if (accessState is LoggedIn) {
        await _updateCartChangeAmount(accessState, event.product, event.amount);
        emit(await toEmit(accessState));
      }
    });

    on<RemoveProduct>((event, emit) async {
      if (accessState is LoggedIn) {
        await _updateCartChangeAmount(
            accessState, event.product, -event.amount);
        emit(await toEmit(accessState));
      }
    });

    on<EmptyCart>((event, emit) async {
      if (accessState is LoggedIn) {
        await _emptyCart(accessState);
        emit(await toEmit(accessState));
      }
    });
  }
}
