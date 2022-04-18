import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/widgets/editor/select_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_state.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

Widget selectShopFrontWidget(BuildContext context, AppModel app, StorageConditionsModel? containerStorageConditions, ShopFrontModel? shopFront, Function (dynamic selected) selectedCallback) {
  return SelectWidget<ShopFrontModel>(
      app: app,
      currentlySelected: shopFront,
      title: 'Shop Front',
      selectTitle: 'Select shop front',
      displayItemFunction: (item) => text(app, context,
          item.documentID! + ' ' + (item.description ?? '?')),
      blocProviderProvider: () => BlocProvider<ShopFrontListBloc>(
       create: (context) => ShopFrontListBloc(
         eliudQuery: getComponentSelectorQuery(
             containerStorageConditions == null ||
                 containerStorageConditions.privilegeLevelRequired ==
                     null
                 ? 0
                 : containerStorageConditions
                 .privilegeLevelRequired!.index,
             app.documentID!),
          shopFrontRepository: shopFrontRepository(appId: app.documentID!)!,
        )..add(LoadShopFrontList()),
      ),
      blocBuilder: (contentsLoaded, contentsNotLoaded) {
        return BlocBuilder<ShopFrontListBloc, ShopFrontListState>(
            builder: (context, state) {
              if ((state is ShopFrontListLoaded) && (state.values != null)) {
                return contentsLoaded(context, state.values!);
              } else {
                return contentsNotLoaded(context, );
              }
            });
      },
      selectedCallback: selectedCallback,
      changePrivilegeEventCallback: (BuildContext context, int privilegeLevel) {
        BlocProvider.of<ShopFrontListBloc>(context).add(
            ShopFrontChangeQuery(newQuery: getComponentSelectorQuery(privilegeLevel,
                app.documentID!)));
      },
      containerPrivilege: containerStorageConditions == null || containerStorageConditions.privilegeLevelRequired == null ? 0 : containerStorageConditions.privilegeLevelRequired!.index
    );
}