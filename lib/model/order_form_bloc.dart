/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/order_form_event.dart';
import 'package:eliud_pkg_shop/model/order_form_state.dart';
import 'package:eliud_pkg_shop/model/order_repository.dart';

class OrderFormBloc extends Bloc<OrderFormEvent, OrderFormState> {
  final FormAction? formAction;
  final String? appId;

  OrderFormBloc(this.appId, { this.formAction }): super(OrderFormUninitialized());
  @override
  Stream<OrderFormState> mapEventToState(OrderFormEvent event) async* {
    final currentState = state;
    if (currentState is OrderFormUninitialized) {
      if (event is InitialiseNewOrderFormEvent) {
        OrderFormLoaded loaded = OrderFormLoaded(value: OrderModel(
                                               documentID: "IDENTIFIER", 
                                 appId: "",
                                 name: "",
                                 email: "",
                                 shipStreet1: "",
                                 shipStreet2: "",
                                 shipCity: "",
                                 shipState: "",
                                 postcode: "",
                                 invoiceSame: true, 
                                 invoiceStreet1: "",
                                 invoiceStreet2: "",
                                 invoiceCity: "",
                                 invoiceState: "",
                                 invoicePostcode: "",
                                 products: [],
                                 totalPrice: 0.0,
                                 currency: "",
                                 paymentReference: "",
                                 shipmentReference: "",
                                 deliveryReference: "",
                                 paymentNote: "",
                                 shipmentNote: "",
                                 deliveryNote: "",
                                 timeStamp: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseOrderFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        OrderFormLoaded loaded = OrderFormLoaded(value: await orderRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseOrderFormNoLoadEvent) {
        OrderFormLoaded loaded = OrderFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is OrderFormInitialized) {
      OrderModel? newValue = null;
      if (event is ChangedOrderDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableOrderForm(value: newValue);
        }

        return;
      }
      if (event is ChangedOrderCustomer) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(customer: await memberRepository(appId: appId)!.get(event.value));
        else
          newValue = new OrderModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 customer: null,
                                 name: currentState.value!.name,
                                 email: currentState.value!.email,
                                 shipStreet1: currentState.value!.shipStreet1,
                                 shipStreet2: currentState.value!.shipStreet2,
                                 shipCity: currentState.value!.shipCity,
                                 shipState: currentState.value!.shipState,
                                 postcode: currentState.value!.postcode,
                                 country: currentState.value!.country,
                                 invoiceSame: currentState.value!.invoiceSame,
                                 invoiceStreet1: currentState.value!.invoiceStreet1,
                                 invoiceStreet2: currentState.value!.invoiceStreet2,
                                 invoiceCity: currentState.value!.invoiceCity,
                                 invoiceState: currentState.value!.invoiceState,
                                 invoicePostcode: currentState.value!.invoicePostcode,
                                 invoiceCountry: currentState.value!.invoiceCountry,
                                 products: currentState.value!.products,
                                 totalPrice: currentState.value!.totalPrice,
                                 currency: currentState.value!.currency,
                                 paymentReference: currentState.value!.paymentReference,
                                 shipmentReference: currentState.value!.shipmentReference,
                                 deliveryReference: currentState.value!.deliveryReference,
                                 paymentNote: currentState.value!.paymentNote,
                                 shipmentNote: currentState.value!.shipmentNote,
                                 deliveryNote: currentState.value!.deliveryNote,
                                 status: currentState.value!.status,
                                 timeStamp: currentState.value!.timeStamp,
          );
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderName) {
        newValue = currentState.value!.copyWith(name: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderEmail) {
        newValue = currentState.value!.copyWith(email: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderShipStreet1) {
        newValue = currentState.value!.copyWith(shipStreet1: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderShipStreet2) {
        newValue = currentState.value!.copyWith(shipStreet2: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderShipCity) {
        newValue = currentState.value!.copyWith(shipCity: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderShipState) {
        newValue = currentState.value!.copyWith(shipState: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderPostcode) {
        newValue = currentState.value!.copyWith(postcode: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderCountry) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(country: await countryRepository(appId: appId)!.get(event.value));
        else
          newValue = new OrderModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 customer: currentState.value!.customer,
                                 name: currentState.value!.name,
                                 email: currentState.value!.email,
                                 shipStreet1: currentState.value!.shipStreet1,
                                 shipStreet2: currentState.value!.shipStreet2,
                                 shipCity: currentState.value!.shipCity,
                                 shipState: currentState.value!.shipState,
                                 postcode: currentState.value!.postcode,
                                 country: null,
                                 invoiceSame: currentState.value!.invoiceSame,
                                 invoiceStreet1: currentState.value!.invoiceStreet1,
                                 invoiceStreet2: currentState.value!.invoiceStreet2,
                                 invoiceCity: currentState.value!.invoiceCity,
                                 invoiceState: currentState.value!.invoiceState,
                                 invoicePostcode: currentState.value!.invoicePostcode,
                                 invoiceCountry: currentState.value!.invoiceCountry,
                                 products: currentState.value!.products,
                                 totalPrice: currentState.value!.totalPrice,
                                 currency: currentState.value!.currency,
                                 paymentReference: currentState.value!.paymentReference,
                                 shipmentReference: currentState.value!.shipmentReference,
                                 deliveryReference: currentState.value!.deliveryReference,
                                 paymentNote: currentState.value!.paymentNote,
                                 shipmentNote: currentState.value!.shipmentNote,
                                 deliveryNote: currentState.value!.deliveryNote,
                                 status: currentState.value!.status,
                                 timeStamp: currentState.value!.timeStamp,
          );
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderInvoiceSame) {
        newValue = currentState.value!.copyWith(invoiceSame: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderInvoiceStreet1) {
        newValue = currentState.value!.copyWith(invoiceStreet1: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderInvoiceStreet2) {
        newValue = currentState.value!.copyWith(invoiceStreet2: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderInvoiceCity) {
        newValue = currentState.value!.copyWith(invoiceCity: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderInvoiceState) {
        newValue = currentState.value!.copyWith(invoiceState: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderInvoicePostcode) {
        newValue = currentState.value!.copyWith(invoicePostcode: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderInvoiceCountry) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(invoiceCountry: await countryRepository(appId: appId)!.get(event.value));
        else
          newValue = new OrderModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 customer: currentState.value!.customer,
                                 name: currentState.value!.name,
                                 email: currentState.value!.email,
                                 shipStreet1: currentState.value!.shipStreet1,
                                 shipStreet2: currentState.value!.shipStreet2,
                                 shipCity: currentState.value!.shipCity,
                                 shipState: currentState.value!.shipState,
                                 postcode: currentState.value!.postcode,
                                 country: currentState.value!.country,
                                 invoiceSame: currentState.value!.invoiceSame,
                                 invoiceStreet1: currentState.value!.invoiceStreet1,
                                 invoiceStreet2: currentState.value!.invoiceStreet2,
                                 invoiceCity: currentState.value!.invoiceCity,
                                 invoiceState: currentState.value!.invoiceState,
                                 invoicePostcode: currentState.value!.invoicePostcode,
                                 invoiceCountry: null,
                                 products: currentState.value!.products,
                                 totalPrice: currentState.value!.totalPrice,
                                 currency: currentState.value!.currency,
                                 paymentReference: currentState.value!.paymentReference,
                                 shipmentReference: currentState.value!.shipmentReference,
                                 deliveryReference: currentState.value!.deliveryReference,
                                 paymentNote: currentState.value!.paymentNote,
                                 shipmentNote: currentState.value!.shipmentNote,
                                 deliveryNote: currentState.value!.deliveryNote,
                                 status: currentState.value!.status,
                                 timeStamp: currentState.value!.timeStamp,
          );
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderProducts) {
        newValue = currentState.value!.copyWith(products: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderTotalPrice) {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(totalPrice: double.parse(event.value!));
          yield SubmittableOrderForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(totalPrice: 0.0);
          yield TotalPriceOrderFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedOrderCurrency) {
        newValue = currentState.value!.copyWith(currency: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderPaymentReference) {
        newValue = currentState.value!.copyWith(paymentReference: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderShipmentReference) {
        newValue = currentState.value!.copyWith(shipmentReference: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderDeliveryReference) {
        newValue = currentState.value!.copyWith(deliveryReference: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderPaymentNote) {
        newValue = currentState.value!.copyWith(paymentNote: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderShipmentNote) {
        newValue = currentState.value!.copyWith(shipmentNote: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderDeliveryNote) {
        newValue = currentState.value!.copyWith(deliveryNote: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
      if (event is ChangedOrderStatus) {
        newValue = currentState.value!.copyWith(status: event.value);
        yield SubmittableOrderForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDOrderFormError error(String message, OrderModel newValue) => DocumentIDOrderFormError(message: message, value: newValue);

  Future<OrderFormState> _isDocumentIDValid(String? value, OrderModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<OrderModel?> findDocument = orderRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableOrderForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

