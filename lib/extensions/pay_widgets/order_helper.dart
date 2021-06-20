import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_pkg_shop/model/order_item_model.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:flutter/material.dart';

class OrderHelper {
  static Widget _getRow(
          BuildContext context, AppModel app, String title, String? value,
          {Widget? trailing}) =>
      ListTile(
        trailing: trailing,
        title: StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle().textStyle()
            .h4(context, title),
        subtitle: value != null
            ? StyleRegistry.registry()
                .styleWithContext(context)
                .frontEndStyle().textStyle()
                .text(context, value)
            : null,
      );

  static String _getShipAddress(OrderModel order) {
    var address = '';
    if (order.shipStreet1 != null)
      address = address + order.shipStreet1! + ', ';
    if (order.shipStreet2 != null)
      address = address + order.shipStreet2! + ', ';
    if (order.postcode != null) address = address + order.postcode! + ', ';
    if (order.shipCity != null) address = address + order.shipCity! + ', ';
    if (order.shipState != null) address = address + order.shipState! + ', ';
    if ((order.country != null) && (order.country!.countryName != null)) {
      if (order.country!.countryName == null)
        address = address + ', ';
      else
        address = address + order.country!.countryName! + ', ';
    }
    return address;
  }

  static String _getInvoiceAddress(OrderModel order) {
    var address = '';
    if (order.invoiceStreet1 != null) {
      address = address + order.invoiceStreet1! + ', ';
    }
    if (order.invoiceStreet2 != null) {
      address = address + order.invoiceStreet2! + ', ';
    }
    if (order.invoicePostcode != null) {
      address = address + order.invoicePostcode! + ', ';
    }
    if (order.invoiceCity != null)
      address = address + order.invoiceCity! + ', ';
    if (order.invoiceState != null)
      // ignore: curly_braces_in_flow_control_structures
      address = address + order.invoiceState! + ', ';
    if ((order.invoiceCountry != null) &&
        (order.invoiceCountry!.countryName != null)) {
      if (order.invoiceCountry!.countryName == null)
        address = address + ', ';
      else
        address = address + order.invoiceCountry!.countryName! + ', ';
    }
    return address;
  }

  static String _getProductDescription(OrderModel order, OrderItemModel oim) {
    return oim.amount.toString() +
        ' ' +
        oim.product!.title! +
        ' ' +
        oim.soldPrice.toString() +
        ' ' +
        order.currency!;
  }

  static List<Widget> addOrderOverviewBasics(BuildContext context, AppModel app,
      List<Widget> widgets, OrderModel order) {
    var frontEndStyle =
        StyleRegistry.registry().styleWithContext(context).frontEndStyle();
    widgets.add(_getRow(
        context, app, 'Contact:', order.name! + ', ' + order.email!,
        trailing: frontEndStyle.iconStyle().h1Icon2(context,
            iconData: Icons.contact_phone, semanticLabel: 'Contact')));
    widgets.add(_getRow(
        context,
        app,
        (order.invoiceSame != null) && (!order.invoiceSame!)
            ? 'Shipment address:'
            : 'Shipment & invoice address',
        _getShipAddress(order),
        trailing: frontEndStyle.iconStyle().h1Icon2(context,
            iconData: Icons.local_shipping, semanticLabel: 'Contact')));
    if ((order.invoiceSame != null) && (!order.invoiceSame!)) {
      widgets.add(_getRow(
          context, app, 'Invoice address:', _getInvoiceAddress(order),
          trailing: frontEndStyle.iconStyle().h1Icon2(context,
              iconData: Icons.note, semanticLabel: 'Contact')));
    }
    return widgets;
  }

  static List<Widget> addOrderOverviewBeforePayment(AppModel app,
      List<Widget> widgets, OrderModel order, BuildContext context) {
    addOrderOverviewBasics(context, app, widgets, order);
    _addProducts(app, widgets, order, context);
    return widgets;
  }

  static List<Widget> addOrderOverviewAfterPayment(AppModel app,
      List<Widget> widgets, OrderModel order, BuildContext context) {
    addOrderOverviewBasics(context, app, widgets, order);
    widgets.add(_getRow(
        context, app, 'Payment reference:', order.paymentReference,
        trailing: StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle()
            .iconStyle().h1Icon2(
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
        context, app, 'Products:', "These are the produts you're ordering",
        trailing: StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle()
            .iconStyle().h1Icon2(context, iconData: Icons.list, semanticLabel: 'Contact')));

    final theme = Theme.of(context);
    final style = theme.textTheme.bodyText2!
        .copyWith(color: theme.disabledColor, fontSize: 12.0);

    order.products!.forEach((element) {
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
    });

    widgets.add(_getRow(context, app, 'Total price:',
        order.totalPrice.toString() + ' ' + order.currency!,
        trailing: StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle()
            .iconStyle().h1Icon2(
              context,
              iconData: Icons.attach_money,
              semanticLabel: 'Total price',
            )));
    return widgets;
  }
}
