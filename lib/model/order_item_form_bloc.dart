/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'order_item_form_event.dart';
import 'order_item_form_state.dart';

class OrderItemFormBloc extends Bloc<OrderItemFormEvent, OrderItemFormState> {
  final ProductRepository _productRepository = productRepository();

  OrderItemFormBloc(): super(OrderItemFormUninitialized());
  @override
  Stream<OrderItemFormState> mapEventToState(OrderItemFormEvent event) async* {
    final currentState = state;
    if (currentState is OrderItemFormUninitialized) {
      if (event is InitialiseNewOrderItemFormEvent) {
        OrderItemFormLoaded loaded = OrderItemFormLoaded(value: OrderItemModel(
                                               documentID: "IDENTIFIER", 
                                 amount: 0,
                                 appId: "",
                                 soldPrice: 0.0,

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseOrderItemFormEvent) {
        OrderItemFormLoaded loaded = OrderItemFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseOrderItemFormNoLoadEvent) {
        OrderItemFormLoaded loaded = OrderItemFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is OrderItemFormInitialized) {
      OrderItemModel newValue = null;
      if (event is ChangedOrderItemAmount) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(amount: int.parse(event.value));
          yield SubmittableOrderItemForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(amount: 0);
          yield AmountOrderItemFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedOrderItemAppId) {
        newValue = currentState.value.copyWith(appId: event.value);
        yield SubmittableOrderItemForm(value: newValue);

        return;
      }
      if (event is ChangedOrderItemSoldPrice) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(soldPrice: double.parse(event.value));
          yield SubmittableOrderItemForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(soldPrice: 0.0);
          yield SoldPriceOrderItemFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedOrderItemProduct) {
        if (event.value != null)
          newValue = currentState.value.copyWith(product: await _productRepository.get(event.value));
        else
          newValue = new OrderItemModel(
                                 documentID: currentState.value.documentID,
                                 amount: currentState.value.amount,
                                 appId: currentState.value.appId,
                                 soldPrice: currentState.value.soldPrice,
                                 product: null,
          );
        yield SubmittableOrderItemForm(value: newValue);

        return;
      }
    }
  }


}

