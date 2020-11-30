/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_form_bloc.dart
                       
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

import 'package:eliud_pkg_shop/model/pay_form_event.dart';
import 'package:eliud_pkg_shop/model/pay_form_state.dart';
import 'package:eliud_pkg_shop/model/pay_repository.dart';

class PayFormBloc extends Bloc<PayFormEvent, PayFormState> {
  final FormAction formAction;
  final String appId;

  PayFormBloc(this.appId, { this.formAction }): super(PayFormUninitialized());
  @override
  Stream<PayFormState> mapEventToState(PayFormEvent event) async* {
    final currentState = state;
    if (currentState is PayFormUninitialized) {
      if (event is InitialiseNewPayFormEvent) {
        PayFormLoaded loaded = PayFormLoaded(value: PayModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePayFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PayFormLoaded loaded = PayFormLoaded(value: await payRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePayFormNoLoadEvent) {
        PayFormLoaded loaded = PayFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PayFormInitialized) {
      PayModel newValue = null;
      if (event is ChangedPayDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePayForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPayTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittablePayForm(value: newValue);

        return;
      }
      if (event is ChangedPaySucceeded) {
        newValue = currentState.value.copyWith(succeeded: event.value);
        yield SubmittablePayForm(value: newValue);

        return;
      }
      if (event is ChangedPayShop) {
        if (event.value != null)
          newValue = currentState.value.copyWith(shop: await shopRepository(appId: appId).get(event.value));
        else
          newValue = new PayModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 succeeded: currentState.value.succeeded,
                                 shop: null,
          );
        yield SubmittablePayForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDPayFormError error(String message, PayModel newValue) => DocumentIDPayFormError(message: message, value: newValue);

  Future<PayFormState> _isDocumentIDValid(String value, PayModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PayModel> findDocument = payRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePayForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

