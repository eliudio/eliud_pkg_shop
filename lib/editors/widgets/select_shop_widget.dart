import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/widgets/editor/select_widget.dart';
import 'package:eliud_pkg_shop/editors/shop/shop_dashboard.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/shop_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_list_state.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';

Widget selectShopWidget(BuildContext context, AppModel app, StorageConditionsModel? containerStorageConditions, ShopModel? shop, Function (dynamic selected) selectedCallback) {
  return SelectWidget<ShopModel>(
      app: app,
      currentlySelected: shop,
      title: 'Shop',
      selectTitle: 'Select shop',
      displayItemFunction: (item) => text(app, context,
          item.documentID + ' ' + (item.description ?? '?')),
      blocProviderProvider: () => BlocProvider<ShopListBloc>(
        create: (context) => ShopListBloc(
          eliudQuery: getComponentSelectorQuery(0, app.documentID),
          shopRepository: shopRepository(appId: app.documentID)!,
        )..add(LoadShopList()),
      ),
      blocBuilder: (contentsLoaded, contentsNotLoaded) {
        return BlocBuilder<ShopListBloc, ShopListState>(
            builder: (context, state) {
              if ((state is ShopListLoaded) && (state.values != null)) {
                return contentsLoaded(context, state.values!);
              } else {
                return contentsNotLoaded(context, );
              }
            });
      },
      selectedCallback: selectedCallback,
      addCallback: () => ShopDashboard.addShop(app, context),
      deleteCallback: null,
      updateCallback: (item) => ShopDashboard.updateShop(app, context, item),
      changePrivilegeEventCallback: (BuildContext context, int privilegeLevel) {
        BlocProvider.of<ShopListBloc>(context).add(
            ShopChangeQuery(newQuery: getComponentSelectorQuery(privilegeLevel,
                app.documentID)));
      },
      containerPrivilege: containerStorageConditions == null || containerStorageConditions.privilegeLevelRequired == null ? 0 : containerStorageConditions.privilegeLevelRequired!.index
    );
}

