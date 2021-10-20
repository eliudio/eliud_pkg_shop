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
  StreamSubscription? _productDisplaySubscription;

  Stream<ProductDisplayComponentState> _mapLoadProductDisplayComponentUpdateToState(String documentId) async* {
    _productDisplaySubscription?.cancel();
    _productDisplaySubscription = productDisplayRepository!.listenTo(documentId, (value) {
      if (value != null) add(ProductDisplayComponentUpdated(value: value));
    });
  }

  ProductDisplayComponentBloc({ this.productDisplayRepository }): super(ProductDisplayComponentUninitialized());

  @override
  Stream<ProductDisplayComponentState> mapEventToState(ProductDisplayComponentEvent event) async* {
    final currentState = state;
    if (event is FetchProductDisplayComponent) {
      yield* _mapLoadProductDisplayComponentUpdateToState(event.id!);
    } else if (event is ProductDisplayComponentUpdated) {
      yield ProductDisplayComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _productDisplaySubscription?.cancel();
    return super.close();
  }

}

