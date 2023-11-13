import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

import '../../model/order_overview_entity.dart';

/// OrderOverviewBloc is the bloc for editing (create package) the model "Order"
class OrderOverviewBloc
    extends EditorBaseBloc<OrderOverviewModel, OrderOverviewEntity> {
  /// Construct the OrderOverviewBloc
  OrderOverviewBloc(String appId, EditorFeedback feedback)
      : super(appId, orderOverviewRepository(appId: appId)!, feedback);

  @override
  OrderOverviewModel newInstance(StorageConditionsModel conditions) {
    return OrderOverviewModel(
      appId: appId,
      documentID: newRandomKey(),
      description: 'New Order Overview',
      conditions: conditions,
      itemImageBackground: BackgroundModel(),
      itemDetailBackground: BackgroundModel(),
    );
  }

  @override
  OrderOverviewModel setDefaultValues(
      OrderOverviewModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        itemImageBackground: t.itemImageBackground ?? BackgroundModel(),
        itemDetailBackground: t.itemDetailBackground ?? BackgroundModel(),
        conditions: t.conditions ?? conditions);
  }
}
