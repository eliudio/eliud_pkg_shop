import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/custom_utils.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/grid_products.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/product_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_component.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopFrontComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return ShopFrontBase(app: app, id: id, key: key);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await shopFrontRepository(appId: app.documentID)!.get(id);
}

class ShopFrontBase extends AbstractShopFrontComponent {
  ShopFrontBase({
    super.key,
    required super.app,
    required String id,
  }) : super(shopFrontId: id);

  Widget _grid(BuildContext context, ShopFrontModel value) {
    if (value.shop == null) {
      return text(app, context, 'Shopfront has no shop specified');
    }
    return BlocProvider<ProductListBloc>(
        create: (context) => ProductListBloc(
              detailed: true,
              eliudQuery: EliudQuery(theConditions: [
                EliudQueryCondition('shopId',
                    isEqualTo: value.shop!.documentID),
              ]),
              productRepository: productRepository(appId: app.documentID)!,
            )..add(LoadProductList()),
        child: GridProducts(app: app, shopFrontModel: value));
  }

  @override
  Widget yourWidget(BuildContext context, ShopFrontModel value) {
    var appState = AccessBloc.getState(context);
    if (appState is AccessDetermined) {
      var widgets = <Widget>[];
      if (value.title != null) {
        widgets.add(h4(app, context, value.title!));
        widgets.add(Utils.getSizedBox(height: 10));
      }

      if (value.description != null) {
        widgets.add(text(app, context, value.description!));
        widgets.add(Utils.getSizedBox(height: 10));
      }
      widgets.add(_grid(context, value));
      return Utils.getShrinkedListView(app, context, widgets);
    } else {
      return Text('App not loaded');
    }
  }
}
