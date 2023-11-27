import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/cart_entity.dart';
import 'package:eliud_pkg_shop_model/model/cart_model.dart';

/// CartBloc is the Bloc to be used to edit (create package) the model "Cart"
class CartBloc extends EditorBaseBloc<CartModel, CartEntity> {
  /// Construct the CartBloc
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
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}
