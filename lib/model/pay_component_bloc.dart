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

import 'pay_model.dart';
import 'pay_component_event.dart';
import 'pay_component_state.dart';
import 'pay_repository.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  final PayRepository payRepository;

  PayBloc({ this.payRepository }): super(PayUninitialized());
  @override
  Stream<PayState> mapEventToState(PayEvent event) async* {
    final currentState = state;
    if (event is FetchPay) {
      try {
        if (currentState is PayUninitialized) {
          final PayModel model = await _fetchPay(event.id);

          if (model != null) {
            yield PayLoaded(value: model);
          } else {
            String id = event.id;
            yield PayError(message: "Pay with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield PayError(message: "Unknown error whilst retrieving Pay");
      }
    }
  }

  Future<PayModel> _fetchPay(String id) async {
    return payRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


