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
import 'package:eliud_core/tools/query/query_tools.dart';



class ProductImageListBloc extends Bloc<ProductImageListEvent, ProductImageListState> {
  final ProductImageRepository _productImageRepository;
  StreamSubscription? _productImagesListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int productImageLimit;

  ProductImageListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required ProductImageRepository productImageRepository, this.productImageLimit = 5})
      : assert(productImageRepository != null),
        _productImageRepository = productImageRepository,
        super(ProductImageListLoading());

  Stream<ProductImageListState> _mapLoadProductImageListToState() async* {
    int amountNow =  (state is ProductImageListLoaded) ? (state as ProductImageListLoaded).values!.length : 0;
    _productImagesListSubscription?.cancel();
    _productImagesListSubscription = _productImageRepository.listen(
          (list) => add(ProductImageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * productImageLimit : null
    );
  }

  Stream<ProductImageListState> _mapLoadProductImageListWithDetailsToState() async* {
    int amountNow =  (state is ProductImageListLoaded) ? (state as ProductImageListLoaded).values!.length : 0;
    _productImagesListSubscription?.cancel();
    _productImagesListSubscription = _productImageRepository.listenWithDetails(
            (list) => add(ProductImageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * productImageLimit : null
    );
  }

  Stream<ProductImageListState> _mapAddProductImageListToState(AddProductImageList event) async* {
    var value = event.value;
    if (value != null) 
      _productImageRepository.add(value);
  }

  Stream<ProductImageListState> _mapUpdateProductImageListToState(UpdateProductImageList event) async* {
    var value = event.value;
    if (value != null) 
      _productImageRepository.update(value);
  }

  Stream<ProductImageListState> _mapDeleteProductImageListToState(DeleteProductImageList event) async* {
    var value = event.value;
    if (value != null) 
      _productImageRepository.delete(value);
  }

  Stream<ProductImageListState> _mapProductImageListUpdatedToState(
      ProductImageListUpdated event) async* {
    yield ProductImageListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<ProductImageListState> mapEventToState(ProductImageListEvent event) async* {
    if (event is LoadProductImageList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadProductImageListToState();
      } else {
        yield* _mapLoadProductImageListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadProductImageListWithDetailsToState();
    } else if (event is ProductImageChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadProductImageListToState();
      } else {
        yield* _mapLoadProductImageListWithDetailsToState();
      }
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


