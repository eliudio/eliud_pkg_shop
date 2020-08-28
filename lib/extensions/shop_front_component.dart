import 'package:eliud_model/core/global_data.dart';
import 'package:eliud_model/core/widgets/alert_widget.dart';
import 'package:eliud_model/tools/component_constructor.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/grid_products.dart';
import 'package:eliud_pkg_shop/model/product_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_component.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_repository.dart';
import 'package:eliud_model/model/font_model.dart';
import 'package:eliud_model/tools/custom_utils.dart';
import 'package:eliud_model/tools/etc.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopFrontComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
    return ShopFrontBase(id);
  }
}

class ShopFrontBase extends AbstractShopFrontComponent {
  final String id;

  ShopFrontBase(this.id) : super(shopFrontID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  ShopFrontRepository getShopFrontRepository() {
    return AbstractRepositorySingleton.singleton.shopFrontRepository();
  }

  @override
  Widget yourWidget(BuildContext context, ShopFrontModel value) {
    return ShopFront(value);
  }
}

class ShopFront extends StatefulWidget {
  final ShopFrontModel shopFrontModel;

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
          productRepository:
              AbstractRepositorySingleton.singleton.productRepository(),
        )..add(LoadProductListWithDetails()),
      )
    ], child: GridProducts(shopFrontModel: widget.shopFrontModel));
  }

  List<Widget> addWidget(
      List<Widget> widgets, String text, FontModel font) {
    if ((text != null) && (text.length > 0)) {
      widgets.add(
        Text(text, style: FontTools.textStyle(font)),
      );
      widgets.add(Utils.getSizedBox(height: 10));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List();
    addWidget(widgets, widget.shopFrontModel.title, GlobalData.app().fontText);
    addWidget(widgets, widget.shopFrontModel.description, GlobalData.app().fontText);
    widgets.add(_grid(context));
    return Utils.getShrinkedListView(widgets);
  }
}
