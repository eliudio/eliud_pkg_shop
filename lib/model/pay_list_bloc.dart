/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/pay_repository.dart';
import 'package:eliud_pkg_shop/model/pay_list_event.dart';
import 'package:eliud_pkg_shop/model/pay_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class PayListBloc extends Bloc<PayListEvent, PayListState> {
  final PayRepository _payRepository;
  StreamSubscription? _paysListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int payLimit;

  PayListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PayRepository payRepository, this.payLimit = 5})
      : assert(payRepository != null),
        _payRepository = payRepository,
        super(PayListLoading());

  Stream<PayListState> _mapLoadPayListToState() async* {
    int amountNow =  (state is PayListLoaded) ? (state as PayListLoaded).values!.length : 0;
    _paysListSubscription?.cancel();
    _paysListSubscription = _payRepository.listen(
          (list) => add(PayListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * payLimit : null
    );
  }

  Stream<PayListState> _mapLoadPayListWithDetailsToState() async* {
    int amountNow =  (state is PayListLoaded) ? (state as PayListLoaded).values!.length : 0;
    _paysListSubscription?.cancel();
    _paysListSubscription = _payRepository.listenWithDetails(
            (list) => add(PayListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * payLimit : null
    );
  }

  Stream<PayListState> _mapAddPayListToState(AddPayList event) async* {
    var value = event.value;
    if (value != null) 
      _payRepository.add(value);
  }

  Stream<PayListState> _mapUpdatePayListToState(UpdatePayList event) async* {
    var value = event.value;
    if (value != null) 
      _payRepository.update(value);
  }

  Stream<PayListState> _mapDeletePayListToState(DeletePayList event) async* {
    var value = event.value;
    if (value != null) 
      _payRepository.delete(value);
  }

  Stream<PayListState> _mapPayListUpdatedToState(
      PayListUpdated event) async* {
    yield PayListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PayListState> mapEventToState(PayListEvent event) async* {
    if (event is LoadPayList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPayListToState();
      } else {
        yield* _mapLoadPayListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadPayListWithDetailsToState();
    } else if (event is PayChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPayListToState();
      } else {
        yield* _mapLoadPayListWithDetailsToState();
      }
    } else if (event is AddPayList) {
      yield* _mapAddPayListToState(event);
    } else if (event is UpdatePayList) {
      yield* _mapUpdatePayListToState(event);
    } else if (event is DeletePayList) {
      yield* _mapDeletePayListToState(event);
    } else if (event is PayListUpdated) {
      yield* _mapPayListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _paysListSubscription?.cancel();
    return super.close();
  }
}


