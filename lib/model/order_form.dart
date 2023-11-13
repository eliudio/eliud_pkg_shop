/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_pkg_shop/model/embedded_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';

import 'package:eliud_pkg_shop/model/order_list_bloc.dart';
import 'package:eliud_pkg_shop/model/order_list_event.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/order_form_bloc.dart';
import 'package:eliud_pkg_shop/model/order_form_event.dart';
import 'package:eliud_pkg_shop/model/order_form_state.dart';

class OrderForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final OrderModel? value;
  final ActionModel? submitAction;

  OrderForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the OrderForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<OrderFormBloc>(
        create: (context) => OrderFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseOrderFormEvent(value: value)),
        child: _MyOrderForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<OrderFormBloc>(
        create: (context) => OrderFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseOrderFormNoLoadEvent(value: value)),
        child: _MyOrderForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Order'
                      : 'Add Order'),
          body: BlocProvider<OrderFormBloc>(
            create: (context) => OrderFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseOrderFormEvent(value: value)
                : InitialiseNewOrderFormEvent())),
            child: _MyOrderForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyOrderForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyOrderForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyOrderForm> createState() => _MyOrderFormState(formAction);
}

class _MyOrderFormState extends State<_MyOrderForm> {
  final FormAction? formAction;
  late OrderFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  String? _customer;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _shipStreet1Controller = TextEditingController();
  final TextEditingController _shipStreet2Controller = TextEditingController();
  final TextEditingController _shipCityController = TextEditingController();
  final TextEditingController _shipStateController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  bool? _invoiceSameSelection;
  final TextEditingController _invoiceStreet1Controller =
      TextEditingController();
  final TextEditingController _invoiceStreet2Controller =
      TextEditingController();
  final TextEditingController _invoiceCityController = TextEditingController();
  final TextEditingController _invoiceStateController = TextEditingController();
  final TextEditingController _invoicePostcodeController =
      TextEditingController();
  final TextEditingController _invoiceCountryController =
      TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _paymentReferenceController =
      TextEditingController();
  final TextEditingController _shipmentReferenceController =
      TextEditingController();
  final TextEditingController _deliveryReferenceController =
      TextEditingController();
  final TextEditingController _paymentNoteController = TextEditingController();
  final TextEditingController _shipmentNoteController = TextEditingController();
  final TextEditingController _deliveryNoteController = TextEditingController();
  int? _statusSelectedRadioTile;

