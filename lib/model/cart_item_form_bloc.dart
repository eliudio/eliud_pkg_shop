/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/cart_item_form_event.dart';
import 'package:eliud_pkg_shop/model/cart_item_form_state.dart';
import 'package:eliud_pkg_shop/model/cart_item_repository.dart';

class CartItemFormBloc extends Bloc<CartItemFormEvent, CartItemFormState> {
  final String appId;

  CartItemFormBloc(this.appId, ): super(CartItemFormUninitialized());
  @override
  Stream<CartItemFormState> mapEventToState(CartItemFormEvent event) async* {
    final currentState = state;
    if (currentState is CartItemFormUninitialized) {
      if (event is InitialiseNewCartItemFormEvent) {
        CartItemFormLoaded loaded = CartItemFormLoaded(value: CartItemModel(
                                               documentID: "IDENTIFIER", 
                                 amount: 0,
                                 appId: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseCartItemFormEvent) {
        CartItemFormLoaded loaded = CartItemFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseCartItemFormNoLoadEvent) {
        CartItemFormLoaded loaded = CartItemFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is CartItemFormInitialized) {
      CartItemModel newValue = null;
      if (event is ChangedCartItemAmount) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(amount: int.parse(event.value));
          yield SubmittableCartItemForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(amount: 0);
          yield AmountCartItemFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedCartItemAppId) {
        newValue = currentState.value.copyWith(appId: event.value);
        yield SubmittableCartItemForm(value: newValue);

        return;
      }
      if (event is ChangedCartItemProduct) {
        if (event.value != null)
          newValue = currentState.value.copyWith(product: await productRepository(appID: appId).get(event.value));
        else
          newValue = new CartItemModel(
                                 documentID: currentState.value.documentID,
                                 amount: currentState.value.amount,
                                 appId: currentState.value.appId,
                                 product: null,
          );
        yield SubmittableCartItemForm(value: newValue);

        return;
      }
    }
  }


}

