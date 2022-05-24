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
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/order_item_form_event.dart';
import 'package:eliud_pkg_shop/model/order_item_form_state.dart';
import 'package:eliud_pkg_shop/model/order_item_repository.dart';

class OrderItemFormBloc extends Bloc<OrderItemFormEvent, OrderItemFormState> {
  final String? appId;

  OrderItemFormBloc(this.appId, ): super(OrderItemFormUninitialized());
  @override
  Stream<OrderItemFormState> mapEventToState(OrderItemFormEvent event) async* {
    final currentState = state;
    if (currentState is OrderItemFormUninitialized) {
      on <InitialiseNewOrderItemFormEvent> ((event, emit) {
        OrderItemFormLoaded loaded = OrderItemFormLoaded(value: OrderItemModel(
                                               documentID: "IDENTIFIER", 
                                 amount: 0,
                                 appId: "",
                                 soldPrice: 0.0,

        ));
        emit(loaded);
      });


      if (event is InitialiseOrderItemFormEvent) {
        OrderItemFormLoaded loaded = OrderItemFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseOrderItemFormNoLoadEvent) {
        OrderItemFormLoaded loaded = OrderItemFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is OrderItemFormInitialized) {
      OrderItemModel? newValue = null;
      on <ChangedOrderItemAmount> ((event, emit) async {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(amount: int.parse(event.value!));
          emit(SubmittableOrderItemForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(amount: 0);
          emit(AmountOrderItemFormError(message: "Value should be a number", value: newValue));
        }
      });
      on <ChangedOrderItemAppId> ((event, emit) async {
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableOrderItemForm(value: newValue));

      });
      on <ChangedOrderItemSoldPrice> ((event, emit) async {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(soldPrice: double.parse(event.value!));
          emit(SubmittableOrderItemForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(soldPrice: 0.0);
          emit(SoldPriceOrderItemFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      });
      on <ChangedOrderItemProduct> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(product: await productRepository(appId: appId)!.get(event.value));
        emit(SubmittableOrderItemForm(value: newValue));

      });
    }
  }


}