  _MyOrderFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<OrderFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
    _emailController.addListener(_onEmailChanged);
    _shipStreet1Controller.addListener(_onShipStreet1Changed);
    _shipStreet2Controller.addListener(_onShipStreet2Changed);
    _shipCityController.addListener(_onShipCityChanged);
    _shipStateController.addListener(_onShipStateChanged);
    _postcodeController.addListener(_onPostcodeChanged);
    _countryController.addListener(_onCountryChanged);
    _invoiceSameSelection = false;
    _invoiceStreet1Controller.addListener(_onInvoiceStreet1Changed);
    _invoiceStreet2Controller.addListener(_onInvoiceStreet2Changed);
    _invoiceCityController.addListener(_onInvoiceCityChanged);
    _invoiceStateController.addListener(_onInvoiceStateChanged);
    _invoicePostcodeController.addListener(_onInvoicePostcodeChanged);
    _invoiceCountryController.addListener(_onInvoiceCountryChanged);
    _totalPriceController.addListener(_onTotalPriceChanged);
    _currencyController.addListener(_onCurrencyChanged);
    _paymentReferenceController.addListener(_onPaymentReferenceChanged);
    _shipmentReferenceController.addListener(_onShipmentReferenceChanged);
    _deliveryReferenceController.addListener(_onDeliveryReferenceChanged);
    _paymentNoteController.addListener(_onPaymentNoteChanged);
    _shipmentNoteController.addListener(_onShipmentNoteChanged);
    _deliveryNoteController.addListener(_onDeliveryNoteChanged);
    _statusSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<OrderFormBloc, OrderFormState>(
        builder: (context, state) {
      if (state is OrderFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is OrderFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        if (state.value!.customer != null) {
          _customer = state.value!.customer!.documentID;
        } else {
          _customer = "";
        }
        _nameController.text = state.value!.name.toString();
        _emailController.text = state.value!.email.toString();
        _shipStreet1Controller.text = state.value!.shipStreet1.toString();
        _shipStreet2Controller.text = state.value!.shipStreet2.toString();
        _shipCityController.text = state.value!.shipCity.toString();
        _shipStateController.text = state.value!.shipState.toString();
        _postcodeController.text = state.value!.postcode.toString();
        _countryController.text = state.value!.country.toString();
        if (state.value!.invoiceSame != null) {
          _invoiceSameSelection = state.value!.invoiceSame;
        } else {
          _invoiceSameSelection = false;
        }
        _invoiceStreet1Controller.text = state.value!.invoiceStreet1.toString();
        _invoiceStreet2Controller.text = state.value!.invoiceStreet2.toString();
        _invoiceCityController.text = state.value!.invoiceCity.toString();
        _invoiceStateController.text = state.value!.invoiceState.toString();
        _invoicePostcodeController.text =
            state.value!.invoicePostcode.toString();
        _invoiceCountryController.text = state.value!.invoiceCountry.toString();
        _totalPriceController.text = state.value!.totalPrice.toString();
        _currencyController.text = state.value!.currency.toString();
        _paymentReferenceController.text =
            state.value!.paymentReference.toString();
        _shipmentReferenceController.text =
            state.value!.shipmentReference.toString();
        _deliveryReferenceController.text =
            state.value!.deliveryReference.toString();
        _paymentNoteController.text = state.value!.paymentNote.toString();
        _shipmentNoteController.text = state.value!.shipmentNote.toString();
        _deliveryNoteController.text = state.value!.deliveryNote.toString();
        if (state.value!.status != null) {
          _statusSelectedRadioTile = state.value!.status!.index;
        } else {
          _statusSelectedRadioTile = 0;
        }
      }
      if (state is OrderFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Name',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _nameController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is NameOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'email',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _emailController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is EmailOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Customer')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "members",
              value: _customer,
              trigger: (value, privilegeLevel) => _onCustomerSelected(value),
              optional: false),
        );

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Products')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: orderItemsList(widget.app, context, state.value!.products,
                _onProductsChanged)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Total price')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Price',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _totalPriceController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is TotalPriceOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Currency',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _currencyController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is CurrencyOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'References')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Payment Reference',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _paymentReferenceController,
                keyboardType: TextInputType.text,
                validator: (_) => state is PaymentReferenceOrderFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Shipment Reference',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipmentReferenceController,
                keyboardType: TextInputType.text,
                validator: (_) => state is ShipmentReferenceOrderFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Dilvery Reference',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _deliveryReferenceController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DeliveryReferenceOrderFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Notes')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Payment Note',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _paymentNoteController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is PaymentNoteOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Shipment Note',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipmentNoteController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipmentNoteOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Dilvery Note',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _deliveryNoteController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DeliveryNoteOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Shipping Address')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Street Address',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipStreet1Controller,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipStreet1OrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Street Address Line 2',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipStreet2Controller,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipStreet2OrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'City',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipCityController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipCityOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'State/Province',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipStateController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipStateOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Postal / Zip Code',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _postcodeController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is PostcodeOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Shipping Country')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Country',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _countryController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is CountryOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!)) {
          children.add(Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: StyleRegistry.registry()
                  .styleWithApp(widget.app)
                  .adminFormStyle()
                  .groupTitle(widget.app, context, 'Invoice Address')));
        }

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'Invoice address same as shipping address',
                _invoiceSameSelection,
                _readOnly(accessState, state)
                    ? null
                    : (dynamic val) => setSelectionInvoiceSame(val)));

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'Street Address',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceStreet1Controller,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoiceStreet1OrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'Street Address Line 2',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceStreet2Controller,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoiceStreet2OrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'City',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceCityController,
                  keyboardType: TextInputType.text,
                  validator: (_) =>
                      state is InvoiceCityOrderFormError ? state.message : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'State/Province',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceStateController,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoiceStateOrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'Postal / Zip Code',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoicePostcodeController,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoicePostcodeOrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'Country',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceCountryController,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoiceCountryOrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!)) {
          children.add(Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: StyleRegistry.registry()
                  .styleWithApp(widget.app)
                  .adminFormStyle()
                  .groupTitle(widget.app, context, 'Invoice Country')));
        }

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Order Status')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'ordered',
                'ordered',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'paid',
                'paid',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'paymentFailed',
                'paymentFailed',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'shipped',
                'shipped',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'delivered',
                'delivered',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is OrderFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<OrderListBloc>(context)
                                .add(UpdateOrderList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              customer: state.value!.customer,
                              name: state.value!.name,
                              email: state.value!.email,
                              shipStreet1: state.value!.shipStreet1,
                              shipStreet2: state.value!.shipStreet2,
                              shipCity: state.value!.shipCity,
                              shipState: state.value!.shipState,
                              postcode: state.value!.postcode,
                              country: state.value!.country,
                              invoiceSame: state.value!.invoiceSame,
                              invoiceStreet1: state.value!.invoiceStreet1,
                              invoiceStreet2: state.value!.invoiceStreet2,
                              invoiceCity: state.value!.invoiceCity,
                              invoiceState: state.value!.invoiceState,
                              invoicePostcode: state.value!.invoicePostcode,
                              invoiceCountry: state.value!.invoiceCountry,
                              products: state.value!.products,
                              totalPrice: state.value!.totalPrice,
                              currency: state.value!.currency,
                              paymentReference: state.value!.paymentReference,
                              shipmentReference: state.value!.shipmentReference,
                              deliveryReference: state.value!.deliveryReference,
                              paymentNote: state.value!.paymentNote,
                              shipmentNote: state.value!.shipmentNote,
                              deliveryNote: state.value!.deliveryNote,
                              status: state.value!.status,
                              timeStamp: state.value!.timeStamp,
                            )));
                          } else {
                            BlocProvider.of<OrderListBloc>(context)
                                .add(AddOrderList(
                                    value: OrderModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              customer: state.value!.customer,
                              name: state.value!.name,
                              email: state.value!.email,
                              shipStreet1: state.value!.shipStreet1,
                              shipStreet2: state.value!.shipStreet2,
                              shipCity: state.value!.shipCity,
                              shipState: state.value!.shipState,
                              postcode: state.value!.postcode,
                              country: state.value!.country,
                              invoiceSame: state.value!.invoiceSame,
                              invoiceStreet1: state.value!.invoiceStreet1,
                              invoiceStreet2: state.value!.invoiceStreet2,
                              invoiceCity: state.value!.invoiceCity,
                              invoiceState: state.value!.invoiceState,
                              invoicePostcode: state.value!.invoicePostcode,
                              invoiceCountry: state.value!.invoiceCountry,
                              products: state.value!.products,
                              totalPrice: state.value!.totalPrice,
                              currency: state.value!.currency,
                              paymentReference: state.value!.paymentReference,
                              shipmentReference: state.value!.shipmentReference,
                              deliveryReference: state.value!.deliveryReference,
                              paymentNote: state.value!.paymentNote,
                              shipmentNote: state.value!.shipmentNote,
                              deliveryNote: state.value!.deliveryNote,
                              status: state.value!.status,
                              timeStamp: state.value!.timeStamp,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedOrderDocumentID(value: _documentIDController.text));
  }

  void _onCustomerSelected(String? val) {
    setState(() {
      _customer = val;
    });
    _myFormBloc.add(ChangedOrderCustomer(value: val));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedOrderName(value: _nameController.text));
  }

  void _onEmailChanged() {
    _myFormBloc.add(ChangedOrderEmail(value: _emailController.text));
  }

  void _onShipStreet1Changed() {
    _myFormBloc
        .add(ChangedOrderShipStreet1(value: _shipStreet1Controller.text));
  }

  void _onShipStreet2Changed() {
    _myFormBloc
        .add(ChangedOrderShipStreet2(value: _shipStreet2Controller.text));
  }

  void _onShipCityChanged() {
    _myFormBloc.add(ChangedOrderShipCity(value: _shipCityController.text));
  }

  void _onShipStateChanged() {
    _myFormBloc.add(ChangedOrderShipState(value: _shipStateController.text));
  }

  void _onPostcodeChanged() {
    _myFormBloc.add(ChangedOrderPostcode(value: _postcodeController.text));
  }

  void _onCountryChanged() {
    _myFormBloc.add(ChangedOrderCountry(value: _countryController.text));
  }

  void setSelectionInvoiceSame(bool? val) {
    setState(() {
      _invoiceSameSelection = val;
    });
    _myFormBloc.add(ChangedOrderInvoiceSame(value: val));
  }

  void _onInvoiceStreet1Changed() {
    _myFormBloc
        .add(ChangedOrderInvoiceStreet1(value: _invoiceStreet1Controller.text));
  }

  void _onInvoiceStreet2Changed() {
    _myFormBloc
        .add(ChangedOrderInvoiceStreet2(value: _invoiceStreet2Controller.text));
  }

  void _onInvoiceCityChanged() {
    _myFormBloc
        .add(ChangedOrderInvoiceCity(value: _invoiceCityController.text));
  }

  void _onInvoiceStateChanged() {
    _myFormBloc
        .add(ChangedOrderInvoiceState(value: _invoiceStateController.text));
  }

  void _onInvoicePostcodeChanged() {
    _myFormBloc.add(
        ChangedOrderInvoicePostcode(value: _invoicePostcodeController.text));
  }

  void _onInvoiceCountryChanged() {
    _myFormBloc
        .add(ChangedOrderInvoiceCountry(value: _invoiceCountryController.text));
  }

  void _onProductsChanged(value) {
    _myFormBloc.add(ChangedOrderProducts(value: value));
    setState(() {});
  }

  void _onTotalPriceChanged() {
    _myFormBloc.add(ChangedOrderTotalPrice(value: _totalPriceController.text));
  }

  void _onCurrencyChanged() {
    _myFormBloc.add(ChangedOrderCurrency(value: _currencyController.text));
  }

  void _onPaymentReferenceChanged() {
    _myFormBloc.add(
        ChangedOrderPaymentReference(value: _paymentReferenceController.text));
  }

  void _onShipmentReferenceChanged() {
    _myFormBloc.add(ChangedOrderShipmentReference(
        value: _shipmentReferenceController.text));
  }

  void _onDeliveryReferenceChanged() {
    _myFormBloc.add(ChangedOrderDeliveryReference(
        value: _deliveryReferenceController.text));
  }

  void _onPaymentNoteChanged() {
    _myFormBloc
        .add(ChangedOrderPaymentNote(value: _paymentNoteController.text));
  }

  void _onShipmentNoteChanged() {
    _myFormBloc
        .add(ChangedOrderShipmentNote(value: _shipmentNoteController.text));
  }

  void _onDeliveryNoteChanged() {
    _myFormBloc
        .add(ChangedOrderDeliveryNote(value: _deliveryNoteController.text));
  }

  void setSelectionStatus(int? val) {
    setState(() {
      _statusSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedOrderStatus(value: toOrderStatus(val)));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _shipStreet1Controller.dispose();
    _shipStreet2Controller.dispose();
    _shipCityController.dispose();
    _shipStateController.dispose();
    _postcodeController.dispose();
    _countryController.dispose();
    _invoiceStreet1Controller.dispose();
    _invoiceStreet2Controller.dispose();
    _invoiceCityController.dispose();
    _invoiceStateController.dispose();
    _invoicePostcodeController.dispose();
    _invoiceCountryController.dispose();
    _totalPriceController.dispose();
    _currencyController.dispose();
    _paymentReferenceController.dispose();
    _shipmentReferenceController.dispose();
    _deliveryReferenceController.dispose();
    _paymentNoteController.dispose();
    _shipmentNoteController.dispose();
    _deliveryNoteController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, OrderFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}

class OrderPaymentForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final OrderModel? value;
  final ActionModel? submitAction;

  OrderPaymentForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the OrderPaymentForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<OrderFormBloc>(
        create: (context) => OrderFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseOrderFormEvent(value: value)),
        child: _MyOrderPaymentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<OrderFormBloc>(
        create: (context) => OrderFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseOrderFormNoLoadEvent(value: value)),
        child: _MyOrderPaymentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Payment'
                      : 'Payment'),
          body: BlocProvider<OrderFormBloc>(
            create: (context) => OrderFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseOrderFormEvent(value: value)
                : InitialiseNewOrderFormEvent())),
            child: _MyOrderPaymentForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyOrderPaymentForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyOrderPaymentForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyOrderPaymentForm> createState() =>
      _MyOrderPaymentFormState(formAction);
}

