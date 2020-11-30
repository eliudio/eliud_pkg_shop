import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/model/component_registry.dart';
import 'package:eliud_pkg_shop/bloc/cart/member_extension.dart';

abstract class ShopPackage extends Package {
  static final String CONDITION_CARTS_HAS_ITEMS = 'MustHaveStuffInBasket';

  @override
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc, AccessBloc accessBloc) {
    return BlocProvider<CartBloc>(create: (context) => CartBloc(navigatorBloc, accessBloc));
  }

  @override
  Future<bool> isConditionOk(String packageCondition, AppModel app, MemberModel member, bool isOwner) async {
    if (packageCondition == CONDITION_CARTS_HAS_ITEMS) {
      if (member != null) {
        return (await member.items()).isNotEmpty;
      }
      return false;
    }
    return null;
  }

  @override
  void init() {
    ComponentRegistry().init();
  }
}
