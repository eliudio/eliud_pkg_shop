/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_form_bloc.dart
                       
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

import 'shop_front_form_event.dart';
import 'shop_front_form_state.dart';

class ShopFrontFormBloc extends Bloc<ShopFrontFormEvent, ShopFrontFormState> {
  final ShopFrontRepository _shopFrontRepository = shopFrontRepository();
  final FormAction formAction;
  final ShopRepository _shopRepository = shopRepository();
  final BackgroundRepository _backgroundRepository = backgroundRepository();

  ShopFrontFormBloc({ this.formAction }): super(ShopFrontFormUninitialized());
  @override
  Stream<ShopFrontFormState> mapEventToState(ShopFrontFormEvent event) async* {
    final currentState = state;
    if (currentState is ShopFrontFormUninitialized) {
      if (event is InitialiseNewShopFrontFormEvent) {
        ShopFrontFormLoaded loaded = ShopFrontFormLoaded(value: ShopFrontModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 description: "",
                                 addToBasketText: "",
                                 size: 0.0,
                                 cardElevation: 0.0,
                                 cardAxisSpacing: 0.0,
                                 addToCartColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseShopFrontFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        ShopFrontFormLoaded loaded = ShopFrontFormLoaded(value: await _shopFrontRepository.get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseShopFrontFormNoLoadEvent) {
        ShopFrontFormLoaded loaded = ShopFrontFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is ShopFrontFormInitialized) {
      ShopFrontModel newValue = null;
      if (event is ChangedShopFrontDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableShopFrontForm(value: newValue);
        }

        return;
      }
      if (event is ChangedShopFrontTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
      if (event is ChangedShopFrontDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
      if (event is ChangedShopFrontAddToBasketText) {
        newValue = currentState.value.copyWith(addToBasketText: event.value);
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
      if (event is ChangedShopFrontShop) {
        if (event.value != null)
          newValue = currentState.value.copyWith(shop: await _shopRepository.get(event.value));
        else
          newValue = new ShopFrontModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 description: currentState.value.description,
                                 addToBasketText: currentState.value.addToBasketText,
                                 shop: null,
                                 size: currentState.value.size,
                                 cardElevation: currentState.value.cardElevation,
                                 cardAxisSpacing: currentState.value.cardAxisSpacing,
                                 itemCardBackground: currentState.value.itemCardBackground,
                                 itemDetailBackground: currentState.value.itemDetailBackground,
                                 addToCartColor: currentState.value.addToCartColor,
                                 view: currentState.value.view,
                                 scrollDirection: currentState.value.scrollDirection,
                                 buyAction: currentState.value.buyAction,
          );
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
      if (event is ChangedShopFrontSize) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(size: double.parse(event.value));
          yield SubmittableShopFrontForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(size: 0.0);
          yield SizeShopFrontFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedShopFrontCardElevation) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(cardElevation: double.parse(event.value));
          yield SubmittableShopFrontForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(cardElevation: 0.0);
          yield CardElevationShopFrontFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedShopFrontCardAxisSpacing) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(cardAxisSpacing: double.parse(event.value));
          yield SubmittableShopFrontForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(cardAxisSpacing: 0.0);
          yield CardAxisSpacingShopFrontFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedShopFrontItemCardBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(itemCardBackground: await _backgroundRepository.get(event.value));
        else
          newValue = new ShopFrontModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 description: currentState.value.description,
                                 addToBasketText: currentState.value.addToBasketText,
                                 shop: currentState.value.shop,
                                 size: currentState.value.size,
                                 cardElevation: currentState.value.cardElevation,
                                 cardAxisSpacing: currentState.value.cardAxisSpacing,
                                 itemCardBackground: null,
                                 itemDetailBackground: currentState.value.itemDetailBackground,
                                 addToCartColor: currentState.value.addToCartColor,
                                 view: currentState.value.view,
                                 scrollDirection: currentState.value.scrollDirection,
                                 buyAction: currentState.value.buyAction,
          );
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
      if (event is ChangedShopFrontItemDetailBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(itemDetailBackground: await _backgroundRepository.get(event.value));
        else
          newValue = new ShopFrontModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 description: currentState.value.description,
                                 addToBasketText: currentState.value.addToBasketText,
                                 shop: currentState.value.shop,
                                 size: currentState.value.size,
                                 cardElevation: currentState.value.cardElevation,
                                 cardAxisSpacing: currentState.value.cardAxisSpacing,
                                 itemCardBackground: currentState.value.itemCardBackground,
                                 itemDetailBackground: null,
                                 addToCartColor: currentState.value.addToCartColor,
                                 view: currentState.value.view,
                                 scrollDirection: currentState.value.scrollDirection,
                                 buyAction: currentState.value.buyAction,
          );
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
      if (event is ChangedShopFrontAddToCartColor) {
        newValue = currentState.value.copyWith(addToCartColor: event.value);
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
      if (event is ChangedShopFrontView) {
        newValue = currentState.value.copyWith(view: event.value);
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
      if (event is ChangedShopFrontScrollDirection) {
        newValue = currentState.value.copyWith(scrollDirection: event.value);
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
      if (event is ChangedShopFrontBuyAction) {
        newValue = currentState.value.copyWith(buyAction: event.value);
        yield SubmittableShopFrontForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDShopFrontFormError error(String message, ShopFrontModel newValue) => DocumentIDShopFrontFormError(message: message, value: newValue);

  Future<ShopFrontFormState> _isDocumentIDValid(String value, ShopFrontModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<ShopFrontModel> findDocument = _shopFrontRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableShopFrontForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

