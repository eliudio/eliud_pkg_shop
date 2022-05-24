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
      on <InitialiseNewOrderFormEvent> ((event, emit) {
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
                                 country: "",
                                 invoiceSame: true, 
                                 invoiceStreet1: "",
                                 invoiceStreet2: "",
                                 invoiceCity: "",
                                 invoiceState: "",
                                 invoicePostcode: "",
                                 invoiceCountry: "",
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
        emit(loaded);
      });


      if (event is InitialiseOrderFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        OrderFormLoaded loaded = OrderFormLoaded(value: await orderRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseOrderFormNoLoadEvent) {
        OrderFormLoaded loaded = OrderFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is OrderFormInitialized) {
      OrderModel? newValue = null;
      on <ChangedOrderDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableOrderForm(value: newValue));
        }

      });
      on <ChangedOrderCustomer> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(customer: await memberRepository(appId: appId)!.get(event.value));
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderName> ((event, emit) async {
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderEmail> ((event, emit) async {
        newValue = currentState.value!.copyWith(email: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderShipStreet1> ((event, emit) async {
        newValue = currentState.value!.copyWith(shipStreet1: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderShipStreet2> ((event, emit) async {
        newValue = currentState.value!.copyWith(shipStreet2: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderShipCity> ((event, emit) async {
        newValue = currentState.value!.copyWith(shipCity: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderShipState> ((event, emit) async {
        newValue = currentState.value!.copyWith(shipState: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderPostcode> ((event, emit) async {
        newValue = currentState.value!.copyWith(postcode: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderCountry> ((event, emit) async {
        newValue = currentState.value!.copyWith(country: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderInvoiceSame> ((event, emit) async {
        newValue = currentState.value!.copyWith(invoiceSame: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderInvoiceStreet1> ((event, emit) async {
        newValue = currentState.value!.copyWith(invoiceStreet1: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderInvoiceStreet2> ((event, emit) async {
        newValue = currentState.value!.copyWith(invoiceStreet2: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderInvoiceCity> ((event, emit) async {
        newValue = currentState.value!.copyWith(invoiceCity: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderInvoiceState> ((event, emit) async {
        newValue = currentState.value!.copyWith(invoiceState: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderInvoicePostcode> ((event, emit) async {
        newValue = currentState.value!.copyWith(invoicePostcode: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderInvoiceCountry> ((event, emit) async {
        newValue = currentState.value!.copyWith(invoiceCountry: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderProducts> ((event, emit) async {
        newValue = currentState.value!.copyWith(products: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderTotalPrice> ((event, emit) async {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(totalPrice: double.parse(event.value!));
          emit(SubmittableOrderForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(totalPrice: 0.0);
          emit(TotalPriceOrderFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      });
      on <ChangedOrderCurrency> ((event, emit) async {
        newValue = currentState.value!.copyWith(currency: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderPaymentReference> ((event, emit) async {
        newValue = currentState.value!.copyWith(paymentReference: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderShipmentReference> ((event, emit) async {
        newValue = currentState.value!.copyWith(shipmentReference: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderDeliveryReference> ((event, emit) async {
        newValue = currentState.value!.copyWith(deliveryReference: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderPaymentNote> ((event, emit) async {
        newValue = currentState.value!.copyWith(paymentNote: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderShipmentNote> ((event, emit) async {
        newValue = currentState.value!.copyWith(shipmentNote: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderDeliveryNote> ((event, emit) async {
        newValue = currentState.value!.copyWith(deliveryNote: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
      on <ChangedOrderStatus> ((event, emit) async {
        newValue = currentState.value!.copyWith(status: event.value);
        emit(SubmittableOrderForm(value: newValue));

      });
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

