/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_component_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_component_state.dart';
import 'package:eliud_pkg_shop/model/shop_front_repository.dart';
import 'package:flutter/services.dart';


class ShopFrontComponentBloc extends Bloc<ShopFrontComponentEvent, ShopFrontComponentState> {
  final ShopFrontRepository? shopFrontRepository;
  StreamSubscription? _shopFrontSubscription;

  Stream<ShopFrontComponentState> _mapLoadShopFrontComponentUpdateToState(String documentId) async* {
    _shopFrontSubscription?.cancel();
    _shopFrontSubscription = shopFrontRepository!.listenTo(documentId, (value) {
      if (value != null) add(ShopFrontComponentUpdated(value: value!));
    });
  }

  ShopFrontComponentBloc({ this.shopFrontRepository }): super(ShopFrontComponentUninitialized());

  @override
  Stream<ShopFrontComponentState> mapEventToState(ShopFrontComponentEvent event) async* {
    final currentState = state;
    if (event is FetchShopFrontComponent) {
      yield* _mapLoadShopFrontComponentUpdateToState(event.id!);
    } else if (event is ShopFrontComponentUpdated) {
      yield ShopFrontComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _shopFrontSubscription?.cancel();
    return super.close();
  }

}

