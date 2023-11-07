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

import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_list_event.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'pay_confirmation_model.dart';

typedef FilterPayConfirmationModels = List<PayConfirmationModel?> Function(
    List<PayConfirmationModel?> values);

class PayConfirmationListBloc
    extends Bloc<PayConfirmationListEvent, PayConfirmationListState> {
  final FilterPayConfirmationModels? filter;
  final PayConfirmationRepository _payConfirmationRepository;
  StreamSubscription? _payConfirmationsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int payConfirmationLimit;

  PayConfirmationListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required PayConfirmationRepository payConfirmationRepository,
      this.payConfirmationLimit = 5})
      : _payConfirmationRepository = payConfirmationRepository,
        super(PayConfirmationListLoading()) {
    on<LoadPayConfirmationList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPayConfirmationListToState();
      } else {
        _mapLoadPayConfirmationListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPayConfirmationListWithDetailsToState();
    });

    on<PayConfirmationChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPayConfirmationListToState();
      } else {
        _mapLoadPayConfirmationListWithDetailsToState();
      }
    });

    on<AddPayConfirmationList>((event, emit) async {
      await _mapAddPayConfirmationListToState(event);
    });

    on<UpdatePayConfirmationList>((event, emit) async {
      await _mapUpdatePayConfirmationListToState(event);
    });

    on<DeletePayConfirmationList>((event, emit) async {
      await _mapDeletePayConfirmationListToState(event);
    });

    on<PayConfirmationListUpdated>((event, emit) {
      emit(_mapPayConfirmationListUpdatedToState(event));
    });
  }

  List<PayConfirmationModel?> _filter(List<PayConfirmationModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadPayConfirmationListToState() async {
    int amountNow = (state is PayConfirmationListLoaded)
        ? (state as PayConfirmationListLoaded).values!.length
        : 0;
    _payConfirmationsListSubscription?.cancel();
    _payConfirmationsListSubscription = _payConfirmationRepository.listen(
        (list) => add(PayConfirmationListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit:
            ((paged != null) && paged!) ? pages * payConfirmationLimit : null);
  }

  Future<void> _mapLoadPayConfirmationListWithDetailsToState() async {
    int amountNow = (state is PayConfirmationListLoaded)
        ? (state as PayConfirmationListLoaded).values!.length
        : 0;
    _payConfirmationsListSubscription?.cancel();
    _payConfirmationsListSubscription =
        _payConfirmationRepository.listenWithDetails(
            (list) => add(PayConfirmationListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * payConfirmationLimit
                : null);
  }

  Future<void> _mapAddPayConfirmationListToState(
      AddPayConfirmationList event) async {
    var value = event.value;
    if (value != null) {
      await _payConfirmationRepository.add(value);
    }
  }

  Future<void> _mapUpdatePayConfirmationListToState(
      UpdatePayConfirmationList event) async {
    var value = event.value;
    if (value != null) {
      await _payConfirmationRepository.update(value);
    }
  }

  Future<void> _mapDeletePayConfirmationListToState(
      DeletePayConfirmationList event) async {
    var value = event.value;
    if (value != null) {
      await _payConfirmationRepository.delete(value);
    }
  }

  PayConfirmationListLoaded _mapPayConfirmationListUpdatedToState(
          PayConfirmationListUpdated event) =>
      PayConfirmationListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _payConfirmationsListSubscription?.cancel();
    return super.close();
  }
}
