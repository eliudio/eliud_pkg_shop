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
        super(ProductImageListLoading()) {
    on <LoadProductImageList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadProductImageListToState();
      } else {
        _mapLoadProductImageListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadProductImageListWithDetailsToState();
    });
    
    on <ProductImageChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadProductImageListToState();
      } else {
        _mapLoadProductImageListWithDetailsToState();
      }
    });
      
    on <AddProductImageList> ((event, emit) async {
      await _mapAddProductImageListToState(event);
    });
    
    on <UpdateProductImageList> ((event, emit) async {
      await _mapUpdateProductImageListToState(event);
    });
    
    on <DeleteProductImageList> ((event, emit) async {
      await _mapDeleteProductImageListToState(event);
    });
    
    on <ProductImageListUpdated> ((event, emit) {
      emit(_mapProductImageListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadProductImageListToState() async {
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

  Future<void> _mapLoadProductImageListWithDetailsToState() async {
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

  Future<void> _mapAddProductImageListToState(AddProductImageList event) async {
    var value = event.value;
    if (value != null) {
      await _productImageRepository.add(value);
    }
  }

  Future<void> _mapUpdateProductImageListToState(UpdateProductImageList event) async {
    var value = event.value;
    if (value != null) {
      await _productImageRepository.update(value);
    }
  }

  Future<void> _mapDeleteProductImageListToState(DeleteProductImageList event) async {
    var value = event.value;
    if (value != null) {
      await _productImageRepository.delete(value);
    }
  }

  ProductImageListLoaded _mapProductImageListUpdatedToState(
      ProductImageListUpdated event) => ProductImageListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _productImagesListSubscription?.cancel();
    return super.close();
  }
}


