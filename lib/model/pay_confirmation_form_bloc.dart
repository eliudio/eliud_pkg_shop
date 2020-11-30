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
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/pay_confirmation_form_event.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_form_state.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';

class PayConfirmationFormBloc extends Bloc<PayConfirmationFormEvent, PayConfirmationFormState> {
  final FormAction formAction;
  final String appId;

  PayConfirmationFormBloc(this.appId, { this.formAction }): super(PayConfirmationFormUninitialized());
  @override
  Stream<PayConfirmationFormState> mapEventToState(PayConfirmationFormEvent event) async* {
    final currentState = state;
    if (currentState is PayConfirmationFormUninitialized) {
      if (event is InitialiseNewPayConfirmationFormEvent) {
        PayConfirmationFormLoaded loaded = PayConfirmationFormLoaded(value: PayConfirmationModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePayConfirmationFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PayConfirmationFormLoaded loaded = PayConfirmationFormLoaded(value: await payConfirmationRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePayConfirmationFormNoLoadEvent) {
        PayConfirmationFormLoaded loaded = PayConfirmationFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PayConfirmationFormInitialized) {
      PayConfirmationModel newValue = null;
      if (event is ChangedPayConfirmationDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePayConfirmationForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPayConfirmationTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittablePayConfirmationForm(value: newValue);

        return;
      }
      if (event is ChangedPayConfirmationShop) {
        if (event.value != null)
          newValue = currentState.value.copyWith(shop: await shopRepository(appId: appId).get(event.value));
        else
          newValue = new PayConfirmationModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 shop: null,
                                 backToShopAction: currentState.value.backToShopAction,
          );
        yield SubmittablePayConfirmationForm(value: newValue);

        return;
      }
      if (event is ChangedPayConfirmationBackToShopAction) {
        newValue = currentState.value.copyWith(backToShopAction: event.value);
        yield SubmittablePayConfirmationForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDPayConfirmationFormError error(String message, PayConfirmationModel newValue) => DocumentIDPayConfirmationFormError(message: message, value: newValue);

  Future<PayConfirmationFormState> _isDocumentIDValid(String value, PayConfirmationModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PayConfirmationModel> findDocument = payConfirmationRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePayConfirmationForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

