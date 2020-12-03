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

class ProductDisplayComponentBloc extends Bloc<ProductDisplayComponentEvent, ProductDisplayComponentState> {
  final ProductDisplayRepository productDisplayRepository;

  ProductDisplayComponentBloc({ this.productDisplayRepository }): super(ProductDisplayComponentUninitialized());
  @override
  Stream<ProductDisplayComponentState> mapEventToState(ProductDisplayComponentEvent event) async* {
    final currentState = state;
    if (event is FetchProductDisplayComponent) {
      try {
        if (currentState is ProductDisplayComponentUninitialized) {
          final ProductDisplayModel model = await _fetchProductDisplay(event.id);

          if (model != null) {
            yield ProductDisplayComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield ProductDisplayComponentError(message: "ProductDisplay with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield ProductDisplayComponentError(message: "Unknown error whilst retrieving ProductDisplay");
      }
    }
  }

  Future<ProductDisplayModel> _fetchProductDisplay(String id) async {
    return productDisplayRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


