/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/enums.dart';



import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';

import 'package:eliud_pkg_shop/model/product_display_form_event.dart';
import 'package:eliud_pkg_shop/model/product_display_form_state.dart';

class ProductDisplayFormBloc extends Bloc<ProductDisplayFormEvent, ProductDisplayFormState> {
  final FormAction? formAction;
  final String? appId;

  ProductDisplayFormBloc(this.appId, { this.formAction }): super(ProductDisplayFormUninitialized()) {
      on <InitialiseNewProductDisplayFormEvent> ((event, emit) {
        ProductDisplayFormLoaded loaded = ProductDisplayFormLoaded(value: ProductDisplayModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 addToBasketText: "",

        ));
        emit(loaded);
      });


      on <InitialiseProductDisplayFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        ProductDisplayFormLoaded loaded = ProductDisplayFormLoaded(value: await productDisplayRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseProductDisplayFormNoLoadEvent> ((event, emit) async {
        ProductDisplayFormLoaded loaded = ProductDisplayFormLoaded(value: event.value);
        emit(loaded);
      });
      ProductDisplayModel? newValue = null;
      on <ChangedProductDisplayDocumentID> ((event, emit) async {
      if (state is ProductDisplayFormInitialized) {
        final currentState = state as ProductDisplayFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableProductDisplayForm(value: newValue));
        }

      }
      });
      on <ChangedProductDisplayDescription> ((event, emit) async {
      if (state is ProductDisplayFormInitialized) {
        final currentState = state as ProductDisplayFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableProductDisplayForm(value: newValue));

      }
      });
      on <ChangedProductDisplayItemDetailBackground> ((event, emit) async {
      if (state is ProductDisplayFormInitialized) {
        final currentState = state as ProductDisplayFormInitialized;
        newValue = currentState.value!.copyWith(itemDetailBackground: event.value);
        emit(SubmittableProductDisplayForm(value: newValue));

      }
      });
      on <ChangedProductDisplayAddToBasketText> ((event, emit) async {
      if (state is ProductDisplayFormInitialized) {
        final currentState = state as ProductDisplayFormInitialized;
        newValue = currentState.value!.copyWith(addToBasketText: event.value);
        emit(SubmittableProductDisplayForm(value: newValue));

      }
      });
      on <ChangedProductDisplayBuyAction> ((event, emit) async {
      if (state is ProductDisplayFormInitialized) {
        final currentState = state as ProductDisplayFormInitialized;
        newValue = currentState.value!.copyWith(buyAction: event.value);
        emit(SubmittableProductDisplayForm(value: newValue));

      }
      });
      on <ChangedProductDisplayShop> ((event, emit) async {
      if (state is ProductDisplayFormInitialized) {
        final currentState = state as ProductDisplayFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(shop: await shopRepository(appId: appId)!.get(event.value));
        emit(SubmittableProductDisplayForm(value: newValue));

      }
      });
      on <ChangedProductDisplayBackground> ((event, emit) async {
      if (state is ProductDisplayFormInitialized) {
        final currentState = state as ProductDisplayFormInitialized;
        newValue = currentState.value!.copyWith(background: event.value);
        emit(SubmittableProductDisplayForm(value: newValue));

      }
      });
      on <ChangedProductDisplayConditions> ((event, emit) async {
      if (state is ProductDisplayFormInitialized) {
        final currentState = state as ProductDisplayFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableProductDisplayForm(value: newValue));

      }
      });
  }


  DocumentIDProductDisplayFormError error(String message, ProductDisplayModel newValue) => DocumentIDProductDisplayFormError(message: message, value: newValue);

  Future<ProductDisplayFormState> _isDocumentIDValid(String? value, ProductDisplayModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<ProductDisplayModel?> findDocument = productDisplayRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableProductDisplayForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

