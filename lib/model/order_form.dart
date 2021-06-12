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

import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_pkg_shop/model/embedded_component.dart';
import 'package:eliud_pkg_shop/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_pkg_shop/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/order_list_bloc.dart';
import 'package:eliud_pkg_shop/model/order_list_event.dart';
import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:eliud_pkg_shop/model/order_form_bloc.dart';
import 'package:eliud_pkg_shop/model/order_form_event.dart';
import 'package:eliud_pkg_shop/model/order_form_state.dart';


class OrderForm extends StatelessWidget {
  FormAction formAction;
  OrderModel? value;
  ActionModel? submitAction;

  OrderForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<OrderFormBloc >(
            create: (context) => OrderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseOrderFormEvent(value: value)),
  
        child: MyOrderForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<OrderFormBloc >(
            create: (context) => OrderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseOrderFormNoLoadEvent(value: value)),
  
        child: MyOrderForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update Order' : 'Add Order'),
        body: BlocProvider<OrderFormBloc >(
            create: (context) => OrderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseOrderFormEvent(value: value) : InitialiseNewOrderFormEvent())),
  
        child: MyOrderForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyOrderForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyOrderForm({this.formAction, this.submitAction});

  _MyOrderFormState createState() => _MyOrderFormState(this.formAction);
}


class _MyOrderFormState extends State<MyOrderForm> {
  final FormAction? formAction;
  late OrderFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  String? _customer;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _shipStreet1Controller = TextEditingController();
  final TextEditingController _shipStreet2Controller = TextEditingController();
  final TextEditingController _shipCityController = TextEditingController();
  final TextEditingController _shipStateController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  String? _country;
  bool? _invoiceSameSelection;
  final TextEditingController _invoiceStreet1Controller = TextEditingController();
  final TextEditingController _invoiceStreet2Controller = TextEditingController();
  final TextEditingController _invoiceCityController = TextEditingController();
  final TextEditingController _invoiceStateController = TextEditingController();
  final TextEditingController _invoicePostcodeController = TextEditingController();
  String? _invoiceCountry;
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _paymentReferenceController = TextEditingController();
  final TextEditingController _shipmentReferenceController = TextEditingController();
  final TextEditingController _deliveryReferenceController = TextEditingController();
  final TextEditingController _paymentNoteController = TextEditingController();
  final TextEditingController _shipmentNoteController = TextEditingController();
  final TextEditingController _deliveryNoteController = TextEditingController();
  int? _statusSelectedRadioTile;
  final TextEditingController _timeStampController = TextEditingController();


