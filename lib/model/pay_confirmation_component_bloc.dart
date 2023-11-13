/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/pay_confirmation_component_event.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component_state.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';

class PayConfirmationComponentBloc
    extends Bloc<PayConfirmationComponentEvent, PayConfirmationComponentState> {
  final PayConfirmationRepository? payConfirmationRepository;
  StreamSubscription? _payConfirmationSubscription;

  void _mapLoadPayConfirmationComponentUpdateToState(String documentId) {
    _payConfirmationSubscription?.cancel();
    _payConfirmationSubscription =
        payConfirmationRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(PayConfirmationComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct PayConfirmationComponentBloc
   */
  PayConfirmationComponentBloc({this.payConfirmationRepository})
      : super(PayConfirmationComponentUninitialized()) {
    on<FetchPayConfirmationComponent>((event, emit) {
      _mapLoadPayConfirmationComponentUpdateToState(event.id!);
    });
    on<PayConfirmationComponentUpdated>((event, emit) {
      emit(PayConfirmationComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the PayConfirmationComponentBloc
   */
  @override
  Future<void> close() {
    _payConfirmationSubscription?.cancel();
    return super.close();
  }
}
