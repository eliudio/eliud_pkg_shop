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

import 'package:eliud_pkg_shop/model/product_display_form_event.dart';
import 'package:eliud_pkg_shop/model/product_display_form_state.dart';
import 'package:eliud_pkg_shop/model/product_display_repository.dart';

class ProductDisplayFormBloc extends Bloc<ProductDisplayFormEvent, ProductDisplayFormState> {
  final FormAction? formAction;
  final String? appId;

  ProductDisplayFormBloc(this.appId, { this.formAction }): super(ProductDisplayFormUninitialized());
  @override
  Stream<ProductDisplayFormState> mapEventToState(ProductDisplayFormEvent event) async* {
    final currentState = state;
    if (currentState is ProductDisplayFormUninitialized) {
      if (event is InitialiseNewProductDisplayFormEvent) {
        ProductDisplayFormLoaded loaded = ProductDisplayFormLoaded(value: ProductDisplayModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 addToBasketText: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseProductDisplayFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        ProductDisplayFormLoaded loaded = ProductDisplayFormLoaded(value: await productDisplayRepository(appId: appId)!.get(event!.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseProductDisplayFormNoLoadEvent) {
        ProductDisplayFormLoaded loaded = ProductDisplayFormLoaded(value: event!.value);
        yield loaded;
        return;
      }
    } else if (currentState is ProductDisplayFormInitialized) {
      ProductDisplayModel? newValue = null;
      if (event is ChangedProductDisplayDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event!.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event!.value, newValue).asStream();
        } else {
          yield SubmittableProductDisplayForm(value: newValue);
        }

        return;
      }
      if (event is ChangedProductDisplayTitle) {
        newValue = currentState.value!.copyWith(title: event!.value);
        yield SubmittableProductDisplayForm(value: newValue);

        return;
      }
      if (event is ChangedProductDisplayItemDetailBackground) {
        if (event!.value != null)
          newValue = currentState.value!.copyWith(itemDetailBackground: await backgroundRepository(appId: appId)!.get(event!.value));
        else
          newValue = new ProductDisplayModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 itemDetailBackground: null,
                                 addToBasketText: currentState.value!.addToBasketText,
                                 buyAction: currentState.value!.buyAction,
                                 shop: currentState.value!.shop,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittableProductDisplayForm(value: newValue);

        return;
      }
      if (event is ChangedProductDisplayAddToBasketText) {
        newValue = currentState.value!.copyWith(addToBasketText: event!.value);
        yield SubmittableProductDisplayForm(value: newValue);

        return;
      }
      if (event is ChangedProductDisplayBuyAction) {
        newValue = currentState.value!.copyWith(buyAction: event!.value);
        yield SubmittableProductDisplayForm(value: newValue);

        return;
      }
      if (event is ChangedProductDisplayShop) {
        if (event!.value != null)
          newValue = currentState.value!.copyWith(shop: await shopRepository(appId: appId)!.get(event!.value));
        else
          newValue = new ProductDisplayModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 itemDetailBackground: currentState.value!.itemDetailBackground,
                                 addToBasketText: currentState.value!.addToBasketText,
                                 buyAction: currentState.value!.buyAction,
                                 shop: null,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittableProductDisplayForm(value: newValue);

        return;
      }
      if (event is ChangedProductDisplayConditions) {
        newValue = currentState.value!.copyWith(conditions: event!.value);
        yield SubmittableProductDisplayForm(value: newValue);

        return;
      }
    }
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

