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

import 'package:eliud_pkg_shop/model/pay_repository.dart';
import 'package:eliud_pkg_shop/model/pay_list_event.dart';
import 'package:eliud_pkg_shop/model/pay_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'pay_model.dart';

typedef List<PayModel?> FilterPayModels(List<PayModel?> values);



class PayListBloc extends Bloc<PayListEvent, PayListState> {
  final FilterPayModels? filter;
  final PayRepository _payRepository;
  StreamSubscription? _paysListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int payLimit;

  PayListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PayRepository payRepository, this.payLimit = 5})
      : _payRepository = payRepository,
        super(PayListLoading()) {
    on <LoadPayList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPayListToState();
      } else {
        _mapLoadPayListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPayListWithDetailsToState();
    });
    
    on <PayChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPayListToState();
      } else {
        _mapLoadPayListWithDetailsToState();
      }
    });
      
    on <AddPayList> ((event, emit) async {
      await _mapAddPayListToState(event);
    });
    
    on <UpdatePayList> ((event, emit) async {
      await _mapUpdatePayListToState(event);
    });
    
    on <DeletePayList> ((event, emit) async {
      await _mapDeletePayListToState(event);
    });
    
    on <PayListUpdated> ((event, emit) {
      emit(_mapPayListUpdatedToState(event));
    });
  }

  List<PayModel?> _filter(List<PayModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadPayListToState() async {
    int amountNow =  (state is PayListLoaded) ? (state as PayListLoaded).values!.length : 0;
    _paysListSubscription?.cancel();
    _paysListSubscription = _payRepository.listen(
          (list) => add(PayListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * payLimit : null
    );
  }

  Future<void> _mapLoadPayListWithDetailsToState() async {
    int amountNow =  (state is PayListLoaded) ? (state as PayListLoaded).values!.length : 0;
    _paysListSubscription?.cancel();
    _paysListSubscription = _payRepository.listenWithDetails(
            (list) => add(PayListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * payLimit : null
    );
  }

  Future<void> _mapAddPayListToState(AddPayList event) async {
    var value = event.value;
    if (value != null) {
      await _payRepository.add(value);
    }
  }

  Future<void> _mapUpdatePayListToState(UpdatePayList event) async {
    var value = event.value;
    if (value != null) {
      await _payRepository.update(value);
    }
  }

  Future<void> _mapDeletePayListToState(DeletePayList event) async {
    var value = event.value;
    if (value != null) {
      await _payRepository.delete(value);
    }
  }

  PayListLoaded _mapPayListUpdatedToState(
      PayListUpdated event) => PayListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _paysListSubscription?.cancel();
    return super.close();
  }
}


