/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_form_bloc.dart
                       
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


import 'product_image_model.dart';
import 'product_image_form_event.dart';
import 'product_image_form_state.dart';

class ProductImageFormBloc extends Bloc<ProductImageFormEvent, ProductImageFormState> {
  final ImageRepository _imageRepository = imageRepository();

  ProductImageFormBloc(): super(ProductImageFormUninitialized());
  @override
  Stream<ProductImageFormState> mapEventToState(ProductImageFormEvent event) async* {
    final currentState = state;
    if (currentState is ProductImageFormUninitialized) {
      if (event is InitialiseNewProductImageFormEvent) {
        ProductImageFormLoaded loaded = ProductImageFormLoaded(value: ProductImageModel(
                                               documentID: "IDENTIFIER", 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseProductImageFormEvent) {
        ProductImageFormLoaded loaded = ProductImageFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseProductImageFormNoLoadEvent) {
        ProductImageFormLoaded loaded = ProductImageFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is ProductImageFormInitialized) {
      ProductImageModel newValue = null;
      if (event is ChangedProductImageImage) {
        if (event.value != null)
          newValue = currentState.value.copyWith(image: await _imageRepository.get(event.value));
        else
          newValue = new ProductImageModel(
                                 documentID: currentState.value.documentID,
                                 image: null,
          );
        yield SubmittableProductImageForm(value: newValue);

        return;
      }
    }
  }


}

