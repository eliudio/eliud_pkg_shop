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
        super(ProductListLoading());

  Stream<ProductListState> _mapLoadProductListToState() async* {
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

  Stream<ProductListState> _mapLoadProductListWithDetailsToState() async* {
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

  Stream<ProductListState> _mapAddProductListToState(AddProductList event) async* {
    var value = event.value;
    if (value != null) 
      _productRepository.add(value);
  }

  Stream<ProductListState> _mapUpdateProductListToState(UpdateProductList event) async* {
    var value = event.value;
    if (value != null) 
      _productRepository.update(value);
  }

  Stream<ProductListState> _mapDeleteProductListToState(DeleteProductList event) async* {
    var value = event.value;
    if (value != null) 
      _productRepository.delete(value);
  }

  Stream<ProductListState> _mapProductListUpdatedToState(
      ProductListUpdated event) async* {
    yield ProductListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<ProductListState> mapEventToState(ProductListEvent event) async* {
    if (event is LoadProductList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadProductListToState();
      } else {
        yield* _mapLoadProductListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadProductListWithDetailsToState();
    } else if (event is ProductChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadProductListToState();
      } else {
        yield* _mapLoadProductListWithDetailsToState();
      }
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


