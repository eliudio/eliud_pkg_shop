/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_form_bloc.dart
                       
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


import 'cart_model.dart';
import 'cart_form_event.dart';
import 'cart_form_state.dart';

class CartFormBloc extends Bloc<CartFormEvent, CartFormState> {
  final CartRepository _cartRepository = cartRepository();
  final FormAction formAction;
  final ShopRepository _shopRepository = shopRepository();
  final BackgroundRepository _backgroundRepository = backgroundRepository();

  CartFormBloc({ this.formAction }): super(CartFormUninitialized());
  @override
  Stream<CartFormState> mapEventToState(CartFormEvent event) async* {
    final currentState = state;
    if (currentState is CartFormUninitialized) {
      if (event is InitialiseNewCartFormEvent) {
        CartFormLoaded loaded = CartFormLoaded(value: CartModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 description: "",
                                 checkoutText: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseCartFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        CartFormLoaded loaded = CartFormLoaded(value: await _cartRepository.get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseCartFormNoLoadEvent) {
        CartFormLoaded loaded = CartFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is CartFormInitialized) {
      CartModel newValue = null;
      if (event is ChangedCartDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableCartForm(value: newValue);
        }

        return;
      }
      if (event is ChangedCartTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittableCartForm(value: newValue);

        return;
      }
      if (event is ChangedCartDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableCartForm(value: newValue);

        return;
      }
      if (event is ChangedCartCheckoutText) {
        newValue = currentState.value.copyWith(checkoutText: event.value);
        yield SubmittableCartForm(value: newValue);

        return;
      }
      if (event is ChangedCartShop) {
        if (event.value != null)
          newValue = currentState.value.copyWith(shop: await _shopRepository.get(event.value));
        else
          newValue = new CartModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 description: currentState.value.description,
                                 checkoutText: currentState.value.checkoutText,
                                 shop: null,
                                 itemImageBackground: currentState.value.itemImageBackground,
                                 itemDetailBackground: currentState.value.itemDetailBackground,
                                 checkoutAction: currentState.value.checkoutAction,
                                 backToShopAction: currentState.value.backToShopAction,
          );
        yield SubmittableCartForm(value: newValue);

        return;
      }
      if (event is ChangedCartItemImageBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(itemImageBackground: await _backgroundRepository.get(event.value));
        else
          newValue = new CartModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 description: currentState.value.description,
                                 checkoutText: currentState.value.checkoutText,
                                 shop: currentState.value.shop,
                                 itemImageBackground: null,
                                 itemDetailBackground: currentState.value.itemDetailBackground,
                                 checkoutAction: currentState.value.checkoutAction,
                                 backToShopAction: currentState.value.backToShopAction,
          );
        yield SubmittableCartForm(value: newValue);

        return;
      }
      if (event is ChangedCartItemDetailBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(itemDetailBackground: await _backgroundRepository.get(event.value));
        else
          newValue = new CartModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 description: currentState.value.description,
                                 checkoutText: currentState.value.checkoutText,
                                 shop: currentState.value.shop,
                                 itemImageBackground: currentState.value.itemImageBackground,
                                 itemDetailBackground: null,
                                 checkoutAction: currentState.value.checkoutAction,
                                 backToShopAction: currentState.value.backToShopAction,
          );
        yield SubmittableCartForm(value: newValue);

        return;
      }
      if (event is ChangedCartCheckoutAction) {
        newValue = currentState.value.copyWith(checkoutAction: event.value);
        yield SubmittableCartForm(value: newValue);

        return;
      }
      if (event is ChangedCartBackToShopAction) {
        newValue = currentState.value.copyWith(backToShopAction: event.value);
        yield SubmittableCartForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDCartFormError error(String message, CartModel newValue) => DocumentIDCartFormError(message: message, value: newValue);

  Future<CartFormState> _isDocumentIDValid(String value, CartModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<CartModel> findDocument = _cartRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableCartForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

