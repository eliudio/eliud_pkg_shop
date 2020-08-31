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

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({ this.productRepository }): super(ProductUninitialized());
  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    final currentState = state;
    if (event is FetchProduct) {
      try {
        if (currentState is ProductUninitialized) {
          final ProductModel model = await _fetchProduct(event.id);

          if (model != null) {
            yield ProductLoaded(value: model);
          } else {
            String id = event.id;
            yield ProductError(message: "Product with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield ProductError(message: "Unknown error whilst retrieving Product");
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


