import 'package:bloc/bloc.dart';
import 'package:eliud_model/core/access/bloc/access_details.dart';
import 'package:eliud_model/core/access/bloc/access_state.dart';
import 'package:eliud_model/core/components/page_constructors/bottom_navigation_bar_constructor.dart';
import 'package:eliud_model/core/global_data.dart';
import 'package:eliud_model/core/navigate/navigate_bloc.dart';
import 'package:eliud_model/core/navigate/navigation_event.dart';
import 'package:eliud_model/core/navigate/router.dart';
import 'package:eliud_model/model/cart_item_model.dart';
import 'package:eliud_model/model/member_model.dart';
import 'package:eliud_model/model/product_model.dart';
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
import 'package:eliud_model/tools/etc.dart';
import 'package:eliud_model/tools/random.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final NavigatorBloc navigatorBloc;

  CartBloc(this.navigatorBloc): super(CartUninitialised());

  List<CartItemModel> copyListAndChangeAmount(
      List<CartItemModel> original, ProductModel product, int changeBy) {
    List<CartItemModel> copy = ListTool.copyAllExcept(
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
    if (newCartItem.amount > 0)
      copy.add(newCartItem);
    return copy;
  }

  Future<void> updateCartChangeAmount(ProductModel product, int amount) async {
    MemberModel member = GlobalData.member();
    if (member != null) {
      List<CartItemModel> newItems = copyListAndChangeAmount(
          member.items, product, amount);
      MemberModel newMember = member.copyWith(items: newItems);
      await AbstractRepositorySingleton.singleton
          .memberRepository()
          .update(newMember);
      AccessState accessState = GlobalData.state();
      if (accessState is LoggedIn) {
        AccessDetails details = await AccessDetails().init(newMember, GlobalData.app());
        GlobalData.init(accessState.copyWith(member: newMember, details: details));
      }
    }
  }

  Future<void> emptyCart() async {
    MemberModel member = GlobalData.member();
    if (member != null) {
      MemberModel newMember = member.copyWith(items: []);
      await AbstractRepositorySingleton.singleton
          .memberRepository()
          .update(newMember);
      AccessState accessState = GlobalData.state();
      if (accessState is LoggedIn) {
        AccessDetails details = await AccessDetails().init(newMember, GlobalData.app());
        GlobalData.init(accessState.copyWith(member: newMember, details: details));
      }
    }
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    CartState currentState = state;
    if (event is LoadCart) {
      // load cart for this user which is in globaldata. However, the cart is part of the user and hence already loaded
      yield CartInitialised();
    } else {
      if (event is AddProduct) {
        await updateCartChangeAmount(event.product, event.amount);
        Router.navigateToPage(navigatorBloc, event.continueShoppingAction);
        yield CartInitialised();
      } else if (event is SimpleAddProduct) {
        await updateCartChangeAmount(event.product, event.amount);
        yield CartInitialised();
      } else if (event is RemoveProduct) {
        await updateCartChangeAmount(event.product, -event.amount);
        yield CartInitialised();
      } else if (event is EmptyCart) {
        await emptyCart();
        yield CartInitialised();
      }
    }
  }
}
