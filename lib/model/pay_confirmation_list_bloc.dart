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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class PayConfirmationListBloc extends Bloc<PayConfirmationListEvent, PayConfirmationListState> {
  final PayConfirmationRepository _payConfirmationRepository;
  StreamSubscription _payConfirmationsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  PayConfirmationListBloc(this.accessBloc,{ this.eliudQuery, @required PayConfirmationRepository payConfirmationRepository })
      : assert(payConfirmationRepository != null),
      _payConfirmationRepository = payConfirmationRepository,
      super(PayConfirmationListLoading());

  Stream<PayConfirmationListState> _mapLoadPayConfirmationListToState({ String orderBy, bool descending }) async* {
    _payConfirmationsListSubscription?.cancel();
    _payConfirmationsListSubscription = _payConfirmationRepository.listen((list) => add(PayConfirmationListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<PayConfirmationListState> _mapLoadPayConfirmationListWithDetailsToState({ String orderBy, bool descending }) async* {
    _payConfirmationsListSubscription?.cancel();
    _payConfirmationsListSubscription = _payConfirmationRepository.listenWithDetails((list) => add(PayConfirmationListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<PayConfirmationListState> _mapAddPayConfirmationListToState(AddPayConfirmationList event) async* {
    _payConfirmationRepository.add(event.value);
  }

  Stream<PayConfirmationListState> _mapUpdatePayConfirmationListToState(UpdatePayConfirmationList event) async* {
    _payConfirmationRepository.update(event.value);
  }

  Stream<PayConfirmationListState> _mapDeletePayConfirmationListToState(DeletePayConfirmationList event) async* {
    _payConfirmationRepository.delete(event.value);
  }

  Stream<PayConfirmationListState> _mapPayConfirmationListUpdatedToState(PayConfirmationListUpdated event) async* {
    yield PayConfirmationListLoaded(values: event.value);
  }


  @override
  Stream<PayConfirmationListState> mapEventToState(PayConfirmationListEvent event) async* {
    final currentState = state;
    if (event is LoadPayConfirmationList) {
      yield* _mapLoadPayConfirmationListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadPayConfirmationListWithDetails) {
      yield* _mapLoadPayConfirmationListWithDetailsToState();
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


