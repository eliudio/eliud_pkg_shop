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

import 'pay_form_event.dart';
import 'pay_form_state.dart';

class PayFormBloc extends Bloc<PayFormEvent, PayFormState> {
  final PayRepository _payRepository = payRepository();
  final FormAction formAction;
  final ShopRepository _shopRepository = shopRepository();

  PayFormBloc({ this.formAction }): super(PayFormUninitialized());
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
        PayFormLoaded loaded = PayFormLoaded(value: await _payRepository.get(event.value.documentID));
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
          newValue = currentState.value.copyWith(shop: await _shopRepository.get(event.value));
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
    Future<PayModel> findDocument = _payRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePayForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

