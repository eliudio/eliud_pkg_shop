import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

import '../../model/cart_entity.dart';

class CartBloc extends EditorBaseBloc<CartModel, CartEntity> {
  CartBloc(String appId, EditorFeedback feedback)
      : super(appId, cartRepository(appId: appId)!, feedback);

  @override
  CartModel newInstance(StorageConditionsModel conditions) {
    return CartModel(
      appId: appId,
      documentID: newRandomKey(),
      description: 'New cart',
      conditions: conditions,
    );
  }

  @override
  CartModel setDefaultValues(CartModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        conditions: t.conditions ?? conditions);
  }
}
