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
import 'package:eliud_core/tools/query/query_tools.dart';



class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int productLimit;

  ProductListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required ProductRepository productRepository, this.productLimit = 5})
      : assert(productRepository != null),
        _productRepository = productRepository,
        super(ProductListLoading()) {
    on <LoadProductList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadProductListToState();
      } else {
        _mapLoadProductListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadProductListWithDetailsToState();
    });
    
    on <ProductChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadProductListToState();
      } else {
        _mapLoadProductListWithDetailsToState();
      }
    });
      
    on <AddProductList> ((event, emit) async {
      await _mapAddProductListToState(event);
    });
    
    on <UpdateProductList> ((event, emit) async {
      await _mapUpdateProductListToState(event);
    });
    
    on <DeleteProductList> ((event, emit) async {
      await _mapDeleteProductListToState(event);
    });
    
    on <ProductListUpdated> ((event, emit) {
      emit(_mapProductListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadProductListToState() async {
    int amountNow =  (state is ProductListLoaded) ? (state as ProductListLoaded).values!.length : 0;
    _productsListSubscription?.cancel();
    _productsListSubscription = _productRepository.listen(
          (list) => add(ProductListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * productLimit : null
    );
  }

  Future<void> _mapLoadProductListWithDetailsToState() async {
    int amountNow =  (state is ProductListLoaded) ? (state as ProductListLoaded).values!.length : 0;
    _productsListSubscription?.cancel();
    _productsListSubscription = _productRepository.listenWithDetails(
            (list) => add(ProductListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * productLimit : null
    );
  }

  Future<void> _mapAddProductListToState(AddProductList event) async {
    var value = event.value;
    if (value != null) {
      await _productRepository.add(value);
    }
  }

  Future<void> _mapUpdateProductListToState(UpdateProductList event) async {
    var value = event.value;
    if (value != null) {
      await _productRepository.update(value);
    }
  }

  Future<void> _mapDeleteProductListToState(DeleteProductList event) async {
    var value = event.value;
    if (value != null) {
      await _productRepository.delete(value);
    }
  }

  ProductListLoaded _mapProductListUpdatedToState(
      ProductListUpdated event) => ProductListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _productsListSubscription?.cancel();
    return super.close();
  }
}


