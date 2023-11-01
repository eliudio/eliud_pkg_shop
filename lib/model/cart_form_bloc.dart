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

import 'package:eliud_core/tools/enums.dart';



import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';

import 'package:eliud_pkg_shop/model/cart_form_event.dart';
import 'package:eliud_pkg_shop/model/cart_form_state.dart';

class CartFormBloc extends Bloc<CartFormEvent, CartFormState> {
  final FormAction? formAction;
  final String? appId;

  CartFormBloc(this.appId, { this.formAction }): super(CartFormUninitialized()) {
      on <InitialiseNewCartFormEvent> ((event, emit) {
        CartFormLoaded loaded = CartFormLoaded(value: CartModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 description: "",
                                 checkoutText: "",

        ));
        emit(loaded);
      });


      on <InitialiseCartFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        CartFormLoaded loaded = CartFormLoaded(value: await cartRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseCartFormNoLoadEvent> ((event, emit) async {
        CartFormLoaded loaded = CartFormLoaded(value: event.value);
        emit(loaded);
      });
      CartModel? newValue = null;
      on <ChangedCartDocumentID> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableCartForm(value: newValue));
        }

      }
      });
      on <ChangedCartTitle> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableCartForm(value: newValue));

      }
      });
      on <ChangedCartDescription> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableCartForm(value: newValue));

      }
      });
      on <ChangedCartCheckoutText> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(checkoutText: event.value);
        emit(SubmittableCartForm(value: newValue));

      }
      });
      on <ChangedCartShop> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(shop: await shopRepository(appId: appId)!.get(event.value));
        emit(SubmittableCartForm(value: newValue));

      }
      });
      on <ChangedCartItemImageBackground> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(itemImageBackground: event.value);
        emit(SubmittableCartForm(value: newValue));

      }
      });
      on <ChangedCartItemDetailBackground> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(itemDetailBackground: event.value);
        emit(SubmittableCartForm(value: newValue));

      }
      });
      on <ChangedCartCheckoutAction> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(checkoutAction: event.value);
        emit(SubmittableCartForm(value: newValue));

      }
      });
      on <ChangedCartBackToShopAction> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(backToShopAction: event.value);
        emit(SubmittableCartForm(value: newValue));

      }
      });
      on <ChangedCartOpenProductAction> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(openProductAction: event.value);
        emit(SubmittableCartForm(value: newValue));

      }
      });
      on <ChangedCartConditions> ((event, emit) async {
      if (state is CartFormInitialized) {
        final currentState = state as CartFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableCartForm(value: newValue));

      }
      });
  }


  DocumentIDCartFormError error(String message, CartModel newValue) => DocumentIDCartFormError(message: message, value: newValue);

  Future<CartFormState> _isDocumentIDValid(String? value, CartModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<CartModel?> findDocument = cartRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableCartForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

