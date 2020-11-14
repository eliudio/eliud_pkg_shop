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

class ShopFrontComponentBloc extends Bloc<ShopFrontComponentEvent, ShopFrontComponentState> {
  final ShopFrontRepository shopFrontRepository;

  ShopFrontComponentBloc({ this.shopFrontRepository }): super(ShopFrontComponentUninitialized());
  @override
  Stream<ShopFrontComponentState> mapEventToState(ShopFrontComponentEvent event) async* {
    final currentState = state;
    if (event is FetchShopFrontComponent) {
      try {
        if (currentState is ShopFrontComponentUninitialized) {
          final ShopFrontModel model = await _fetchShopFront(event.id);

          if (model != null) {
            yield ShopFrontComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield ShopFrontComponentError(message: "ShopFront with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield ShopFrontComponentError(message: "Unknown error whilst retrieving ShopFront");
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


