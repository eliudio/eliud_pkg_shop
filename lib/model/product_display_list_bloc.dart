/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/product_display_repository.dart';
import 'package:eliud_pkg_shop/model/product_display_list_event.dart';
import 'package:eliud_pkg_shop/model/product_display_list_state.dart';


class ProductDisplayListBloc extends Bloc<ProductDisplayListEvent, ProductDisplayListState> {
  final ProductDisplayRepository _productDisplayRepository;
  StreamSubscription _productDisplaysListSubscription;

  ProductDisplayListBloc({ @required ProductDisplayRepository productDisplayRepository })
      : assert(productDisplayRepository != null),
      _productDisplayRepository = productDisplayRepository,
      super(ProductDisplayListLoading());

  Stream<ProductDisplayListState> _mapLoadProductDisplayListToState({ String orderBy, bool descending }) async* {
    _productDisplaysListSubscription?.cancel();
    _productDisplaysListSubscription = _productDisplayRepository.listen( (list) => add(ProductDisplayListUpdated(value: list)), orderBy: orderBy, descending: descending);
  }

  Stream<ProductDisplayListState> _mapLoadProductDisplayListWithDetailsToState() async* {
    _productDisplaysListSubscription?.cancel();
    _productDisplaysListSubscription = _productDisplayRepository.listenWithDetails( (list) => add(ProductDisplayListUpdated(value: list)));
  }

  Stream<ProductDisplayListState> _mapAddProductDisplayListToState(AddProductDisplayList event) async* {
    _productDisplayRepository.add(event.value);
  }

  Stream<ProductDisplayListState> _mapUpdateProductDisplayListToState(UpdateProductDisplayList event) async* {
    _productDisplayRepository.update(event.value);
  }

  Stream<ProductDisplayListState> _mapDeleteProductDisplayListToState(DeleteProductDisplayList event) async* {
    _productDisplayRepository.delete(event.value);
  }

  Stream<ProductDisplayListState> _mapProductDisplayListUpdatedToState(ProductDisplayListUpdated event) async* {
    yield ProductDisplayListLoaded(values: event.value);
  }


  @override
  Stream<ProductDisplayListState> mapEventToState(ProductDisplayListEvent event) async* {
    final currentState = state;
    if (event is LoadProductDisplayList) {
      yield* _mapLoadProductDisplayListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadProductDisplayListWithDetails) {
      yield* _mapLoadProductDisplayListWithDetailsToState();
    } else if (event is AddProductDisplayList) {
      yield* _mapAddProductDisplayListToState(event);
    } else if (event is UpdateProductDisplayList) {
      yield* _mapUpdateProductDisplayListToState(event);
    } else if (event is DeleteProductDisplayList) {
      yield* _mapDeleteProductDisplayListToState(event);
    } else if (event is ProductDisplayListUpdated) {
      yield* _mapProductDisplayListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _productDisplaysListSubscription?.cancel();
    return super.close();
  }

}


