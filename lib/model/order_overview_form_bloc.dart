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
import 'package:flutter/cupertino.dart';

import 'package:eliud_model/tools/enums.dart';
import 'package:eliud_model/tools/types.dart';

import 'package:eliud_model/model/rgb_model.dart';

import 'package:eliud_model/tools/string_validator.dart';

// import the main classes
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_model/model/abstract_repository_singleton.dart';
import 'package:eliud_model/model/repository_export.dart';
import 'package:eliud_model/model/model_export.dart';
import 'package:eliud_model/shared/action_model.dart';
import 'package:eliud_model/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import '../model/model_export.dart';
import '../model/entity_export.dart';

import 'order_overview_form_event.dart';
import 'order_overview_form_state.dart';

class OrderOverviewFormBloc extends Bloc<OrderOverviewFormEvent, OrderOverviewFormState> {
  final OrderOverviewRepository _orderOverviewRepository = orderOverviewRepository();
  final FormAction formAction;
  final ShopRepository _shopRepository = shopRepository();
  final BackgroundRepository _backgroundRepository = backgroundRepository();

  OrderOverviewFormBloc({ this.formAction }): super(OrderOverviewFormUninitialized());
  @override
  Stream<OrderOverviewFormState> mapEventToState(OrderOverviewFormEvent event) async* {
    final currentState = state;
    if (currentState is OrderOverviewFormUninitialized) {
      if (event is InitialiseNewOrderOverviewFormEvent) {
        OrderOverviewFormLoaded loaded = OrderOverviewFormLoaded(value: OrderOverviewModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseOrderOverviewFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        OrderOverviewFormLoaded loaded = OrderOverviewFormLoaded(value: await _orderOverviewRepository.get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseOrderOverviewFormNoLoadEvent) {
        OrderOverviewFormLoaded loaded = OrderOverviewFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is OrderOverviewFormInitialized) {
      OrderOverviewModel newValue = null;
      if (event is ChangedOrderOverviewDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableOrderOverviewForm(value: newValue);
        }

        return;
      }
      if (event is ChangedOrderOverviewTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittableOrderOverviewForm(value: newValue);

        return;
      }
      if (event is ChangedOrderOverviewShop) {
        if (event.value != null)
          newValue = currentState.value.copyWith(shop: await _shopRepository.get(event.value));
        else
          newValue = new OrderOverviewModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 shop: null,
                                 itemImageBackground: currentState.value.itemImageBackground,
                                 itemDetailBackground: currentState.value.itemDetailBackground,
          );
        yield SubmittableOrderOverviewForm(value: newValue);

        return;
      }
      if (event is ChangedOrderOverviewItemImageBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(itemImageBackground: await _backgroundRepository.get(event.value));
        else
          newValue = new OrderOverviewModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 shop: currentState.value.shop,
                                 itemImageBackground: null,
                                 itemDetailBackground: currentState.value.itemDetailBackground,
          );
        yield SubmittableOrderOverviewForm(value: newValue);

        return;
      }
      if (event is ChangedOrderOverviewItemDetailBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(itemDetailBackground: await _backgroundRepository.get(event.value));
        else
          newValue = new OrderOverviewModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 shop: currentState.value.shop,
                                 itemImageBackground: currentState.value.itemImageBackground,
                                 itemDetailBackground: null,
          );
        yield SubmittableOrderOverviewForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDOrderOverviewFormError error(String message, OrderOverviewModel newValue) => DocumentIDOrderOverviewFormError(message: message, value: newValue);

  Future<OrderOverviewFormState> _isDocumentIDValid(String value, OrderOverviewModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<OrderOverviewModel> findDocument = _orderOverviewRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableOrderOverviewForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

