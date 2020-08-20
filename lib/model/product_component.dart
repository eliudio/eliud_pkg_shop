/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_component_bloc.dart';
import 'product_component_event.dart';
import 'product_model.dart';
import 'product_repository.dart';
import 'product_component_state.dart';

abstract class AbstractProductComponent extends StatelessWidget {
  static String componentName = "products";
  final String productID;

  AbstractProductComponent({this.productID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc> (
          create: (context) => ProductBloc(
            productRepository: getProductRepository())
        ..add(FetchProduct(id: productID)),
      child: _productBlockBuilder(context),
    );
  }

  Widget _productBlockBuilder(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No product defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is ProductError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, ProductModel value);
  Widget alertWidget({ title: String, content: String});
  ProductRepository getProductRepository();
}


