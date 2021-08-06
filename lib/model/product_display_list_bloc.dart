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
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int productDisplayLimit;

  ProductDisplayListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required ProductDisplayRepository productDisplayRepository, this.productDisplayLimit = 5})
      : assert(productDisplayRepository != null),
        _productDisplayRepository = productDisplayRepository,
        super(ProductDisplayListLoading());

  Stream<ProductDisplayListState> _mapLoadProductDisplayListToState() async* {
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

  Stream<ProductDisplayListState> _mapLoadProductDisplayListWithDetailsToState() async* {
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

  Stream<ProductDisplayListState> _mapAddProductDisplayListToState(AddProductDisplayList event) async* {
    var value = event.value;
    if (value != null) 
      _productDisplayRepository.add(value);
  }

  Stream<ProductDisplayListState> _mapUpdateProductDisplayListToState(UpdateProductDisplayList event) async* {
    var value = event.value;
    if (value != null) 
      _productDisplayRepository.update(value);
  }

  Stream<ProductDisplayListState> _mapDeleteProductDisplayListToState(DeleteProductDisplayList event) async* {
    var value = event.value;
    if (value != null) 
      _productDisplayRepository.delete(value);
  }

  Stream<ProductDisplayListState> _mapProductDisplayListUpdatedToState(
      ProductDisplayListUpdated event) async* {
    yield ProductDisplayListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<ProductDisplayListState> mapEventToState(ProductDisplayListEvent event) async* {
    if (event is LoadProductDisplayList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadProductDisplayListToState();
      } else {
        yield* _mapLoadProductDisplayListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


