import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/product_component.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/product_repository.dart';
import 'package:flutter/material.dart';

class ProductComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
    return ProductBase(id, key: key);
  }
}

class ProductBase extends AbstractProductComponent {
  final String? id;

  ProductBase(this.id, {Key? key}) : super(key: key, productID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  ProductRepository getProductRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.productRepository(AccessBloc.appId(context))!;
  }

  @override
  Widget yourWidget(BuildContext context, ProductModel? value) {
    return Product(value);
  }
}

class Product extends StatefulWidget {
  final ProductModel? productModel;

  Product(this.productModel);

  @override
  State<StatefulWidget> createState() {
    return ProductState();
  }
}

class ProductState extends State<Product> {
  ProductState();

  @override
  Widget build(BuildContext context) {
    return Text("The product");
  }
}
