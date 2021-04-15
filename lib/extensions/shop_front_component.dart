import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/grid_products.dart';
import 'package:eliud_pkg_shop/model/product_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_list_event.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_component.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_repository.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/tools/custom_utils.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopFrontComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String? id, Map<String, dynamic>? parameters}) {
    return ShopFrontBase(id);
  }
}

class ShopFrontBase extends AbstractShopFrontComponent {
  final String? id;

  ShopFrontBase(this.id) : super(shopFrontID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  ShopFrontRepository getShopFrontRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.shopFrontRepository(AccessBloc.appId(context))!;
  }

  @override
  Widget yourWidget(BuildContext context, ShopFrontModel? value) {
    return ShopFront(value);
  }
}

class ShopFront extends StatefulWidget {
  final ShopFrontModel? shopFrontModel;

  ShopFront(this.shopFrontModel);

  @override
  State<StatefulWidget> createState() {
    return ShopFrontState();
  }
}

class ShopFrontState extends State<ShopFront> {
  ShopFrontState();

  Widget _grid(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider<ProductListBloc>(
        create: (context) => ProductListBloc(
          detailed: true,
          productRepository:
              AbstractRepositorySingleton.singleton.productRepository(AccessBloc.appId(context))!,
        )..add(LoadProductList()),
      )
    ], child: GridProducts(shopFrontModel: widget.shopFrontModel));
  }

  List<Widget?> addWidget(
      List<Widget?> widgets, String? text, FontModel? font) {
    if ((text != null) && (text.isNotEmpty)) {
      widgets.add(
        Text(text, style: FontTools.textStyle(font)),
      );
      widgets.add(Utils.getSizedBox(height: 10));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    var appState = AccessBloc.getState(context);
    if (appState is AppLoaded) {
      var widgets = <Widget>[];
      addWidget(widgets, widget.shopFrontModel!.title, appState.app
          .h1);
      addWidget(widgets, widget.shopFrontModel!.description, appState.app
          .fontText);
      widgets.add(_grid(context));
      return Utils.getShrinkedListView(widgets);
    } else {
      return Text('App not loaded');
    }
  }
}
