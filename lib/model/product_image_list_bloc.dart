/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/product_image_repository.dart';
import 'package:eliud_pkg_shop/model/product_image_list_event.dart';
import 'package:eliud_pkg_shop/model/product_image_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class ProductImageListBloc extends Bloc<ProductImageListEvent, ProductImageListState> {
  final ProductImageRepository _productImageRepository;
  StreamSubscription _productImagesListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  ProductImageListBloc(this.accessBloc,{ this.eliudQuery, @required ProductImageRepository productImageRepository })
      : assert(productImageRepository != null),
      _productImageRepository = productImageRepository,
      super(ProductImageListLoading());

  Stream<ProductImageListState> _mapLoadProductImageListToState({ String orderBy, bool descending }) async* {
    _productImagesListSubscription?.cancel();
    _productImagesListSubscription = _productImageRepository.listen((list) => add(ProductImageListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<ProductImageListState> _mapLoadProductImageListWithDetailsToState({ String orderBy, bool descending }) async* {
    _productImagesListSubscription?.cancel();
    _productImagesListSubscription = _productImageRepository.listenWithDetails((list) => add(ProductImageListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<ProductImageListState> _mapAddProductImageListToState(AddProductImageList event) async* {
    _productImageRepository.add(event.value);
  }

  Stream<ProductImageListState> _mapUpdateProductImageListToState(UpdateProductImageList event) async* {
    _productImageRepository.update(event.value);
  }

  Stream<ProductImageListState> _mapDeleteProductImageListToState(DeleteProductImageList event) async* {
    _productImageRepository.delete(event.value);
  }

  Stream<ProductImageListState> _mapProductImageListUpdatedToState(ProductImageListUpdated event) async* {
    yield ProductImageListLoaded(values: event.value);
  }


  @override
  Stream<ProductImageListState> mapEventToState(ProductImageListEvent event) async* {
    final currentState = state;
    if (event is LoadProductImageList) {
      yield* _mapLoadProductImageListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadProductImageListWithDetails) {
      yield* _mapLoadProductImageListWithDetailsToState();
    } else if (event is AddProductImageList) {
      yield* _mapAddProductImageListToState(event);
    } else if (event is UpdateProductImageList) {
      yield* _mapUpdateProductImageListToState(event);
    } else if (event is DeleteProductImageList) {
      yield* _mapDeleteProductImageListToState(event);
    } else if (event is ProductImageListUpdated) {
      yield* _mapProductImageListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _productImagesListSubscription?.cancel();
    return super.close();
  }

}


