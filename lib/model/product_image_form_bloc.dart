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

import 'package:eliud_pkg_shop/model/product_image_form_event.dart';
import 'package:eliud_pkg_shop/model/product_image_form_state.dart';
import 'package:eliud_pkg_shop/model/product_image_repository.dart';

class ProductImageFormBloc extends Bloc<ProductImageFormEvent, ProductImageFormState> {
  final String appId;

  ProductImageFormBloc(this.appId, ): super(ProductImageFormUninitialized());
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
          newValue = currentState.value.copyWith(image: await memberMediumRepository(appId: appId).get(event.value));
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

