/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_form_bloc.dart
                       
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

import 'package:eliud_pkg_shop/model/product_form_event.dart';
import 'package:eliud_pkg_shop/model/product_form_state.dart';
import 'package:eliud_pkg_shop/model/product_repository.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  final FormAction? formAction;
  final String? appId;

  ProductFormBloc(this.appId, { this.formAction }): super(ProductFormUninitialized()) {
      on <InitialiseNewProductFormEvent> ((event, emit) {
        ProductFormLoaded loaded = ProductFormLoaded(value: ProductModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 about: "",
                                 price: 0.0,
                                 weight: 0.0,
                                 images: [],

        ));
        emit(loaded);
      });


      on <InitialiseProductFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        ProductFormLoaded loaded = ProductFormLoaded(value: await productRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseProductFormNoLoadEvent> ((event, emit) async {
        ProductFormLoaded loaded = ProductFormLoaded(value: event.value);
        emit(loaded);
      });
      ProductModel? newValue = null;
      on <ChangedProductDocumentID> ((event, emit) async {
      if (state is ProductFormInitialized) {
        final currentState = state as ProductFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableProductForm(value: newValue));
        }

      }
      });
      on <ChangedProductTitle> ((event, emit) async {
      if (state is ProductFormInitialized) {
        final currentState = state as ProductFormInitialized;
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableProductForm(value: newValue));

      }
      });
      on <ChangedProductAbout> ((event, emit) async {
      if (state is ProductFormInitialized) {
        final currentState = state as ProductFormInitialized;
        newValue = currentState.value!.copyWith(about: event.value);
        emit(SubmittableProductForm(value: newValue));

      }
      });
      on <ChangedProductPrice> ((event, emit) async {
      if (state is ProductFormInitialized) {
        final currentState = state as ProductFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(price: double.parse(event.value!));
          emit(SubmittableProductForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(price: 0.0);
          emit(PriceProductFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedProductWeight> ((event, emit) async {
      if (state is ProductFormInitialized) {
        final currentState = state as ProductFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(weight: double.parse(event.value!));
          emit(SubmittableProductForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(weight: 0.0);
          emit(WeightProductFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedProductShop> ((event, emit) async {
      if (state is ProductFormInitialized) {
        final currentState = state as ProductFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(shop: await shopRepository(appId: appId)!.get(event.value));
        emit(SubmittableProductForm(value: newValue));

      }
      });
      on <ChangedProductImages> ((event, emit) async {
      if (state is ProductFormInitialized) {
        final currentState = state as ProductFormInitialized;
        newValue = currentState.value!.copyWith(images: event.value);
        emit(SubmittableProductForm(value: newValue));

      }
      });
      on <ChangedProductPosSize> ((event, emit) async {
      if (state is ProductFormInitialized) {
        final currentState = state as ProductFormInitialized;
        newValue = currentState.value!.copyWith(posSize: event.value);
        emit(SubmittableProductForm(value: newValue));

      }
      });
  }


  DocumentIDProductFormError error(String message, ProductModel newValue) => DocumentIDProductFormError(message: message, value: newValue);

  Future<ProductFormState> _isDocumentIDValid(String? value, ProductModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<ProductModel?> findDocument = productRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableProductForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

