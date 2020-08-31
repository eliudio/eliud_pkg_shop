/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_form_bloc.dart
                       
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
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';

import 'shop_form_event.dart';
import 'shop_form_state.dart';
import 'shop_repository.dart';

class ShopFormBloc extends Bloc<ShopFormEvent, ShopFormState> {
  final ShopRepository _shopRepository = shopRepository();
  final FormAction formAction;

  ShopFormBloc({ this.formAction }): super(ShopFormUninitialized());
  @override
  Stream<ShopFormState> mapEventToState(ShopFormEvent event) async* {
    final currentState = state;
    if (currentState is ShopFormUninitialized) {
      if (event is InitialiseNewShopFormEvent) {
        ShopFormLoaded loaded = ShopFormLoaded(value: ShopModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 shortDescription: "",
                                 currency: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseShopFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        ShopFormLoaded loaded = ShopFormLoaded(value: await _shopRepository.get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseShopFormNoLoadEvent) {
        ShopFormLoaded loaded = ShopFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is ShopFormInitialized) {
      ShopModel newValue = null;
      if (event is ChangedShopDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableShopForm(value: newValue);
        }

        return;
      }
      if (event is ChangedShopDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableShopForm(value: newValue);

        return;
      }
      if (event is ChangedShopShortDescription) {
        newValue = currentState.value.copyWith(shortDescription: event.value);
        yield SubmittableShopForm(value: newValue);

        return;
      }
      if (event is ChangedShopCurrency) {
        newValue = currentState.value.copyWith(currency: event.value);
        yield SubmittableShopForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDShopFormError error(String message, ShopModel newValue) => DocumentIDShopFormError(message: message, value: newValue);

  Future<ShopFormState> _isDocumentIDValid(String value, ShopModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<ShopModel> findDocument = _shopRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableShopForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

