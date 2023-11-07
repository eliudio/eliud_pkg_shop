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

import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';

import 'package:eliud_pkg_shop/model/product_image_form_event.dart';
import 'package:eliud_pkg_shop/model/product_image_form_state.dart';

class ProductImageFormBloc
    extends Bloc<ProductImageFormEvent, ProductImageFormState> {
  final String? appId;

  ProductImageFormBloc(
    this.appId,
  ) : super(ProductImageFormUninitialized()) {
    on<InitialiseNewProductImageFormEvent>((event, emit) {
      ProductImageFormLoaded loaded = ProductImageFormLoaded(
          value: ProductImageModel(
        documentID: "IDENTIFIER",
      ));
      emit(loaded);
    });

    on<InitialiseProductImageFormEvent>((event, emit) async {
      ProductImageFormLoaded loaded =
          ProductImageFormLoaded(value: event.value);
      emit(loaded);
    });
    on<InitialiseProductImageFormNoLoadEvent>((event, emit) async {
      ProductImageFormLoaded loaded =
          ProductImageFormLoaded(value: event.value);
      emit(loaded);
    });
    ProductImageModel? newValue;
    on<ChangedProductImageImage>((event, emit) async {
      if (state is ProductImageFormInitialized) {
        final currentState = state as ProductImageFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              image: await platformMediumRepository(appId: appId)!
                  .get(event.value));
        }
        emit(SubmittableProductImageForm(value: newValue));
      }
    });
  }
}
