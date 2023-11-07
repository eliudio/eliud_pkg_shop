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

import 'package:eliud_pkg_shop/model/product_display_component_event.dart';
import 'package:eliud_pkg_shop/model/product_display_component_state.dart';
import 'package:eliud_pkg_shop/model/product_display_repository.dart';

class ProductDisplayComponentBloc
    extends Bloc<ProductDisplayComponentEvent, ProductDisplayComponentState> {
  final ProductDisplayRepository? productDisplayRepository;
  StreamSubscription? _productDisplaySubscription;

  void _mapLoadProductDisplayComponentUpdateToState(String documentId) {
    _productDisplaySubscription?.cancel();
    _productDisplaySubscription =
        productDisplayRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(ProductDisplayComponentUpdated(value: value));
      }
    });
  }

  ProductDisplayComponentBloc({this.productDisplayRepository})
      : super(ProductDisplayComponentUninitialized()) {
    on<FetchProductDisplayComponent>((event, emit) {
      _mapLoadProductDisplayComponentUpdateToState(event.id!);
    });
    on<ProductDisplayComponentUpdated>((event, emit) {
      emit(ProductDisplayComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _productDisplaySubscription?.cancel();
    return super.close();
  }
}
