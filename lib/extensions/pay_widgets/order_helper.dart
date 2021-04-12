import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_shop/model/order_item_model.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:flutter/material.dart';

class OrderHelper {
  static Widget _getRow(AppModel app, String title, String? value, {Widget? trailing}) => ListTile(
        trailing: trailing,
        title: Text(title, style: FontTools.textStyle(app.h4)),
        subtitle: value != null ? Text(value, style: FontTools.textStyle(app.fontText)) : null,
      );

  static String _getShipAddress(OrderModel order) {
    var address = '';
    if (order.shipStreet1 != null) address = address + order.shipStreet1! + ', ';
    if (order.shipStreet2 != null) address = address + order.shipStreet2! + ', ';
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
    if (order.invoiceCity != null) address = address + order.invoiceCity! + ', ';
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

  static List<Widget> addOrderOverviewBasics(AppModel app, List<Widget> widgets, OrderModel order) {
    widgets.add(_getRow(app, 'Contact:', order.name! + ', ' + order.email!,
        trailing: Icon(
          Icons.contact_phone,
          color: RgbHelper.color(rgbo: app.iconColor),
          size: 50.0,
          semanticLabel: 'Contact',
        )));
    widgets.add(_getRow(app,
        (order.invoiceSame != null) && (!order.invoiceSame!) ? 'Shipment address:' : 'Shipment & invoice address',
        _getShipAddress(order),
        trailing: Icon(
          Icons.local_shipping,
          color: RgbHelper.color(rgbo: app.iconColor),
          size: 50.0,
          semanticLabel: 'Contact',
        )));
    if ((order.invoiceSame != null) && (!order.invoiceSame!)) {
      widgets.add(_getRow(app, 'Invoice address:', _getInvoiceAddress(order),
          trailing: Icon(
            Icons.note,
            color: RgbHelper.color(rgbo: app.iconColor),
            size: 50.0,
            semanticLabel: 'Contact',
          )));
    }
    return widgets;
  }

  static List<Widget> addOrderOverviewBeforePayment(AppModel app,
      List<Widget> widgets, OrderModel order, BuildContext context) {
    addOrderOverviewBasics(app, widgets, order);
    _addProducts(app, widgets, order, context);
    return widgets;
  }

  static List<Widget> addOrderOverviewAfterPayment(AppModel app,
      List<Widget> widgets, OrderModel order, BuildContext context) {
    addOrderOverviewBasics(app, widgets, order);
    widgets.add(_getRow(app, 'Payment reference:', order.paymentReference,
        trailing: Icon(
          Icons.payment,
          color: RgbHelper.color(rgbo: app.iconColor),
          size: 50.0,
          semanticLabel: 'Success',
        )));
    _addProducts(app, widgets, order, context);
    return widgets;
  }

  static List<Widget> _addProducts(AppModel app, List<Widget> widgets, OrderModel order, BuildContext context) {
    widgets.add(_getRow(app, 'Products:', "These are the produts you're ordering",
        trailing: Icon(
          Icons.list,
          color: RgbHelper.color(rgbo: app.iconColor),
          size: 50.0,
          semanticLabel: 'Contact',
        )));

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

    widgets.add(_getRow(app,
        'Total price:', order.totalPrice.toString() + ' ' + order.currency!,
        trailing: Icon(
          Icons.attach_money,
          color: RgbHelper.color(rgbo: app.iconColor),
          size: 50.0,
          semanticLabel: 'Total price',
        )));
    return widgets;
  }
}
