/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_form_bloc.dart
                       
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

import 'package:eliud_pkg_shop/model/pay_confirmation_form_event.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_form_state.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';

class PayConfirmationFormBloc extends Bloc<PayConfirmationFormEvent, PayConfirmationFormState> {
  final FormAction? formAction;
  final String? appId;

  PayConfirmationFormBloc(this.appId, { this.formAction }): super(PayConfirmationFormUninitialized()) {
      on <InitialiseNewPayConfirmationFormEvent> ((event, emit) {
        PayConfirmationFormLoaded loaded = PayConfirmationFormLoaded(value: PayConfirmationModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        emit(loaded);
      });


      on <InitialisePayConfirmationFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PayConfirmationFormLoaded loaded = PayConfirmationFormLoaded(value: await payConfirmationRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialisePayConfirmationFormNoLoadEvent> ((event, emit) async {
        PayConfirmationFormLoaded loaded = PayConfirmationFormLoaded(value: event.value);
        emit(loaded);
      });
      PayConfirmationModel? newValue = null;
      on <ChangedPayConfirmationDocumentID> ((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePayConfirmationForm(value: newValue));
        }

      }
      });
      on <ChangedPayConfirmationDescription> ((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittablePayConfirmationForm(value: newValue));

      }
      });
      on <ChangedPayConfirmationShop> ((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(shop: await shopRepository(appId: appId)!.get(event.value));
        emit(SubmittablePayConfirmationForm(value: newValue));

      }
      });
      on <ChangedPayConfirmationBackToShopAction> ((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        newValue = currentState.value!.copyWith(backToShopAction: event.value);
        emit(SubmittablePayConfirmationForm(value: newValue));

      }
      });
      on <ChangedPayConfirmationConditions> ((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittablePayConfirmationForm(value: newValue));

      }
      });
  }


  DocumentIDPayConfirmationFormError error(String message, PayConfirmationModel newValue) => DocumentIDPayConfirmationFormError(message: message, value: newValue);

  Future<PayConfirmationFormState> _isDocumentIDValid(String? value, PayConfirmationModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PayConfirmationModel?> findDocument = payConfirmationRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePayConfirmationForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

