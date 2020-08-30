import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'bloc/cart/cart_bloc.dart';
import 'model/component_registry.dart';
import 'bloc/cart/member_extension.dart';

abstract class ShopPlugin extends Plugin {
  static final String CONDITION_CARTS_HAS_ITEMS = 'MustHaveStuffInBasket';

  @override
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc) {
    return BlocProvider<CartBloc>(create: (context) => CartBloc(navigatorBloc));
  }

  @override
  Future<bool> isConditionOk(String pluginCondition, AppModel app, MemberModel member, bool isOwner) async {
    if (pluginCondition == CONDITION_CARTS_HAS_ITEMS) {
      return (await GlobalData.member().items()).isNotEmpty;
    } else {
      return false;
    }
  }

  @override
  void init() {
    ComponentRegistry().init();
  }
}
