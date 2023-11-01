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

import 'package:eliud_core/tools/enums.dart';



import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';

import 'package:eliud_pkg_shop/model/pay_form_event.dart';
import 'package:eliud_pkg_shop/model/pay_form_state.dart';

class PayFormBloc extends Bloc<PayFormEvent, PayFormState> {
  final FormAction? formAction;
  final String? appId;

  PayFormBloc(this.appId, { this.formAction }): super(PayFormUninitialized()) {
      on <InitialiseNewPayFormEvent> ((event, emit) {
        PayFormLoaded loaded = PayFormLoaded(value: PayModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        emit(loaded);
      });


      on <InitialisePayFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PayFormLoaded loaded = PayFormLoaded(value: await payRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialisePayFormNoLoadEvent> ((event, emit) async {
        PayFormLoaded loaded = PayFormLoaded(value: event.value);
        emit(loaded);
      });
      PayModel? newValue = null;
      on <ChangedPayDocumentID> ((event, emit) async {
      if (state is PayFormInitialized) {
        final currentState = state as PayFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePayForm(value: newValue));
        }

      }
      });
      on <ChangedPayDescription> ((event, emit) async {
      if (state is PayFormInitialized) {
        final currentState = state as PayFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittablePayForm(value: newValue));

      }
      });
      on <ChangedPaySucceeded> ((event, emit) async {
      if (state is PayFormInitialized) {
        final currentState = state as PayFormInitialized;
        newValue = currentState.value!.copyWith(succeeded: event.value);
        emit(SubmittablePayForm(value: newValue));

      }
      });
      on <ChangedPayShop> ((event, emit) async {
      if (state is PayFormInitialized) {
        final currentState = state as PayFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(shop: await shopRepository(appId: appId)!.get(event.value));
        emit(SubmittablePayForm(value: newValue));

      }
      });
      on <ChangedPayConditions> ((event, emit) async {
      if (state is PayFormInitialized) {
        final currentState = state as PayFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittablePayForm(value: newValue));

      }
      });
  }


  DocumentIDPayFormError error(String message, PayModel newValue) => DocumentIDPayFormError(message: message, value: newValue);

  Future<PayFormState> _isDocumentIDValid(String? value, PayModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PayModel?> findDocument = payRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePayForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

