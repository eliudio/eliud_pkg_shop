/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/product_repository.dart';
import 'package:eliud_pkg_shop/model/product_list_event.dart';
import 'package:eliud_pkg_shop/model/product_list_state.dart';


class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository _productRepository;
  StreamSubscription _productsListSubscription;

  ProductListBloc({ @required ProductRepository productRepository })
      : assert(productRepository != null),
      _productRepository = productRepository,
      super(ProductListLoading());

  Stream<ProductListState> _mapLoadProductListToState({ String orderBy, bool descending }) async* {
    _productsListSubscription?.cancel();
    _productsListSubscription = _productRepository.listen( (list) => add(ProductListUpdated(value: list)), orderBy: orderBy, descending: descending);
  }

  Stream<ProductListState> _mapLoadProductListWithDetailsToState() async* {
    _productsListSubscription?.cancel();
    _productsListSubscription = _productRepository.listenWithDetails( (list) => add(ProductListUpdated(value: list)));
  }

  Stream<ProductListState> _mapAddProductListToState(AddProductList event) async* {
    _productRepository.add(event.value);
  }

  Stream<ProductListState> _mapUpdateProductListToState(UpdateProductList event) async* {
    _productRepository.update(event.value);
  }

  Stream<ProductListState> _mapDeleteProductListToState(DeleteProductList event) async* {
    _productRepository.delete(event.value);
  }

  Stream<ProductListState> _mapProductListUpdatedToState(ProductListUpdated event) async* {
    yield ProductListLoaded(values: event.value);
  }


  @override
  Stream<ProductListState> mapEventToState(ProductListEvent event) async* {
    final currentState = state;
    if (event is LoadProductList) {
      yield* _mapLoadProductListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadProductListWithDetails) {
      yield* _mapLoadProductListWithDetailsToState();
    } else if (event is AddProductList) {
      yield* _mapAddProductListToState(event);
    } else if (event is UpdateProductList) {
      yield* _mapUpdateProductListToState(event);
    } else if (event is DeleteProductList) {
      yield* _mapDeleteProductListToState(event);
    } else if (event is ProductListUpdated) {
      yield* _mapProductListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _productsListSubscription?.cancel();
    return super.close();
  }

}


