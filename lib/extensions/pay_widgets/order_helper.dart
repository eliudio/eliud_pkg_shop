import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_icon.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_pkg_shop/model/order_item_model.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:flutter/material.dart';

class OrderHelper {
  static Widget _getRow(
          AppModel app, BuildContext context, String title, String? value,
          {Widget? trailing}) =>
      ListTile(
        trailing: trailing,
        title: h4(app, context, title),
        subtitle: value != null ? text(app, context, value) : null,
      );

  static String _getShipAddress(OrderModel order) {
    var address = '';
    if (order.shipStreet1 != null) {
      address = '$address${order.shipStreet1!}, ';
    }
    if (order.shipStreet2 != null) {
      address = '$address${order.shipStreet2!}, ';
    }
    if (order.postcode != null) address = '$address${order.postcode!}, ';
    if (order.shipCity != null) address = '$address${order.shipCity!}, ';
    if (order.shipState != null) address = '$address${order.shipState!}, ';
    if (order.country != null) address = '$address${order.country!}, ';
    return address;
  }

  static String _getInvoiceAddress(OrderModel order) {
    var address = '';
    if (order.invoiceStreet1 != null) {
      address = '$address${order.invoiceStreet1!}, ';
    }
    if (order.invoiceStreet2 != null) {
      address = '$address${order.invoiceStreet2!}, ';
    }
    if (order.invoicePostcode != null) {
      address = '$address${order.invoicePostcode!}, ';
    }
    if (order.invoiceCity != null) {
      address = '$address${order.invoiceCity!}, ';
    }
    if (order.invoiceState != null)
      // ignore: curly_braces_in_flow_control_structures
      address = '$address${order.invoiceState!}, ';
    if (order.invoiceCountry != null) {
      address = '$address${order.invoiceCountry!}, ';
    }

    return address;
  }

  static String _getProductDescription(OrderModel order, OrderItemModel oim) {
    return '${oim.amount} ${oim.product!.title!} ${oim.soldPrice} ${order.currency!}';
  }

  static List<Widget> addOrderOverviewBasics(AppModel app, BuildContext context,
      List<Widget> widgets, OrderModel order) {
    widgets.add(_getRow(
        app, context, 'Contact:', '${order.name!}, ${order.email!}',
        trailing: h1Icon2(app, context,
            iconData: Icons.contact_phone, semanticLabel: 'Contact')));
    widgets.add(_getRow(
        app,
        context,
        (order.invoiceSame != null) && (!order.invoiceSame!)
            ? 'Shipment address:'
            : 'Shipment & invoice address',
        _getShipAddress(order),
        trailing: h1Icon2(app, context,
            iconData: Icons.local_shipping, semanticLabel: 'Contact')));
    if ((order.invoiceSame != null) && (!order.invoiceSame!)) {
      widgets.add(_getRow(
          app, context, 'Invoice address:', _getInvoiceAddress(order),
          trailing: h1Icon2(app, context,
              iconData: Icons.note, semanticLabel: 'Contact')));
    }
    return widgets;
  }

  static List<Widget> addOrderOverviewBeforePayment(AppModel app,
      List<Widget> widgets, OrderModel order, BuildContext context) {
    addOrderOverviewBasics(app, context, widgets, order);
    _addProducts(app, widgets, order, context);
    return widgets;
  }

  static List<Widget> addOrderOverviewAfterPayment(AppModel app,
      List<Widget> widgets, OrderModel order, BuildContext context) {
    addOrderOverviewBasics(app, context, widgets, order);
    widgets
        .add(_getRow(app, context, 'Payment reference:', order.paymentReference,
            trailing: h1Icon2(
              app,
              context,
              iconData: Icons.payment,
              semanticLabel: 'Success',
            )));
    _addProducts(app, widgets, order, context);
    return widgets;
  }

  static List<Widget> _addProducts(AppModel app, List<Widget> widgets,
      OrderModel order, BuildContext context) {
    widgets.add(_getRow(
        app, context, 'Products:', "These are the produts you're ordering",
        trailing: h1Icon2(app, context,
            iconData: Icons.list, semanticLabel: 'Contact')));

    final theme = Theme.of(context);
    final style = theme.textTheme.bodyMedium!
        .copyWith(color: theme.disabledColor, fontSize: 12.0);

    for (var element in order.products!) {
      widgets.add(Row(children: [
        SizedBox(
          width: 20,
          child: null,
        ),
        AnimatedDefaultTextStyle(
          style: style,
          duration: kThemeChangeDuration,
          child: Row(children: [
            Icon(
              Icons.check_circle,
              color: theme.disabledColor,
              size: 12.0,
              semanticLabel: _getProductDescription(order, element),
            ),
            SizedBox(
              width: 12,
              child: null,
            ),
            Text(_getProductDescription(order, element))
          ]),
        )
      ]));
    }

    widgets.add(_getRow(
        app, context, 'Total price:', '${order.totalPrice} ${order.currency!}',
        trailing: h1Icon2(
          app,
          context,
          iconData: Icons.attach_money,
          semanticLabel: 'Total price',
        )));
    return widgets;
  }
}
