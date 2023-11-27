import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core_main/model/rgb_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/shop_front_model.dart';

import 'package:eliud_pkg_shop_model/model/shop_front_entity.dart';

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
    ShopFrontModel t,
    StorageConditionsModel conditions,
  ) {
    return t.copyWith(
      addToCartColor: t.addToCartColor ?? RgbModel(r: 0, g: 0, b: 0),
      conditions: t.conditions ?? conditions,
    );
  }
}
