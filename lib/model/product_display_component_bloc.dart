/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_display_component_event.dart';
import 'package:eliud_pkg_shop/model/product_display_component_state.dart';
import 'package:eliud_pkg_shop/model/product_display_repository.dart';
import 'package:flutter/services.dart';


class ProductDisplayComponentBloc extends Bloc<ProductDisplayComponentEvent, ProductDisplayComponentState> {
  final ProductDisplayRepository? productDisplayRepository;

  ProductDisplayComponentBloc({ this.productDisplayRepository }): super(ProductDisplayComponentUninitialized());
  @override
  Stream<ProductDisplayComponentState> mapEventToState(ProductDisplayComponentEvent event) async* {
    final currentState = state;
    if (event is FetchProductDisplayComponent) {
      try {
        if (currentState is ProductDisplayComponentUninitialized) {
          bool permissionDenied = false;
          final model = await productDisplayRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield ProductDisplayComponentPermissionDenied();
          } else {
            if (model != null) {
              yield ProductDisplayComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield ProductDisplayComponentError(
                  message: "ProductDisplay with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield ProductDisplayComponentError(message: "Unknown error whilst retrieving ProductDisplay");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

