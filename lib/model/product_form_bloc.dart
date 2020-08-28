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

import 'product_form_event.dart';
import 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  final ProductRepository _productRepository = productRepository();
  final FormAction formAction;
  final ShopRepository _shopRepository = shopRepository();
  final PosSizeRepository _posSizeRepository = posSizeRepository();

  ProductFormBloc({ this.formAction }): super(ProductFormUninitialized());
  @override
  Stream<ProductFormState> mapEventToState(ProductFormEvent event) async* {
    final currentState = state;
    if (currentState is ProductFormUninitialized) {
      if (event is InitialiseNewProductFormEvent) {
        ProductFormLoaded loaded = ProductFormLoaded(value: ProductModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 about: "",
                                 price: 0.0,
                                 weight: 0.0,
                                 images: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseProductFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        ProductFormLoaded loaded = ProductFormLoaded(value: await _productRepository.get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseProductFormNoLoadEvent) {
        ProductFormLoaded loaded = ProductFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is ProductFormInitialized) {
      ProductModel newValue = null;
      if (event is ChangedProductDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableProductForm(value: newValue);
        }

        return;
      }
      if (event is ChangedProductTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittableProductForm(value: newValue);

        return;
      }
      if (event is ChangedProductAbout) {
        newValue = currentState.value.copyWith(about: event.value);
        yield SubmittableProductForm(value: newValue);

        return;
      }
      if (event is ChangedProductPrice) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(price: double.parse(event.value));
          yield SubmittableProductForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(price: 0.0);
          yield PriceProductFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedProductWeight) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(weight: double.parse(event.value));
          yield SubmittableProductForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(weight: 0.0);
          yield WeightProductFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedProductShop) {
        if (event.value != null)
          newValue = currentState.value.copyWith(shop: await _shopRepository.get(event.value));
        else
          newValue = new ProductModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 about: currentState.value.about,
                                 price: currentState.value.price,
                                 weight: currentState.value.weight,
                                 shop: null,
                                 images: currentState.value.images,
                                 posSize: currentState.value.posSize,
          );
        yield SubmittableProductForm(value: newValue);

        return;
      }
      if (event is ChangedProductImages) {
        newValue = currentState.value.copyWith(images: event.value);
        yield SubmittableProductForm(value: newValue);

        return;
      }
      if (event is ChangedProductPosSize) {
        if (event.value != null)
          newValue = currentState.value.copyWith(posSize: await _posSizeRepository.get(event.value));
        else
          newValue = new ProductModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 about: currentState.value.about,
                                 price: currentState.value.price,
                                 weight: currentState.value.weight,
                                 shop: currentState.value.shop,
                                 images: currentState.value.images,
                                 posSize: null,
          );
        yield SubmittableProductForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDProductFormError error(String message, ProductModel newValue) => DocumentIDProductFormError(message: message, value: newValue);

  Future<ProductFormState> _isDocumentIDValid(String value, ProductModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<ProductModel> findDocument = _productRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableProductForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

