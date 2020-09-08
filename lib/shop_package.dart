import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/model/component_registry.dart';
import 'package:eliud_pkg_shop/bloc/cart/member_extension.dart';

abstract class ShopPlugin extends Plugin {
  static final String CONDITION_CARTS_HAS_ITEMS = 'MustHaveStuffInBasket';

  @override
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc) {
    return BlocProvider<CartBloc>(create: (context) => CartBloc(navigatorBloc));
  }

  @override
  Future<bool> isConditionOk(String pluginCondition, AppModel app, MemberModel member, bool isOwner) async {
    if (pluginCondition == CONDITION_CARTS_HAS_ITEMS) {
      if (member != null)
        return (await member.items()).isNotEmpty;
      return false;
    }
    return null;
  }

  @override
  void init() {
    ComponentRegistry().init();
  }
}
