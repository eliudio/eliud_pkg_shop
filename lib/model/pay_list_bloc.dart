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


class PayListBloc extends Bloc<PayListEvent, PayListState> {
  final PayRepository _payRepository;
  StreamSubscription _paysListSubscription;

  PayListBloc({ @required PayRepository payRepository })
      : assert(payRepository != null),
      _payRepository = payRepository,
      super(PayListLoading());

  Stream<PayListState> _mapLoadPayListToState() async* {
    _paysListSubscription?.cancel();
    _paysListSubscription = _payRepository.listen((list) => add(PayListUpdated(value: list)));
  }

  Stream<PayListState> _mapLoadPayListWithDetailsToState() async* {
    _paysListSubscription?.cancel();
    _paysListSubscription = _payRepository.listenWithDetails((list) => add(PayListUpdated(value: list)));
  }

  Stream<PayListState> _mapAddPayListToState(AddPayList event) async* {
    _payRepository.add(event.value);
  }

  Stream<PayListState> _mapUpdatePayListToState(UpdatePayList event) async* {
    _payRepository.update(event.value);
  }

  Stream<PayListState> _mapDeletePayListToState(DeletePayList event) async* {
    _payRepository.delete(event.value);
  }

  Stream<PayListState> _mapPayListUpdatedToState(PayListUpdated event) async* {
    yield PayListLoaded(values: event.value);
  }


  @override
  Stream<PayListState> mapEventToState(PayListEvent event) async* {
    final currentState = state;
    if (event is LoadPayList) {
      yield* _mapLoadPayListToState();
    } if (event is LoadPayListWithDetails) {
      yield* _mapLoadPayListWithDetailsToState();
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


