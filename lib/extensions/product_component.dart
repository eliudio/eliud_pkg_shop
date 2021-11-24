import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/product_component.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/product_repository.dart';
import 'package:flutter/material.dart';

class ProductComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String appId, required String id, Map<String, dynamic>? parameters}) {
    return ProductBase(key: key, appId: appId, id: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await productRepository(appId: appId)!.get(id);
}

class ProductBase extends AbstractProductComponent {
  final String id;

  ProductBase({Key? key, required String appId, required this.id}) : super(key: key, theAppId: appId, productId: id);

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
    return Text('The product');
  }
}
