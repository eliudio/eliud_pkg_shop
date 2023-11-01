/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/pay_component_event.dart';
import 'package:eliud_pkg_shop/model/pay_component_state.dart';
import 'package:eliud_pkg_shop/model/pay_repository.dart';


class PayComponentBloc extends Bloc<PayComponentEvent, PayComponentState> {
  final PayRepository? payRepository;
  StreamSubscription? _paySubscription;

  void _mapLoadPayComponentUpdateToState(String documentId) {
    _paySubscription?.cancel();
    _paySubscription = payRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(PayComponentUpdated(value: value));
      }
    });
  }

  PayComponentBloc({ this.payRepository }): super(PayComponentUninitialized()) {
    on <FetchPayComponent> ((event, emit) {
      _mapLoadPayComponentUpdateToState(event.id!);
    });
    on <PayComponentUpdated> ((event, emit) {
      emit(PayComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _paySubscription?.cancel();
    return super.close();
  }

}

