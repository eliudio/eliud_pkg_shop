/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';

import 'package:eliud_model/tools/enums.dart';
import 'package:eliud_model/tools/types.dart';

import 'package:eliud_model/shared/rgb_model.dart';

import 'package:eliud_model/tools/string_validator.dart';
import 'package:eliud_model/shared/repository_export.dart';
import '../shared/repository_export.dart';


import 'member_cart_model.dart';
import 'member_cart_form_event.dart';
import 'member_cart_form_state.dart';

class MemberCartFormBloc extends Bloc<MemberCartFormEvent, MemberCartFormState> {
  final MemberCartRepository _memberCartRepository = memberCartRepository();
  final FormAction formAction;

  MemberCartFormBloc({ this.formAction }): super(MemberCartFormUninitialized());
  @override
  Stream<MemberCartFormState> mapEventToState(MemberCartFormEvent event) async* {
    final currentState = state;
    if (currentState is MemberCartFormUninitialized) {
      if (event is InitialiseNewMemberCartFormEvent) {
        MemberCartFormLoaded loaded = MemberCartFormLoaded(value: MemberCartModel(
                                               documentID: "",
                                 items: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseMemberCartFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        MemberCartFormLoaded loaded = MemberCartFormLoaded(value: await _memberCartRepository.get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseMemberCartFormNoLoadEvent) {
        MemberCartFormLoaded loaded = MemberCartFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is MemberCartFormInitialized) {
      MemberCartModel newValue = null;
      if (event is ChangedMemberCartDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableMemberCartForm(value: newValue);
        }

        return;
      }
      if (event is ChangedMemberCartItems) {
        newValue = currentState.value.copyWith(items: event.value);
        yield SubmittableMemberCartForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDMemberCartFormError error(String message, MemberCartModel newValue) => DocumentIDMemberCartFormError(message: message, value: newValue);

  Future<MemberCartFormState> _isDocumentIDValid(String value, MemberCartModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<MemberCartModel> findDocument = _memberCartRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableMemberCartForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

