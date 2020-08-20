import 'package:eliud_model/core/widgets/alert_widget.dart';
import 'package:eliud_model/tools/component_constructor.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/cart_widget.dart';
import 'package:eliud_pkg_shop/model/cart_component.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:eliud_pkg_shop/model/cart_repository.dart';
import 'package:eliud_pkg_shop/shared/abstract_repository_singleton.dart';
import 'package:flutter/material.dart';

class CartComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
      return CartProfileComponent(id: id);
  }
}

class CartProfileComponent extends AbstractCartComponent {
  CartProfileComponent({String id}) : super(cartID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  CartRepository getCartRepository() {
    return AbstractRepositorySingleton.singleton.cartRepository();
  }

  @override
  Widget yourWidget(BuildContext context, CartModel cart) {
    return CartWidget(cart: cart,);
  }
}