class _MyOrderPaymentFormState extends State<_MyOrderPaymentForm> {
  final FormAction? formAction;
  late OrderFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _shipStreet1Controller = TextEditingController();
  final TextEditingController _shipStreet2Controller = TextEditingController();
  final TextEditingController _shipCityController = TextEditingController();
  final TextEditingController _shipStateController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  bool? _invoiceSameSelection;
  final TextEditingController _invoiceStreet1Controller =
      TextEditingController();
  final TextEditingController _invoiceStreet2Controller =
      TextEditingController();
  final TextEditingController _invoiceCityController = TextEditingController();
  final TextEditingController _invoiceStateController = TextEditingController();
  final TextEditingController _invoicePostcodeController =
      TextEditingController();
  final TextEditingController _invoiceCountryController =
      TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();

  _MyOrderPaymentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<OrderFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
    _shipStreet1Controller.addListener(_onShipStreet1Changed);
    _shipStreet2Controller.addListener(_onShipStreet2Changed);
    _shipCityController.addListener(_onShipCityChanged);
    _shipStateController.addListener(_onShipStateChanged);
    _postcodeController.addListener(_onPostcodeChanged);
    _countryController.addListener(_onCountryChanged);
    _invoiceSameSelection = false;
    _invoiceStreet1Controller.addListener(_onInvoiceStreet1Changed);
    _invoiceStreet2Controller.addListener(_onInvoiceStreet2Changed);
    _invoiceCityController.addListener(_onInvoiceCityChanged);
    _invoiceStateController.addListener(_onInvoiceStateChanged);
    _invoicePostcodeController.addListener(_onInvoicePostcodeChanged);
    _invoiceCountryController.addListener(_onInvoiceCountryChanged);
    _totalPriceController.addListener(_onTotalPriceChanged);
    _currencyController.addListener(_onCurrencyChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<OrderFormBloc, OrderFormState>(
        builder: (context, state) {
      if (state is OrderFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is OrderFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _nameController.text = state.value!.name.toString();
        _shipStreet1Controller.text = state.value!.shipStreet1.toString();
        _shipStreet2Controller.text = state.value!.shipStreet2.toString();
        _shipCityController.text = state.value!.shipCity.toString();
        _shipStateController.text = state.value!.shipState.toString();
        _postcodeController.text = state.value!.postcode.toString();
        _countryController.text = state.value!.country.toString();
        if (state.value!.invoiceSame != null) {
          _invoiceSameSelection = state.value!.invoiceSame;
        } else {
          _invoiceSameSelection = false;
        }
        _invoiceStreet1Controller.text = state.value!.invoiceStreet1.toString();
        _invoiceStreet2Controller.text = state.value!.invoiceStreet2.toString();
        _invoiceCityController.text = state.value!.invoiceCity.toString();
        _invoiceStateController.text = state.value!.invoiceState.toString();
        _invoicePostcodeController.text =
            state.value!.invoicePostcode.toString();
        _invoiceCountryController.text = state.value!.invoiceCountry.toString();
        _totalPriceController.text = state.value!.totalPrice.toString();
        _currencyController.text = state.value!.currency.toString();
      }
      if (state is OrderFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Name',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _nameController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is NameOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Total price')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Price',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _totalPriceController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is TotalPriceOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Currency',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _currencyController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is CurrencyOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Shipping Address')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Street Address',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipStreet1Controller,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipStreet1OrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Street Address Line 2',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipStreet2Controller,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipStreet2OrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'City',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipCityController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipCityOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'State/Province',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipStateController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipStateOrderFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Postal / Zip Code',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _postcodeController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is PostcodeOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Shipping Country')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Country',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _countryController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is CountryOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!)) {
          children.add(Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: StyleRegistry.registry()
                  .styleWithApp(widget.app)
                  .adminFormStyle()
                  .groupTitle(widget.app, context, 'Invoice Address')));
        }

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'Invoice address same as shipping address',
                _invoiceSameSelection,
                _readOnly(accessState, state)
                    ? null
                    : (dynamic val) => setSelectionInvoiceSame(val)));

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'Street Address',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceStreet1Controller,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoiceStreet1OrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'Street Address Line 2',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceStreet2Controller,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoiceStreet2OrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'City',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceCityController,
                  keyboardType: TextInputType.text,
                  validator: (_) =>
                      state is InvoiceCityOrderFormError ? state.message : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'State/Province',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceStateController,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoiceStateOrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'Postal / Zip Code',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoicePostcodeController,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoicePostcodeOrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        if (((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!))) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .textFormField(widget.app, context,
                  labelText: 'Country',
                  icon: Icons.text_format,
                  readOnly: _readOnly(accessState, state),
                  textEditingController: _invoiceCountryController,
                  keyboardType: TextInputType.text,
                  validator: (_) => state is InvoiceCountryOrderFormError
                      ? state.message
                      : null,
                  hintText: null));
        }

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((state.value!.invoiceSame == null) ||
            (!state.value!.invoiceSame!)) {
          children.add(Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: StyleRegistry.registry()
                  .styleWithApp(widget.app)
                  .adminFormStyle()
                  .groupTitle(widget.app, context, 'Invoice Country')));
        }

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is OrderFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<OrderListBloc>(context)
                                .add(UpdateOrderList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              shipStreet1: state.value!.shipStreet1,
                              shipStreet2: state.value!.shipStreet2,
                              shipCity: state.value!.shipCity,
                              shipState: state.value!.shipState,
                              postcode: state.value!.postcode,
                              country: state.value!.country,
                              invoiceSame: state.value!.invoiceSame,
                              invoiceStreet1: state.value!.invoiceStreet1,
                              invoiceStreet2: state.value!.invoiceStreet2,
                              invoiceCity: state.value!.invoiceCity,
                              invoiceState: state.value!.invoiceState,
                              invoicePostcode: state.value!.invoicePostcode,
                              invoiceCountry: state.value!.invoiceCountry,
                              totalPrice: state.value!.totalPrice,
                              currency: state.value!.currency,
                            )));
                          } else {
                            BlocProvider.of<OrderListBloc>(context)
                                .add(AddOrderList(
                                    value: OrderModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              shipStreet1: state.value!.shipStreet1,
                              shipStreet2: state.value!.shipStreet2,
                              shipCity: state.value!.shipCity,
                              shipState: state.value!.shipState,
                              postcode: state.value!.postcode,
                              country: state.value!.country,
                              invoiceSame: state.value!.invoiceSame,
                              invoiceStreet1: state.value!.invoiceStreet1,
                              invoiceStreet2: state.value!.invoiceStreet2,
                              invoiceCity: state.value!.invoiceCity,
                              invoiceState: state.value!.invoiceState,
                              invoicePostcode: state.value!.invoicePostcode,
                              invoiceCountry: state.value!.invoiceCountry,
                              totalPrice: state.value!.totalPrice,
                              currency: state.value!.currency,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedOrderDocumentID(value: _documentIDController.text));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedOrderName(value: _nameController.text));
  }

  void _onShipStreet1Changed() {
    _myFormBloc
        .add(ChangedOrderShipStreet1(value: _shipStreet1Controller.text));
  }

  void _onShipStreet2Changed() {
    _myFormBloc
        .add(ChangedOrderShipStreet2(value: _shipStreet2Controller.text));
  }

  void _onShipCityChanged() {
    _myFormBloc.add(ChangedOrderShipCity(value: _shipCityController.text));
  }

  void _onShipStateChanged() {
    _myFormBloc.add(ChangedOrderShipState(value: _shipStateController.text));
  }

  void _onPostcodeChanged() {
    _myFormBloc.add(ChangedOrderPostcode(value: _postcodeController.text));
  }

  void _onCountryChanged() {
    _myFormBloc.add(ChangedOrderCountry(value: _countryController.text));
  }

  void setSelectionInvoiceSame(bool? val) {
    setState(() {
      _invoiceSameSelection = val;
    });
    _myFormBloc.add(ChangedOrderInvoiceSame(value: val));
  }

  void _onInvoiceStreet1Changed() {
    _myFormBloc
        .add(ChangedOrderInvoiceStreet1(value: _invoiceStreet1Controller.text));
  }

  void _onInvoiceStreet2Changed() {
    _myFormBloc
        .add(ChangedOrderInvoiceStreet2(value: _invoiceStreet2Controller.text));
  }

  void _onInvoiceCityChanged() {
    _myFormBloc
        .add(ChangedOrderInvoiceCity(value: _invoiceCityController.text));
  }

  void _onInvoiceStateChanged() {
    _myFormBloc
        .add(ChangedOrderInvoiceState(value: _invoiceStateController.text));
  }

  void _onInvoicePostcodeChanged() {
    _myFormBloc.add(
        ChangedOrderInvoicePostcode(value: _invoicePostcodeController.text));
  }

  void _onInvoiceCountryChanged() {
    _myFormBloc
        .add(ChangedOrderInvoiceCountry(value: _invoiceCountryController.text));
  }

  void _onTotalPriceChanged() {
    _myFormBloc.add(ChangedOrderTotalPrice(value: _totalPriceController.text));
  }

  void _onCurrencyChanged() {
    _myFormBloc.add(ChangedOrderCurrency(value: _currencyController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    _shipStreet1Controller.dispose();
    _shipStreet2Controller.dispose();
    _shipCityController.dispose();
    _shipStateController.dispose();
    _postcodeController.dispose();
    _countryController.dispose();
    _invoiceStreet1Controller.dispose();
    _invoiceStreet2Controller.dispose();
    _invoiceCityController.dispose();
    _invoiceStateController.dispose();
    _invoicePostcodeController.dispose();
    _invoiceCountryController.dispose();
    _totalPriceController.dispose();
    _currencyController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, OrderFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}

class OrderShipmentForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final OrderModel? value;
  final ActionModel? submitAction;

  OrderShipmentForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the OrderShipmentForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<OrderFormBloc>(
        create: (context) => OrderFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseOrderFormEvent(value: value)),
        child: _MyOrderShipmentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<OrderFormBloc>(
        create: (context) => OrderFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseOrderFormNoLoadEvent(value: value)),
        child: _MyOrderShipmentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Shipment'
                      : 'Shipment'),
          body: BlocProvider<OrderFormBloc>(
            create: (context) => OrderFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseOrderFormEvent(value: value)
                : InitialiseNewOrderFormEvent())),
            child: _MyOrderShipmentForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyOrderShipmentForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyOrderShipmentForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyOrderShipmentForm> createState() =>
      _MyOrderShipmentFormState(formAction);
}

