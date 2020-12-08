import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/product_detail.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/product_component_bloc.dart';
import 'package:eliud_pkg_shop/model/product_component_event.dart';
import 'package:eliud_pkg_shop/model/product_component_state.dart';
import 'package:eliud_pkg_shop/model/product_display_component.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_display_repository.dart';
import 'package:eliud_pkg_shop/model/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDisplayComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, String> parameters}) {
    return ProductDisplayComponent(id: id, parameters: parameters);
  }
}

class ProductDisplayComponent extends AbstractProductDisplayComponent {
  final Map<String, String> parameters;

  ProductDisplayComponent({String id, this.parameters}) : super(productDisplayID: id);

  @override
  Widget yourWidget(BuildContext context, ProductDisplayModel value) {
    var productId = parameters['productId'];
    if (productId != null) {
      return BlocProvider<ProductComponentBloc>(
        create: (context) =>
        ProductComponentBloc(productRepository: getProductRepository(context))
          ..add(FetchProductComponent(id: productId)),
        child: _widget(context, value, productId),
      );
    } else {
      return alertWidget(title: 'error', content: 'Ordernumber not provided');
    }
  }

  Widget _widget(BuildContext context, ProductDisplayModel value, String productId) {
    return BlocBuilder<ProductComponentBloc, ProductComponentState> (
      builder: (context, state) {
      if (state is ProductComponentLoaded) {
        if (productId != null) {
          return ProductDetail(
              productDisplayModel: value, productModel: state.value);
        } else {
          return alertWidget(title: 'error',
              content: 'Product with id $productId not available');
        }
      } else {
        return CircularProgressIndicator();
      }
    });
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  ProductDisplayRepository getProductDisplayRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.productDisplayRepository(AccessBloc.appId(context));
  }

  ProductRepository getProductRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.productRepository(AccessBloc.appId(context));
  }
}