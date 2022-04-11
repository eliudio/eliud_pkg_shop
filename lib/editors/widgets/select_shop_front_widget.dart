import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/widgets/editor/select_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_state.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

Widget selectShopFrontWidget(BuildContext context, AppModel app, ShopFrontModel? shopFront, Function (dynamic selected) selectedCallback) {
  return SelectWidget<ShopFrontModel>(
      app: app,
      currentlySelected: shopFront,
      title: 'Shop Front',
      selectTitle: 'Select shop front',
      displayItemFunction: (item) => text(app, context,
          item.documentID! + ' ' + (item.description ?? '?')),
      blocProviderProvider: () => BlocProvider<ShopFrontListBloc>(
        create: (context) => ShopFrontListBloc(
          shopFrontRepository: shopFrontRepository(appId: app.documentID!)!,
        )..add(LoadShopFrontList()),
      ),
      blocBuilder: (contentsLoaded, contentsNotLoaded) {
        return BlocBuilder<ShopFrontListBloc, ShopFrontListState>(
            builder: (context, state) {
              if ((state is ShopFrontListLoaded) && (state.values != null)) {
                return contentsLoaded(state.values!);
              } else {
                return contentsNotLoaded();
              }
            });
      },
      selectedCallback: selectedCallback
    );
}