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
import 'package:eliud_core/tools/query/query_tools.dart';



class ProductDisplayListBloc extends Bloc<ProductDisplayListEvent, ProductDisplayListState> {
  final ProductDisplayRepository _productDisplayRepository;
  StreamSubscription? _productDisplaysListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int productDisplayLimit;

  ProductDisplayListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required ProductDisplayRepository productDisplayRepository, this.productDisplayLimit = 5})
      : assert(productDisplayRepository != null),
        _productDisplayRepository = productDisplayRepository,
        super(ProductDisplayListLoading()) {
    on <LoadProductDisplayList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadProductDisplayListToState();
      } else {
        _mapLoadProductDisplayListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadProductDisplayListWithDetailsToState();
    });
    
    on <ProductDisplayChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadProductDisplayListToState();
      } else {
        _mapLoadProductDisplayListWithDetailsToState();
      }
    });
      
    on <AddProductDisplayList> ((event, emit) async {
      await _mapAddProductDisplayListToState(event);
    });
    
    on <UpdateProductDisplayList> ((event, emit) async {
      await _mapUpdateProductDisplayListToState(event);
    });
    
    on <DeleteProductDisplayList> ((event, emit) async {
      await _mapDeleteProductDisplayListToState(event);
    });
    
    on <ProductDisplayListUpdated> ((event, emit) {
      emit(_mapProductDisplayListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadProductDisplayListToState() async {
    int amountNow =  (state is ProductDisplayListLoaded) ? (state as ProductDisplayListLoaded).values!.length : 0;
    _productDisplaysListSubscription?.cancel();
    _productDisplaysListSubscription = _productDisplayRepository.listen(
          (list) => add(ProductDisplayListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * productDisplayLimit : null
    );
  }

  Future<void> _mapLoadProductDisplayListWithDetailsToState() async {
    int amountNow =  (state is ProductDisplayListLoaded) ? (state as ProductDisplayListLoaded).values!.length : 0;
    _productDisplaysListSubscription?.cancel();
    _productDisplaysListSubscription = _productDisplayRepository.listenWithDetails(
            (list) => add(ProductDisplayListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * productDisplayLimit : null
    );
  }

  Future<void> _mapAddProductDisplayListToState(AddProductDisplayList event) async {
    var value = event.value;
    if (value != null) {
      await _productDisplayRepository.add(value);
    }
  }

  Future<void> _mapUpdateProductDisplayListToState(UpdateProductDisplayList event) async {
    var value = event.value;
    if (value != null) {
      await _productDisplayRepository.update(value);
    }
  }

  Future<void> _mapDeleteProductDisplayListToState(DeleteProductDisplayList event) async {
    var value = event.value;
    if (value != null) {
      await _productDisplayRepository.delete(value);
    }
  }

  ProductDisplayListLoaded _mapProductDisplayListUpdatedToState(
      ProductDisplayListUpdated event) => ProductDisplayListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _productDisplaysListSubscription?.cancel();
    return super.close();
  }
}


