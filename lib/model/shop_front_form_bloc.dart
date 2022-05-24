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

import 'package:eliud_pkg_shop/model/shop_front_form_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_form_state.dart';
import 'package:eliud_pkg_shop/model/shop_front_repository.dart';

class ShopFrontFormBloc extends Bloc<ShopFrontFormEvent, ShopFrontFormState> {
  final FormAction? formAction;
  final String? appId;

  ShopFrontFormBloc(this.appId, { this.formAction }): super(ShopFrontFormUninitialized());
  @override
  Stream<ShopFrontFormState> mapEventToState(ShopFrontFormEvent event) async* {
    final currentState = state;
    if (currentState is ShopFrontFormUninitialized) {
      on <InitialiseNewShopFrontFormEvent> ((event, emit) {
        ShopFrontFormLoaded loaded = ShopFrontFormLoaded(value: ShopFrontModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 description: "",
                                 size: 0.0,
                                 cardElevation: 0.0,
                                 cardAxisSpacing: 0.0,
                                 addToCartColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 

        ));
        emit(loaded);
      });


      if (event is InitialiseShopFrontFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        ShopFrontFormLoaded loaded = ShopFrontFormLoaded(value: await shopFrontRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseShopFrontFormNoLoadEvent) {
        ShopFrontFormLoaded loaded = ShopFrontFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is ShopFrontFormInitialized) {
      ShopFrontModel? newValue = null;
      on <ChangedShopFrontDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableShopFrontForm(value: newValue));
        }

      });
      on <ChangedShopFrontTitle> ((event, emit) async {
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableShopFrontForm(value: newValue));

      });
      on <ChangedShopFrontDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableShopFrontForm(value: newValue));

      });
      on <ChangedShopFrontShop> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(shop: await shopRepository(appId: appId)!.get(event.value));
        emit(SubmittableShopFrontForm(value: newValue));

      });
      on <ChangedShopFrontSize> ((event, emit) async {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(size: double.parse(event.value!));
          emit(SubmittableShopFrontForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(size: 0.0);
          emit(SizeShopFrontFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      });
      on <ChangedShopFrontCardElevation> ((event, emit) async {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(cardElevation: double.parse(event.value!));
          emit(SubmittableShopFrontForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(cardElevation: 0.0);
          emit(CardElevationShopFrontFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      });
      on <ChangedShopFrontCardAxisSpacing> ((event, emit) async {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(cardAxisSpacing: double.parse(event.value!));
          emit(SubmittableShopFrontForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(cardAxisSpacing: 0.0);
          emit(CardAxisSpacingShopFrontFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      });
      on <ChangedShopFrontItemCardBackground> ((event, emit) async {
        newValue = currentState.value!.copyWith(itemCardBackground: event.value);
        emit(SubmittableShopFrontForm(value: newValue));

      });
      on <ChangedShopFrontAddToCartColor> ((event, emit) async {
        newValue = currentState.value!.copyWith(addToCartColor: event.value);
        emit(SubmittableShopFrontForm(value: newValue));

      });
      on <ChangedShopFrontScrollDirection> ((event, emit) async {
        newValue = currentState.value!.copyWith(scrollDirection: event.value);
        emit(SubmittableShopFrontForm(value: newValue));

      });
      on <ChangedShopFrontBuyAction> ((event, emit) async {
        newValue = currentState.value!.copyWith(buyAction: event.value);
        emit(SubmittableShopFrontForm(value: newValue));

      });
      on <ChangedShopFrontOpenProductAction> ((event, emit) async {
        newValue = currentState.value!.copyWith(openProductAction: event.value);
        emit(SubmittableShopFrontForm(value: newValue));

      });
      on <ChangedShopFrontPadding> ((event, emit) async {
        newValue = currentState.value!.copyWith(padding: event.value);
        emit(SubmittableShopFrontForm(value: newValue));

      });
      on <ChangedShopFrontConditions> ((event, emit) async {
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableShopFrontForm(value: newValue));

      });
    }
  }


  DocumentIDShopFrontFormError error(String message, ShopFrontModel newValue) => DocumentIDShopFrontFormError(message: message, value: newValue);

  Future<ShopFrontFormState> _isDocumentIDValid(String? value, ShopFrontModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<ShopFrontModel?> findDocument = shopFrontRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableShopFrontForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

