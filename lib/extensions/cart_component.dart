import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/cart_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/cart_component.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:eliud_pkg_shop/model/cart_repository.dart';
import 'package:flutter/material.dart';

class CartComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
      return CartProfileComponent(key: key, id: id);
  }
}

class CartProfileComponent extends AbstractCartComponent {
  CartProfileComponent({Key? key, required String id}) : super(key: key, cartID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  CartRepository getCartRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.cartRepository(AccessBloc.appId(context))!;
  }

  @override
  Widget yourWidget(BuildContext context, CartModel? cart) {
    return CartWidget(cart: cart,);
  }
}

