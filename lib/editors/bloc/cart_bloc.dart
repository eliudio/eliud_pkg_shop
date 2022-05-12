import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

class CartBloc extends EditorBaseBloc<CartModel> {
  CartBloc(String appId, EditorFeedback feedback)
      : super(appId, cartRepository(appId: appId)!, feedback);

  @override
  CartModel newInstance(StorageConditionsModel conditions) {
    return CartModel(
      appId: appId,
      documentID: newRandomKey(),
      description: 'New cart',
      conditions: conditions,
      itemImageBackground: BackgroundModel(),
      itemDetailBackground: BackgroundModel(),
    );
  }

  @override
  CartModel setDefaultValues(CartModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        itemImageBackground: t.itemImageBackground ?? BackgroundModel(),
        itemDetailBackground: t.itemDetailBackground ?? BackgroundModel(),
        conditions: t.conditions ?? conditions);
  }
}
