import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/global_data.dart';
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

import 'package:eliud_pkg_shop/bloc/cart/member_extension.dart';

import 'package:intl/intl.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  static DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  final CartBloc cartBloc;

  PaymentBloc(this.cartBloc): super(PayUninitialised());

  bool _allInStock() {
    // TODO: verify if all products are in stock. If not, inform the customer that one of those items has been sold.
    return true;
  }

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is CollectOrder) {
      // The payment screen is opened. We create an OrderModel instance in membory
        if (!GlobalData.isLoggedOn()) {
          yield NotLoggedOn();
          return;
        } else {
          List<CartItemModel> items = await GlobalData.member().items();
          if (items.isEmpty) {
            yield NoItemsInCart();
            return;
          } else {
            yield ConfirmOrder(await _getNewOrder(event.shop, items));
            return;
          }
        }
    } else if (event is PayTheOrder) {
      // The "Pay" button has been pressed. We store the OrderModel
      var newOrder = event.order.copyWith(status: OrderStatus.Ordered, timeStamp: dateFormat.format(DateTime.now()));
      // At this point the order has been intended to be paid.
      // If it fails from this point on, then it's possible that the payment succeeded but that the payment was not registered in the db
      // In this case, basically you need to match the stripe payments against the registered payments. If you miss one,
      // then you need to find an unpaid order which is the matched one. If you can't find it, refund the customer.
      if (_allInStock()) {
        try {
          await AbstractRepositorySingleton.singleton.orderRepository().add(
              newOrder);
        } catch (error) {
          debugPrint('error');
          debugPrint(error.toString());
        }
        var po = PayOrder(order: newOrder);
        yield po;
        return;
      } else {
        // TODO: make sure the newOrder only contains products that are in stock
        yield LackOfStock(order: newOrder);
        return;
      }
    } else if (event is PaymentDoneWithSuccess) {
      var newOrder = event.order.copyWith(status: OrderStatus.Paid, timeStamp: dateFormat.format(DateTime.now()), paymentReference: event.reference);
      try {
        await AbstractRepositorySingleton.singleton.orderRepository().update(newOrder);
      } catch (error) {
        debugPrint('error' + error.toString());
      }

      cartBloc.add(EmptyCart());
      // TODO: update stock
      yield OrderPaid(order: newOrder);
      return;
    } else if (event is PaymentDoneWithFailure) {
      var newOrder = event.order.copyWith(status: OrderStatus.PaymentFailed, paymentNote: event.msg, timeStamp: dateFormat.format(DateTime.now()));
      yield PaymentFailed(order: newOrder, msg: event.msg);
      return;
    } else {
      debugPrint('something else... but what?');
    }
  }

  Future<OrderModel> _getNewOrder(ShopModel shop, List<CartItemModel> items) async {
    List<CartItemModel> items = await GlobalData
        .member().items();
    double totalValue = CartHelper.totalValue(items);
    return OrderModel(
        documentID: newRandomKey(),
        appId: GlobalData
            .app()
            .documentID,
        customer: GlobalData.member(),
        timeStamp: dateFormat.format(DateTime.now()),
        name: GlobalData
            .member()
            .name,
        email: GlobalData
            .member()
            .email,
        shipStreet1: GlobalData
            .member()
            .shipStreet1,
        shipStreet2: GlobalData
            .member()
            .shipStreet2,
        shipCity: GlobalData
            .member()
            .shipCity,
        shipState: GlobalData
            .member()
            .shipState,
        postcode: GlobalData
            .member()
            .postcode,
        country: GlobalData
            .member()
            .country,
        invoiceSame: GlobalData
            .member()
            .invoiceSame,
        invoiceStreet1: GlobalData
            .member()
            .invoiceStreet1,
        invoiceStreet2: GlobalData
            .member()
            .invoiceStreet2,
        invoiceCity: GlobalData
            .member()
            .invoiceCity,
        invoiceState: GlobalData
            .member()
            .invoiceState,
        invoicePostcode: GlobalData
            .member()
            .invoicePostcode,
        invoiceCountry: GlobalData
            .member()
            .invoiceCountry,
        status: OrderStatus.Ordered,
        currency: shop.currency,
        products: items
            .map((item) =>
            OrderItemModel(
                documentID: item.documentID,
                amount: item.amount,
                appId: item.appId,
                soldPrice: item.product.price,
                product: item.product))
            .toList(),
        totalPrice: totalValue);
  }
}
