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

class ProductComponentBloc extends Bloc<ProductComponentEvent, ProductComponentState> {
  final ProductRepository productRepository;

  ProductComponentBloc({ this.productRepository }): super(ProductComponentUninitialized());
  @override
  Stream<ProductComponentState> mapEventToState(ProductComponentEvent event) async* {
    final currentState = state;
    if (event is FetchProductComponent) {
      try {
        if (currentState is ProductComponentUninitialized) {
          final ProductModel model = await _fetchProduct(event.id);

          if (model != null) {
            yield ProductComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield ProductComponentError(message: "Product with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield ProductComponentError(message: "Unknown error whilst retrieving Product");
      }
    }
  }

  Future<ProductModel> _fetchProduct(String id) async {
    return productRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


