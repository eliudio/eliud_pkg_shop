import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_event.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_helper.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/bloc/payment_event.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/bloc/payment_state.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';
import 'package:eliud_pkg_shop/model/order_item_model.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  static DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  final CartBloc cartBloc;
  final AccessBloc accessBloc;
  final AppModel app;
  final ActionModel? succeededAction;

  bool _allInStock() {
    // TODO: verify if all products are in stock. If not, inform the customer that one of those items has been sold.
    return true;
  }

  Future<List<CartItemModel>?> getItems(
      String appId, MemberModel member) async {
    var cart = await memberCartRepository(appId: appId)!.get(member.documentID);
    return (cart != null) ? cart.cartItems : null;
  }

  PaymentBloc(this.app, this.cartBloc, this.accessBloc, this.succeededAction)
      : super(PayUninitialised()) {
    on<CollectOrder>((event, emit) async {
      // The payment screen is opened. We create an OrderModel instance in memory
      var accessState = accessBloc.state;
      if (accessState is LoggedIn) {
        var items = await (getItems(app.documentID, accessState.member));
        if ((items == null) || (items.isEmpty)) {
          emit(NoItemsInCart());
        } else {
          emit(ConfirmOrder(
              await _getNewOrder(accessState, event.shop!, items)));
        }
      } else {
        emit(NotLoggedOn());
      }
    });

    on<PayTheOrder>((event, emit) async {
      // The "Pay" button has been pressed. We store the OrderModel
      var newOrder = event.order.copyWith(
          status: OrderStatus.ordered,
          timeStamp: dateFormat.format(DateTime.now()));
      // At this point the order has been intended to be paid.
      // If it fails from this point on, then it's possible that the payment succeeded but that the payment was not registered in the db
      // In this case, basically you need to match the stripe payments against the registered payments. If you miss one,
      // then you need to find an unpaid order which is the matched one. If you can't find it, refund the customer.
      if (_allInStock()) {
        try {
          await AbstractRepositorySingleton.singleton
              .orderRepository(event.order.appId)!
              .add(newOrder);
        } catch (error) {
          debugPrint('error');
          debugPrint(error.toString());
        }
        emit(PayOrder(order: newOrder));
      } else {
        // TODO: make sure the newOrder only contains products that are in stock
        emit(LackOfStock(order: newOrder));
      }
    });

    on<PaymentDoneWithSuccess>((event, emit) async {
      var newOrder = event.order!.copyWith(
          status: OrderStatus.paid,
          timeStamp: dateFormat.format(DateTime.now()),
          paymentReference: event.reference);
      try {
        await AbstractRepositorySingleton.singleton
            .orderRepository(event.order!.appId)!
            .update(newOrder);
      } catch (error) {
        debugPrint('error$error');
      }

      cartBloc.add(EmptyCart());
      // TODO: update stock

      var parameters = <String, dynamic>{'orderId': newOrder.documentID};
      if (succeededAction != null) {
        var action = eliudrouter.Router.translate(succeededAction!,
            parameters: parameters);
        if (action != null) {
          accessBloc.add(action);
        }
      }

      emit(OrderPaid(order: newOrder));
    });

    on<PaymentDoneWithFailure>((event, emit) {
      var newOrder = event.order!.copyWith(
          status: OrderStatus.paymentFailed,
          paymentNote: event.msg,
          timeStamp: dateFormat.format(DateTime.now()));
      emit(PaymentFailed(order: newOrder, msg: event.msg));
    });
  }

  Future<OrderModel> _getNewOrder(
      LoggedIn loggedInState, ShopModel shop, List<CartItemModel> items) async {
    var items = await (getItems(app.documentID, loggedInState.member));
    double totalValue = items == null ? 0 : CartHelper.totalValue(items);
    return OrderModel(
        documentID: newRandomKey(),
        appId: app.documentID,
        customer: loggedInState.member,
        timeStamp: dateFormat.format(DateTime.now()),
        name: loggedInState.member.name,
        email: loggedInState.member.email,
        shipStreet1: loggedInState.member.shipStreet1,
        shipStreet2: loggedInState.member.shipStreet2,
        shipCity: loggedInState.member.shipCity,
        shipState: loggedInState.member.shipState,
        postcode: loggedInState.member.postcode,
        country: loggedInState.member.country,
        invoiceSame: loggedInState.member.invoiceSame,
        invoiceStreet1: loggedInState.member.invoiceStreet1,
        invoiceStreet2: loggedInState.member.invoiceStreet2,
        invoiceCity: loggedInState.member.invoiceCity,
        invoiceState: loggedInState.member.invoiceState,
        invoicePostcode: loggedInState.member.invoicePostcode,
        invoiceCountry: loggedInState.member.invoiceCountry,
        status: OrderStatus.ordered,
        currency: shop.currency,
        products: (items == null)
            ? null
            : items
                .map((item) => OrderItemModel(
                    documentID: item.documentID,
                    amount: item.amount,
                    appId: item.appId,
                    soldPrice: item.product!.price,
                    product: item.product))
                .toList(),
        totalPrice: totalValue);
  }
}
