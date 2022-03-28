/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_list_event.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class PayConfirmationListBloc extends Bloc<PayConfirmationListEvent, PayConfirmationListState> {
  final PayConfirmationRepository _payConfirmationRepository;
  StreamSubscription? _payConfirmationsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int payConfirmationLimit;

  PayConfirmationListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PayConfirmationRepository payConfirmationRepository, this.payConfirmationLimit = 5})
      : assert(payConfirmationRepository != null),
        _payConfirmationRepository = payConfirmationRepository,
        super(PayConfirmationListLoading());

  Stream<PayConfirmationListState> _mapLoadPayConfirmationListToState() async* {
    int amountNow =  (state is PayConfirmationListLoaded) ? (state as PayConfirmationListLoaded).values!.length : 0;
    _payConfirmationsListSubscription?.cancel();
    _payConfirmationsListSubscription = _payConfirmationRepository.listen(
          (list) => add(PayConfirmationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * payConfirmationLimit : null
    );
  }

  Stream<PayConfirmationListState> _mapLoadPayConfirmationListWithDetailsToState() async* {
    int amountNow =  (state is PayConfirmationListLoaded) ? (state as PayConfirmationListLoaded).values!.length : 0;
    _payConfirmationsListSubscription?.cancel();
    _payConfirmationsListSubscription = _payConfirmationRepository.listenWithDetails(
            (list) => add(PayConfirmationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * payConfirmationLimit : null
    );
  }

  Stream<PayConfirmationListState> _mapAddPayConfirmationListToState(AddPayConfirmationList event) async* {
    var value = event.value;
    if (value != null) 
      _payConfirmationRepository.add(value);
  }

  Stream<PayConfirmationListState> _mapUpdatePayConfirmationListToState(UpdatePayConfirmationList event) async* {
    var value = event.value;
    if (value != null) 
      _payConfirmationRepository.update(value);
  }

  Stream<PayConfirmationListState> _mapDeletePayConfirmationListToState(DeletePayConfirmationList event) async* {
    var value = event.value;
    if (value != null) 
      _payConfirmationRepository.delete(value);
  }

  Stream<PayConfirmationListState> _mapPayConfirmationListUpdatedToState(
      PayConfirmationListUpdated event) async* {
    yield PayConfirmationListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PayConfirmationListState> mapEventToState(PayConfirmationListEvent event) async* {
    if (event is LoadPayConfirmationList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPayConfirmationListToState();
      } else {
        yield* _mapLoadPayConfirmationListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadPayConfirmationListWithDetailsToState();
    } else if (event is PayConfirmationChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPayConfirmationListToState();
      } else {
        yield* _mapLoadPayConfirmationListWithDetailsToState();
      }
    } else if (event is AddPayConfirmationList) {
      yield* _mapAddPayConfirmationListToState(event);
    } else if (event is UpdatePayConfirmationList) {
      yield* _mapUpdatePayConfirmationListToState(event);
    } else if (event is DeletePayConfirmationList) {
      yield* _mapDeletePayConfirmationListToState(event);
    } else if (event is PayConfirmationListUpdated) {
      yield* _mapPayConfirmationListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _payConfirmationsListSubscription?.cancel();
    return super.close();
  }
}


