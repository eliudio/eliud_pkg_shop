import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

class ShopFrontBloc
    extends EditorBaseBloc<ShopFrontModel> {

  ShopFrontBloc(String appId, EditorFeedback feedback)
      : super(appId, shopFrontRepository(appId: appId)!, feedback);

  @override
  ShopFrontModel newInstance(StorageConditionsModel conditions) {
    return ShopFrontModel(
        documentID: newRandomKey(), conditions: conditions,
    );
  }

  @override
  ShopFrontModel setDefaultValues(
      ShopFrontModel t, StorageConditionsModel conditions) {
    return t.copyWith(
      addToCartColor: t.addToCartColor ?? RgbModel(r: 0, g: 0, b: 0),
        conditions: t.conditions ??
            StorageConditionsModel(
                privilegeLevelRequired:
                PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple));
  }
}