class _MyOrderShipmentFormState extends State<_MyOrderShipmentForm> {
  final FormAction? formAction;
  late OrderFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _shipmentReferenceController =
      TextEditingController();
  final TextEditingController _shipmentNoteController = TextEditingController();

  _MyOrderShipmentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<OrderFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _shipmentReferenceController.addListener(_onShipmentReferenceChanged);
    _shipmentNoteController.addListener(_onShipmentNoteChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<OrderFormBloc, OrderFormState>(
        builder: (context, state) {
      if (state is OrderFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is OrderFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _shipmentReferenceController.text =
            state.value!.shipmentReference.toString();
        _shipmentNoteController.text = state.value!.shipmentNote.toString();
      }
      if (state is OrderFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'References')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Shipment Reference',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipmentReferenceController,
                keyboardType: TextInputType.text,
                validator: (_) => state is ShipmentReferenceOrderFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Notes')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Shipment Note',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shipmentNoteController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ShipmentNoteOrderFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is OrderFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<OrderListBloc>(context)
                                .add(UpdateOrderList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              shipmentReference: state.value!.shipmentReference,
                              shipmentNote: state.value!.shipmentNote,
                            )));
                          } else {
                            BlocProvider.of<OrderListBloc>(context)
                                .add(AddOrderList(
                                    value: OrderModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              shipmentReference: state.value!.shipmentReference,
                              shipmentNote: state.value!.shipmentNote,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedOrderDocumentID(value: _documentIDController.text));
  }

  void _onShipmentReferenceChanged() {
    _myFormBloc.add(ChangedOrderShipmentReference(
        value: _shipmentReferenceController.text));
  }

  void _onShipmentNoteChanged() {
    _myFormBloc
        .add(ChangedOrderShipmentNote(value: _shipmentNoteController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _shipmentReferenceController.dispose();
    _shipmentNoteController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, OrderFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
