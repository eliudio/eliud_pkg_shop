import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/custom_utils.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/grid_products.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/product_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_component.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopFrontComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String appId, required String id, Map<String, dynamic>? parameters}) {
    return ShopFrontBase(appId: appId, id: id, key: key);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await shopFrontRepository(appId: appId)!.get(id);
}

class ShopFrontBase extends AbstractShopFrontComponent {
  ShopFrontBase({Key? key, required String appId, required String id, }) : super(key: key, theAppId: appId, shopFrontId: id);

  Widget _grid(BuildContext context, ShopFrontModel value) {
    return BlocProvider<ProductListBloc>(
      create: (context) => ProductListBloc(
        detailed: true,
        productRepository: productRepository(appId: theAppId)!,
      )..add(LoadProductList()),
    child: GridProducts(shopFrontModel: value));
  }

  @override
  Widget yourWidget(BuildContext context, ShopFrontModel value) {
    var appState = AccessBloc.getState(context);
    if (appState is AccessDetermined) {
      var widgets = <Widget>[];
      if (value.title != null) {
        widgets.add(h4(context, value.title!));
        widgets.add(Utils.getSizedBox(height: 10));
      }

      if (value.description != null) {
        widgets.add(text(context, value.description!));
        widgets.add(Utils.getSizedBox(height: 10));
      }
      widgets.add(_grid(context, value));
      return Utils.getShrinkedListView(context, widgets);
    } else {
      return Text('App not loaded');
    }
  }
}
