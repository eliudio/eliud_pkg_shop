/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/product_component_event.dart';
import 'package:eliud_pkg_shop/model/product_component_state.dart';
import 'package:eliud_pkg_shop/model/product_repository.dart';
import 'package:flutter/services.dart';


class ProductComponentBloc extends Bloc<ProductComponentEvent, ProductComponentState> {
  final ProductRepository? productRepository;
  StreamSubscription? _productSubscription;

  Stream<ProductComponentState> _mapLoadProductComponentUpdateToState(String documentId) async* {
    _productSubscription?.cancel();
    _productSubscription = productRepository!.listenTo(documentId, (value) {
      if (value != null) add(ProductComponentUpdated(value: value!));
    });
  }

  ProductComponentBloc({ this.productRepository }): super(ProductComponentUninitialized());

  @override
  Stream<ProductComponentState> mapEventToState(ProductComponentEvent event) async* {
    final currentState = state;
    if (event is FetchProductComponent) {
      yield* _mapLoadProductComponentUpdateToState(event.id!);
    } else if (event is ProductComponentUpdated) {
      yield ProductComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _productSubscription?.cancel();
    return super.close();
  }

}

