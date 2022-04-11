import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/widgets/editor/select_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/shop_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_list_state.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';

Widget selectShopWidget(BuildContext context, AppModel app, ShopModel? shop, Function (dynamic selected) selectedCallback) {
  return SelectWidget<ShopModel>(
      app: app,
      currentlySelected: shop,
      title: 'Shop',
      selectTitle: 'Select shop',
      displayItemFunction: (item) => text(app, context,
          item.documentID! + ' ' + (item.description ?? '?')),
      blocProviderProvider: () => BlocProvider<ShopListBloc>(
        create: (context) => ShopListBloc(
          shopRepository: shopRepository(appId: app.documentID!)!,
        )..add(LoadShopList()),
      ),
      blocBuilder: (contentsLoaded, contentsNotLoaded) {
        return BlocBuilder<ShopListBloc, ShopListState>(
            builder: (context, state) {
              if ((state is ShopListLoaded) && (state.values != null)) {
                return contentsLoaded(state.values!);
              } else {
                return contentsNotLoaded();
              }
            });
      },
      selectedCallback: selectedCallback
    );
}