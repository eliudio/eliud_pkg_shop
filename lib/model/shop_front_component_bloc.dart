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

class ShopFrontBloc extends Bloc<ShopFrontEvent, ShopFrontState> {
  final ShopFrontRepository shopFrontRepository;

  ShopFrontBloc({ this.shopFrontRepository }): super(ShopFrontUninitialized());
  @override
  Stream<ShopFrontState> mapEventToState(ShopFrontEvent event) async* {
    final currentState = state;
    if (event is FetchShopFront) {
      try {
        if (currentState is ShopFrontUninitialized) {
          final ShopFrontModel model = await _fetchShopFront(event.id);

          if (model != null) {
            yield ShopFrontLoaded(value: model);
          } else {
            String id = event.id;
            yield ShopFrontError(message: "ShopFront with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield ShopFrontError(message: "Unknown error whilst retrieving ShopFront");
      }
    }
  }

  Future<ShopFrontModel> _fetchShopFront(String id) async {
    return shopFrontRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