  _MyOrderFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<OrderFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _nameController.addListener(_onNameChanged);
    _emailController.addListener(_onEmailChanged);
    _shipStreet1Controller.addListener(_onShipStreet1Changed);
    _shipStreet2Controller.addListener(_onShipStreet2Changed);
    _shipCityController.addListener(_onShipCityChanged);
    _shipStateController.addListener(_onShipStateChanged);
    _postcodeController.addListener(_onPostcodeChanged);
    _invoiceSameSelection = false;
    _invoiceStreet1Controller.addListener(_onInvoiceStreet1Changed);
    _invoiceStreet2Controller.addListener(_onInvoiceStreet2Changed);
    _invoiceCityController.addListener(_onInvoiceCityChanged);
    _invoiceStateController.addListener(_onInvoiceStateChanged);
    _invoicePostcodeController.addListener(_onInvoicePostcodeChanged);
    _totalPriceController.addListener(_onTotalPriceChanged);
    _currencyController.addListener(_onCurrencyChanged);
    _paymentReferenceController.addListener(_onPaymentReferenceChanged);
    _shipmentReferenceController.addListener(_onShipmentReferenceChanged);
    _deliveryReferenceController.addListener(_onDeliveryReferenceChanged);
    _paymentNoteController.addListener(_onPaymentNoteChanged);
    _shipmentNoteController.addListener(_onShipmentNoteChanged);
    _deliveryNoteController.addListener(_onDeliveryNoteChanged);
    _statusSelectedRadioTile = 0;
    _timeStampController.addListener(_onTimeStampChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<OrderFormBloc, OrderFormState>(builder: (context, state) {
      if (state is OrderFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is OrderFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.customer != null)
          _customer= state.value!.customer!.documentID;
        else
          _customer= "";
        if (state.value!.name != null)
          _nameController.text = state.value!.name.toString();
        else
          _nameController.text = "";
        if (state.value!.email != null)
          _emailController.text = state.value!.email.toString();
        else
          _emailController.text = "";
        if (state.value!.shipStreet1 != null)
          _shipStreet1Controller.text = state.value!.shipStreet1.toString();
        else
          _shipStreet1Controller.text = "";
        if (state.value!.shipStreet2 != null)
          _shipStreet2Controller.text = state.value!.shipStreet2.toString();
        else
          _shipStreet2Controller.text = "";
        if (state.value!.shipCity != null)
          _shipCityController.text = state.value!.shipCity.toString();
        else
          _shipCityController.text = "";
        if (state.value!.shipState != null)
          _shipStateController.text = state.value!.shipState.toString();
        else
          _shipStateController.text = "";
        if (state.value!.postcode != null)
          _postcodeController.text = state.value!.postcode.toString();
        else
          _postcodeController.text = "";
        if (state.value!.country != null)
          _country= state.value!.country!.documentID;
        else
          _country= "";
        if (state.value!.invoiceSame != null)
        _invoiceSameSelection = state.value!.invoiceSame;
        else
        _invoiceSameSelection = false;
        if (state.value!.invoiceStreet1 != null)
          _invoiceStreet1Controller.text = state.value!.invoiceStreet1.toString();
        else
          _invoiceStreet1Controller.text = "";
        if (state.value!.invoiceStreet2 != null)
          _invoiceStreet2Controller.text = state.value!.invoiceStreet2.toString();
        else
          _invoiceStreet2Controller.text = "";
        if (state.value!.invoiceCity != null)
          _invoiceCityController.text = state.value!.invoiceCity.toString();
        else
          _invoiceCityController.text = "";
        if (state.value!.invoiceState != null)
          _invoiceStateController.text = state.value!.invoiceState.toString();
        else
          _invoiceStateController.text = "";
        if (state.value!.invoicePostcode != null)
          _invoicePostcodeController.text = state.value!.invoicePostcode.toString();
        else
          _invoicePostcodeController.text = "";
        if (state.value!.invoiceCountry != null)
          _invoiceCountry= state.value!.invoiceCountry!.documentID;
        else
          _invoiceCountry= "";
        if (state.value!.totalPrice != null)
          _totalPriceController.text = state.value!.totalPrice.toString();
        else
          _totalPriceController.text = "";
        if (state.value!.currency != null)
          _currencyController.text = state.value!.currency.toString();
        else
          _currencyController.text = "";
        if (state.value!.paymentReference != null)
          _paymentReferenceController.text = state.value!.paymentReference.toString();
        else
          _paymentReferenceController.text = "";
        if (state.value!.shipmentReference != null)
          _shipmentReferenceController.text = state.value!.shipmentReference.toString();
        else
          _shipmentReferenceController.text = "";
        if (state.value!.deliveryReference != null)
          _deliveryReferenceController.text = state.value!.deliveryReference.toString();
        else
          _deliveryReferenceController.text = "";
        if (state.value!.paymentNote != null)
          _paymentNoteController.text = state.value!.paymentNote.toString();
        else
          _paymentNoteController.text = "";
        if (state.value!.shipmentNote != null)
          _shipmentNoteController.text = state.value!.shipmentNote.toString();
        else
          _shipmentNoteController.text = "";
        if (state.value!.deliveryNote != null)
          _deliveryNoteController.text = state.value!.deliveryNote.toString();
        else
          _deliveryNoteController.text = "";
        if (state.value!.status != null)
          _statusSelectedRadioTile = state.value!.status!.index;
        else
          _statusSelectedRadioTile = 0;
        if (state.value!.timeStamp != null)
          _timeStampController.text = state.value!.timeStamp.toString();
        else
          _timeStampController.text = "";
      }
      if (state is OrderFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _nameController, keyboardType: TextInputType.text, validator: (_) => state is NameOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'email', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _emailController, keyboardType: TextInputType.text, validator: (_) => state is EmailOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Customer')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "members", value: _customer, trigger: _onCustomerSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Products')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: orderItemsList(context, state.value!.products, _onProductsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Total price')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Price', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _totalPriceController, keyboardType: TextInputType.number, validator: (_) => state is TotalPriceOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Currency', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _currencyController, keyboardType: TextInputType.text, validator: (_) => state is CurrencyOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'References')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Payment Reference', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _paymentReferenceController, keyboardType: TextInputType.text, validator: (_) => state is PaymentReferenceOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Shipment Reference', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipmentReferenceController, keyboardType: TextInputType.text, validator: (_) => state is ShipmentReferenceOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Dilvery Reference', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _deliveryReferenceController, keyboardType: TextInputType.text, validator: (_) => state is DeliveryReferenceOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Notes')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Payment Note', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _paymentNoteController, keyboardType: TextInputType.text, validator: (_) => state is PaymentNoteOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Shipment Note', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipmentNoteController, keyboardType: TextInputType.text, validator: (_) => state is ShipmentNoteOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Dilvery Note', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _deliveryNoteController, keyboardType: TextInputType.text, validator: (_) => state is DeliveryNoteOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Shipping Address')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Street Address', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipStreet1Controller, keyboardType: TextInputType.text, validator: (_) => state is ShipStreet1OrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Street Address Line 2', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipStreet2Controller, keyboardType: TextInputType.text, validator: (_) => state is ShipStreet2OrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'City', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipCityController, keyboardType: TextInputType.text, validator: (_) => state is ShipCityOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'State/Province', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipStateController, keyboardType: TextInputType.text, validator: (_) => state is ShipStateOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Postal / Zip Code', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _postcodeController, keyboardType: TextInputType.text, validator: (_) => state is PostcodeOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Shipping Country')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "countrys", value: _country, trigger: _onCountrySelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Invoice Address')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().checkboxListTile(context, 'Invoice address same as shipping address', _invoiceSameSelection, _readOnly(accessState, state) ? null : (dynamic val) => setSelectionInvoiceSame(val))
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Street Address', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoiceStreet1Controller, keyboardType: TextInputType.text, validator: (_) => state is InvoiceStreet1OrderFormError ? state.message : null, hintText: null)
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Street Address Line 2', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoiceStreet2Controller, keyboardType: TextInputType.text, validator: (_) => state is InvoiceStreet2OrderFormError ? state.message : null, hintText: null)
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'City', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoiceCityController, keyboardType: TextInputType.text, validator: (_) => state is InvoiceCityOrderFormError ? state.message : null, hintText: null)
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'State/Province', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoiceStateController, keyboardType: TextInputType.text, validator: (_) => state is InvoiceStateOrderFormError ? state.message : null, hintText: null)
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Postal / Zip Code', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoicePostcodeController, keyboardType: TextInputType.text, validator: (_) => state is InvoicePostcodeOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Invoice Country')
                ));

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                DropdownButtonComponentFactory().createNew(id: "countrys", value: _invoiceCountry, trigger: _onInvoiceCountrySelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Order Status')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _statusSelectedRadioTile, 'Ordered', 'Ordered', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _statusSelectedRadioTile, 'Paid', 'Paid', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _statusSelectedRadioTile, 'PaymentFailed', 'PaymentFailed', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _statusSelectedRadioTile, 'Shipped', 'Shipped', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _statusSelectedRadioTile, 'Delivered', 'Delivered', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionStatus(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is OrderFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<OrderListBloc>(context).add(
                          UpdateOrderList(value: state.value!.copyWith(
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
                        BlocProvider.of<OrderListBloc>(context).add(
                          AddOrderList(value: OrderModel(
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
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedOrderDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedOrderAppId(value: _appIdController.text));
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
    _myFormBloc.add(ChangedOrderShipStreet1(value: _shipStreet1Controller.text));
  }


  void _onShipStreet2Changed() {
    _myFormBloc.add(ChangedOrderShipStreet2(value: _shipStreet2Controller.text));
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


  void _onCountrySelected(String? val) {
    setState(() {
      _country = val;
    });
    _myFormBloc.add(ChangedOrderCountry(value: val));
  }


  void setSelectionInvoiceSame(bool? val) {
    setState(() {
      _invoiceSameSelection = val;
    });
    _myFormBloc.add(ChangedOrderInvoiceSame(value: val));
  }

  void _onInvoiceStreet1Changed() {
    _myFormBloc.add(ChangedOrderInvoiceStreet1(value: _invoiceStreet1Controller.text));
  }


  void _onInvoiceStreet2Changed() {
    _myFormBloc.add(ChangedOrderInvoiceStreet2(value: _invoiceStreet2Controller.text));
  }


  void _onInvoiceCityChanged() {
    _myFormBloc.add(ChangedOrderInvoiceCity(value: _invoiceCityController.text));
  }


  void _onInvoiceStateChanged() {
    _myFormBloc.add(ChangedOrderInvoiceState(value: _invoiceStateController.text));
  }


  void _onInvoicePostcodeChanged() {
    _myFormBloc.add(ChangedOrderInvoicePostcode(value: _invoicePostcodeController.text));
  }


  void _onInvoiceCountrySelected(String? val) {
    setState(() {
      _invoiceCountry = val;
    });
    _myFormBloc.add(ChangedOrderInvoiceCountry(value: val));
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
    _myFormBloc.add(ChangedOrderPaymentReference(value: _paymentReferenceController.text));
  }


  void _onShipmentReferenceChanged() {
    _myFormBloc.add(ChangedOrderShipmentReference(value: _shipmentReferenceController.text));
  }


  void _onDeliveryReferenceChanged() {
    _myFormBloc.add(ChangedOrderDeliveryReference(value: _deliveryReferenceController.text));
  }


  void _onPaymentNoteChanged() {
    _myFormBloc.add(ChangedOrderPaymentNote(value: _paymentNoteController.text));
  }


  void _onShipmentNoteChanged() {
    _myFormBloc.add(ChangedOrderShipmentNote(value: _shipmentNoteController.text));
  }


  void _onDeliveryNoteChanged() {
    _myFormBloc.add(ChangedOrderDeliveryNote(value: _deliveryNoteController.text));
  }


  void setSelectionStatus(int? val) {
    setState(() {
      _statusSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedOrderStatus(value: toOrderStatus(val)));
  }


  void _onTimeStampChanged() {
    _myFormBloc.add(ChangedOrderTimeStamp(value: _timeStampController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _shipStreet1Controller.dispose();
    _shipStreet2Controller.dispose();
    _shipCityController.dispose();
    _shipStateController.dispose();
    _postcodeController.dispose();
    _invoiceStreet1Controller.dispose();
    _invoiceStreet2Controller.dispose();
    _invoiceCityController.dispose();
    _invoiceStateController.dispose();
    _invoicePostcodeController.dispose();
    _totalPriceController.dispose();
    _currencyController.dispose();
    _paymentReferenceController.dispose();
    _shipmentReferenceController.dispose();
    _deliveryReferenceController.dispose();
    _paymentNoteController.dispose();
    _shipmentNoteController.dispose();
    _deliveryNoteController.dispose();
    _timeStampController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, OrderFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



class OrderPaymentForm extends StatelessWidget {
  FormAction formAction;
  OrderModel? value;
  ActionModel? submitAction;

  OrderPaymentForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<OrderFormBloc >(
            create: (context) => OrderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseOrderFormEvent(value: value)),
  
        child: MyOrderPaymentForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<OrderFormBloc >(
            create: (context) => OrderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseOrderFormNoLoadEvent(value: value)),
  
        child: MyOrderPaymentForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Payment' : 'Payment'),
        body: BlocProvider<OrderFormBloc >(
            create: (context) => OrderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseOrderFormEvent(value: value) : InitialiseNewOrderFormEvent())),
  
        child: MyOrderPaymentForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyOrderPaymentForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyOrderPaymentForm({this.formAction, this.submitAction});

  _MyOrderPaymentFormState createState() => _MyOrderPaymentFormState(this.formAction);
}


class _MyOrderPaymentFormState extends State<MyOrderPaymentForm> {
  final FormAction? formAction;
  late OrderFormBloc _myFormBloc;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _shipStreet1Controller = TextEditingController();
  final TextEditingController _shipStreet2Controller = TextEditingController();
  final TextEditingController _shipCityController = TextEditingController();
  final TextEditingController _shipStateController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  String? _country;
  bool? _invoiceSameSelection;
  final TextEditingController _invoiceStreet1Controller = TextEditingController();
  final TextEditingController _invoiceStreet2Controller = TextEditingController();
  final TextEditingController _invoiceCityController = TextEditingController();
  final TextEditingController _invoiceStateController = TextEditingController();
  final TextEditingController _invoicePostcodeController = TextEditingController();
  String? _invoiceCountry;
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();


  _MyOrderPaymentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<OrderFormBloc>(context);
    _nameController.addListener(_onNameChanged);
    _shipStreet1Controller.addListener(_onShipStreet1Changed);
    _shipStreet2Controller.addListener(_onShipStreet2Changed);
    _shipCityController.addListener(_onShipCityChanged);
    _shipStateController.addListener(_onShipStateChanged);
    _postcodeController.addListener(_onPostcodeChanged);
    _invoiceSameSelection = false;
    _invoiceStreet1Controller.addListener(_onInvoiceStreet1Changed);
    _invoiceStreet2Controller.addListener(_onInvoiceStreet2Changed);
    _invoiceCityController.addListener(_onInvoiceCityChanged);
    _invoiceStateController.addListener(_onInvoiceStateChanged);
    _invoicePostcodeController.addListener(_onInvoicePostcodeChanged);
    _totalPriceController.addListener(_onTotalPriceChanged);
    _currencyController.addListener(_onCurrencyChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<OrderFormBloc, OrderFormState>(builder: (context, state) {
      if (state is OrderFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is OrderFormLoaded) {
        if (state.value!.name != null)
          _nameController.text = state.value!.name.toString();
        else
          _nameController.text = "";
        if (state.value!.shipStreet1 != null)
          _shipStreet1Controller.text = state.value!.shipStreet1.toString();
        else
          _shipStreet1Controller.text = "";
        if (state.value!.shipStreet2 != null)
          _shipStreet2Controller.text = state.value!.shipStreet2.toString();
        else
          _shipStreet2Controller.text = "";
        if (state.value!.shipCity != null)
          _shipCityController.text = state.value!.shipCity.toString();
        else
          _shipCityController.text = "";
        if (state.value!.shipState != null)
          _shipStateController.text = state.value!.shipState.toString();
        else
          _shipStateController.text = "";
        if (state.value!.postcode != null)
          _postcodeController.text = state.value!.postcode.toString();
        else
          _postcodeController.text = "";
        if (state.value!.country != null)
          _country= state.value!.country!.documentID;
        else
          _country= "";
        if (state.value!.invoiceSame != null)
        _invoiceSameSelection = state.value!.invoiceSame;
        else
        _invoiceSameSelection = false;
        if (state.value!.invoiceStreet1 != null)
          _invoiceStreet1Controller.text = state.value!.invoiceStreet1.toString();
        else
          _invoiceStreet1Controller.text = "";
        if (state.value!.invoiceStreet2 != null)
          _invoiceStreet2Controller.text = state.value!.invoiceStreet2.toString();
        else
          _invoiceStreet2Controller.text = "";
        if (state.value!.invoiceCity != null)
          _invoiceCityController.text = state.value!.invoiceCity.toString();
        else
          _invoiceCityController.text = "";
        if (state.value!.invoiceState != null)
          _invoiceStateController.text = state.value!.invoiceState.toString();
        else
          _invoiceStateController.text = "";
        if (state.value!.invoicePostcode != null)
          _invoicePostcodeController.text = state.value!.invoicePostcode.toString();
        else
          _invoicePostcodeController.text = "";
        if (state.value!.invoiceCountry != null)
          _invoiceCountry= state.value!.invoiceCountry!.documentID;
        else
          _invoiceCountry= "";
        if (state.value!.totalPrice != null)
          _totalPriceController.text = state.value!.totalPrice.toString();
        else
          _totalPriceController.text = "";
        if (state.value!.currency != null)
          _currencyController.text = state.value!.currency.toString();
        else
          _currencyController.text = "";
      }
      if (state is OrderFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _nameController, keyboardType: TextInputType.text, validator: (_) => state is NameOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Total price')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Price', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _totalPriceController, keyboardType: TextInputType.number, validator: (_) => state is TotalPriceOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Currency', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _currencyController, keyboardType: TextInputType.text, validator: (_) => state is CurrencyOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Shipping Address')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Street Address', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipStreet1Controller, keyboardType: TextInputType.text, validator: (_) => state is ShipStreet1OrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Street Address Line 2', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipStreet2Controller, keyboardType: TextInputType.text, validator: (_) => state is ShipStreet2OrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'City', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipCityController, keyboardType: TextInputType.text, validator: (_) => state is ShipCityOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'State/Province', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipStateController, keyboardType: TextInputType.text, validator: (_) => state is ShipStateOrderFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Postal / Zip Code', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _postcodeController, keyboardType: TextInputType.text, validator: (_) => state is PostcodeOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Shipping Country')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "countrys", value: _country, trigger: _onCountrySelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Invoice Address')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().checkboxListTile(context, 'Invoice address same as shipping address', _invoiceSameSelection, _readOnly(accessState, state) ? null : (dynamic val) => setSelectionInvoiceSame(val))
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Street Address', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoiceStreet1Controller, keyboardType: TextInputType.text, validator: (_) => state is InvoiceStreet1OrderFormError ? state.message : null, hintText: null)
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Street Address Line 2', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoiceStreet2Controller, keyboardType: TextInputType.text, validator: (_) => state is InvoiceStreet2OrderFormError ? state.message : null, hintText: null)
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'City', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoiceCityController, keyboardType: TextInputType.text, validator: (_) => state is InvoiceCityOrderFormError ? state.message : null, hintText: null)
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'State/Province', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoiceStateController, keyboardType: TextInputType.text, validator: (_) => state is InvoiceStateOrderFormError ? state.message : null, hintText: null)
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Postal / Zip Code', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _invoicePostcodeController, keyboardType: TextInputType.text, validator: (_) => state is InvoicePostcodeOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Invoice Country')
                ));

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                DropdownButtonComponentFactory().createNew(id: "countrys", value: _invoiceCountry, trigger: _onInvoiceCountrySelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is OrderFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<OrderListBloc>(context).add(
                          UpdateOrderList(value: state.value!.copyWith(
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
                        BlocProvider.of<OrderListBloc>(context).add(
                          AddOrderList(value: OrderModel(
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
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedOrderName(value: _nameController.text));
  }


  void _onShipStreet1Changed() {
    _myFormBloc.add(ChangedOrderShipStreet1(value: _shipStreet1Controller.text));
  }


  void _onShipStreet2Changed() {
    _myFormBloc.add(ChangedOrderShipStreet2(value: _shipStreet2Controller.text));
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


  void _onCountrySelected(String? val) {
    setState(() {
      _country = val;
    });
    _myFormBloc.add(ChangedOrderCountry(value: val));
  }


  void setSelectionInvoiceSame(bool? val) {
    setState(() {
      _invoiceSameSelection = val;
    });
    _myFormBloc.add(ChangedOrderInvoiceSame(value: val));
  }

  void _onInvoiceStreet1Changed() {
    _myFormBloc.add(ChangedOrderInvoiceStreet1(value: _invoiceStreet1Controller.text));
  }


  void _onInvoiceStreet2Changed() {
    _myFormBloc.add(ChangedOrderInvoiceStreet2(value: _invoiceStreet2Controller.text));
  }


  void _onInvoiceCityChanged() {
    _myFormBloc.add(ChangedOrderInvoiceCity(value: _invoiceCityController.text));
  }


  void _onInvoiceStateChanged() {
    _myFormBloc.add(ChangedOrderInvoiceState(value: _invoiceStateController.text));
  }


  void _onInvoicePostcodeChanged() {
    _myFormBloc.add(ChangedOrderInvoicePostcode(value: _invoicePostcodeController.text));
  }


  void _onInvoiceCountrySelected(String? val) {
    setState(() {
      _invoiceCountry = val;
    });
    _myFormBloc.add(ChangedOrderInvoiceCountry(value: val));
  }


  void _onTotalPriceChanged() {
    _myFormBloc.add(ChangedOrderTotalPrice(value: _totalPriceController.text));
  }


  void _onCurrencyChanged() {
    _myFormBloc.add(ChangedOrderCurrency(value: _currencyController.text));
  }



  @override
  void dispose() {
    _nameController.dispose();
    _shipStreet1Controller.dispose();
    _shipStreet2Controller.dispose();
    _shipCityController.dispose();
    _shipStateController.dispose();
    _postcodeController.dispose();
    _invoiceStreet1Controller.dispose();
    _invoiceStreet2Controller.dispose();
    _invoiceCityController.dispose();
    _invoiceStateController.dispose();
    _invoicePostcodeController.dispose();
    _totalPriceController.dispose();
    _currencyController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, OrderFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



class OrderShipmentForm extends StatelessWidget {
  FormAction formAction;
  OrderModel? value;
  ActionModel? submitAction;

  OrderShipmentForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<OrderFormBloc >(
            create: (context) => OrderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseOrderFormEvent(value: value)),
  
        child: MyOrderShipmentForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<OrderFormBloc >(
            create: (context) => OrderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseOrderFormNoLoadEvent(value: value)),
  
        child: MyOrderShipmentForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Shipment' : 'Shipment'),
        body: BlocProvider<OrderFormBloc >(
            create: (context) => OrderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseOrderFormEvent(value: value) : InitialiseNewOrderFormEvent())),
  
        child: MyOrderShipmentForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyOrderShipmentForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyOrderShipmentForm({this.formAction, this.submitAction});

  _MyOrderShipmentFormState createState() => _MyOrderShipmentFormState(this.formAction);
}


class _MyOrderShipmentFormState extends State<MyOrderShipmentForm> {
  final FormAction? formAction;
  late OrderFormBloc _myFormBloc;

  final TextEditingController _shipmentReferenceController = TextEditingController();
  final TextEditingController _shipmentNoteController = TextEditingController();


  _MyOrderShipmentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<OrderFormBloc>(context);
    _shipmentReferenceController.addListener(_onShipmentReferenceChanged);
    _shipmentNoteController.addListener(_onShipmentNoteChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<OrderFormBloc, OrderFormState>(builder: (context, state) {
      if (state is OrderFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is OrderFormLoaded) {
        if (state.value!.shipmentReference != null)
          _shipmentReferenceController.text = state.value!.shipmentReference.toString();
        else
          _shipmentReferenceController.text = "";
        if (state.value!.shipmentNote != null)
          _shipmentNoteController.text = state.value!.shipmentNote.toString();
        else
          _shipmentNoteController.text = "";
      }
      if (state is OrderFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'References')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Shipment Reference', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipmentReferenceController, keyboardType: TextInputType.text, validator: (_) => state is ShipmentReferenceOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Notes')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Shipment Note', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _shipmentNoteController, keyboardType: TextInputType.text, validator: (_) => state is ShipmentNoteOrderFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is OrderFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<OrderListBloc>(context).add(
                          UpdateOrderList(value: state.value!.copyWith(
                              shipmentReference: state.value!.shipmentReference, 
                              shipmentNote: state.value!.shipmentNote, 
                        )));
                      } else {
                        BlocProvider.of<OrderListBloc>(context).add(
                          AddOrderList(value: OrderModel(
                              shipmentReference: state.value!.shipmentReference, 
                              shipmentNote: state.value!.shipmentNote, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onShipmentReferenceChanged() {
    _myFormBloc.add(ChangedOrderShipmentReference(value: _shipmentReferenceController.text));
  }


  void _onShipmentNoteChanged() {
    _myFormBloc.add(ChangedOrderShipmentNote(value: _shipmentNoteController.text));
  }



  @override
  void dispose() {
    _shipmentReferenceController.dispose();
    _shipmentNoteController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, OrderFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



