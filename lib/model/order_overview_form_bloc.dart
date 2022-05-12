/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_form_bloc.dart
                       
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

import 'package:eliud_pkg_shop/model/order_overview_form_event.dart';
import 'package:eliud_pkg_shop/model/order_overview_form_state.dart';
import 'package:eliud_pkg_shop/model/order_overview_repository.dart';

class OrderOverviewFormBloc extends Bloc<OrderOverviewFormEvent, OrderOverviewFormState> {
  final FormAction? formAction;
  final String? appId;

  OrderOverviewFormBloc(this.appId, { this.formAction }): super(OrderOverviewFormUninitialized());
  @override
  Stream<OrderOverviewFormState> mapEventToState(OrderOverviewFormEvent event) async* {
    final currentState = state;
    if (currentState is OrderOverviewFormUninitialized) {
      if (event is InitialiseNewOrderOverviewFormEvent) {
        OrderOverviewFormLoaded loaded = OrderOverviewFormLoaded(value: OrderOverviewModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseOrderOverviewFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        OrderOverviewFormLoaded loaded = OrderOverviewFormLoaded(value: await orderOverviewRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseOrderOverviewFormNoLoadEvent) {
        OrderOverviewFormLoaded loaded = OrderOverviewFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is OrderOverviewFormInitialized) {
      OrderOverviewModel? newValue = null;
      if (event is ChangedOrderOverviewDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableOrderOverviewForm(value: newValue);
        }

        return;
      }
      if (event is ChangedOrderOverviewDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableOrderOverviewForm(value: newValue);

        return;
      }
      if (event is ChangedOrderOverviewShop) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(shop: await shopRepository(appId: appId)!.get(event.value));
        else
          newValue = new OrderOverviewModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 description: currentState.value!.description,
                                 shop: null,
                                 itemImageBackground: currentState.value!.itemImageBackground,
                                 itemDetailBackground: currentState.value!.itemDetailBackground,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittableOrderOverviewForm(value: newValue);

        return;
      }
      if (event is ChangedOrderOverviewItemImageBackground) {
        newValue = currentState.value!.copyWith(itemImageBackground: event.value);
        yield SubmittableOrderOverviewForm(value: newValue);

        return;
      }
      if (event is ChangedOrderOverviewItemDetailBackground) {
        newValue = currentState.value!.copyWith(itemDetailBackground: event.value);
        yield SubmittableOrderOverviewForm(value: newValue);

        return;
      }
      if (event is ChangedOrderOverviewConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableOrderOverviewForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDOrderOverviewFormError error(String message, OrderOverviewModel newValue) => DocumentIDOrderOverviewFormError(message: message, value: newValue);

  Future<OrderOverviewFormState> _isDocumentIDValid(String? value, OrderOverviewModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<OrderOverviewModel?> findDocument = orderOverviewRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableOrderOverviewForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

