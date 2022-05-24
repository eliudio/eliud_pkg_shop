import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/product_detail.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/product_display_component.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_display_repository.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDisplayComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return ProductDisplayComponent(
        key: key, app: app, id: id, parameters: parameters);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await productDisplayRepository(appId: app.documentID)!.get(id);
}

class ProductDisplayComponent extends AbstractProductDisplayComponent {
  final Map<String, dynamic>? parameters;

  ProductDisplayComponent(
      {Key? key, required AppModel app, required String id, this.parameters})
      : super(key: key, app: app, productDisplayId: id);

  @override
  Widget yourWidget(BuildContext context, ProductDisplayModel? value) {
    var productId = parameters!['productId'];
    var appId = value!.appId;
    if (productId != null) {
      return FutureBuilder<ProductModel?>(
          future: productRepository(appId: appId)!.get(productId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ProductDetail(app: app,
                  productDisplayModel: value, productModel: snapshot.data);
            } else {
              return progressIndicator(app, context);
            }
          }
      );
    } else {
      return alertWidget(title: 'error', content: 'Ordernumber not provided');
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(app: app, title: title, content: content);
  }

  @override
  ProductDisplayRepository getProductDisplayRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .productDisplayRepository(app.documentID)!;
  }

  ProductRepository? getProductRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .productRepository(app.documentID);
  }
}
