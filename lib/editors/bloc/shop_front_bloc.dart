import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

import '../../model/shop_front_entity.dart';

class ShopFrontBloc extends EditorBaseBloc<ShopFrontModel, ShopFrontEntity> {
  ShopFrontBloc(String appId, EditorFeedback feedback)
      : super(appId, shopFrontRepository(appId: appId)!, feedback);

  @override
  ShopFrontModel newInstance(StorageConditionsModel conditions) {
    return ShopFrontModel(
      appId: appId,
      documentID: newRandomKey(),
      description: 'New Shop Front',
      conditions: conditions,
    );
  }

  @override
  ShopFrontModel setDefaultValues(
      ShopFrontModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        addToCartColor: t.addToCartColor ?? RgbModel(r: 0, g: 0, b: 0),
        conditions: t.conditions ?? conditions);
  }
}
