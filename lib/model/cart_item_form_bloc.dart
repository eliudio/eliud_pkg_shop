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

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';

import 'package:eliud_model/tools/enums.dart';
import 'package:eliud_model/tools/types.dart';

import 'package:eliud_model/shared/rgb_model.dart';

import 'package:eliud_model/tools/string_validator.dart';
import 'package:eliud_model/shared/repository_export.dart';
import '../shared/repository_export.dart';


import 'cart_item_model.dart';
import 'cart_item_form_event.dart';
import 'cart_item_form_state.dart';

class CartItemFormBloc extends Bloc<CartItemFormEvent, CartItemFormState> {
  final ProductRepository _productRepository = productRepository();

  CartItemFormBloc(): super(CartItemFormUninitialized());
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
          newValue = currentState.value.copyWith(product: await _productRepository.get(event.value));
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

