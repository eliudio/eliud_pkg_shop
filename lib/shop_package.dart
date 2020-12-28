import 'dart:async';

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/model/component_registry.dart';
import 'package:eliud_pkg_shop/bloc/cart/member_extension.dart';
import 'package:collection/collection.dart';

import 'model/cart_item_model.dart';

abstract class ShopPackage extends Package {
  static final String CONDITION_CARTS_HAS_ITEMS = 'MustHaveStuffInBasket';
  AccessBloc accessBloc;
  StreamSubscription _memberSubscription; // to check for items in cart

  void mapAccessEvent(AccessEvent event, AccessState state) {}

  void mapAccessState(AccessEvent event, AccessState state) {
    // state is the state after it was handled by AccessBloc
    if (state is AppLoaded) {
      if (event is InitApp) {
        _listenForCartChanges(state.app, state.getMember());
      } else if (event is SwitchAppEvent) {
        _listenForCartChanges(state.app, state.getMember());
      } else if (event is LogoutEvent) {
        _memberSubscription?.cancel();
      } else if (event is LoginEvent) {
        _listenForCartChanges(state.app, state.getMember());
      }
    }
  }

  void _listenForCartChanges(AppModel app, MemberModel currentMember) {
    if (currentMember == null) return;
    _memberSubscription?.cancel();
    _memberSubscription = memberRepository(appId: app.documentID)
        .listenTo(currentMember.documentID, (member) async {
      accessBloc.add(MemberUpdated(member));
    });
  }

  @override
  BlocProvider createMainBloc(
      NavigatorBloc navigatorBloc, AccessBloc accessBloc) {
    // store the accessBloc
    this.accessBloc = accessBloc;

    // register an extra access bloc event mapper, pointing our mapAccessEvent method
    //  accessBloc.addMapper(mapAccessEvent);
    accessBloc.addStateChangeListener(mapAccessState);

    // create a top level bloc
    return BlocProvider<CartBloc>(
        create: (context) => CartBloc(navigatorBloc, accessBloc));
  }

  @override
  Future<bool> isConditionOk(String packageCondition, AppModel app,
      MemberModel member, bool isOwner, int privilegeLevel) async {
    if (packageCondition == CONDITION_CARTS_HAS_ITEMS) {
      if (member != null) {
        return (await member.items()).isNotEmpty;
      }
      return false;
    }
    return null;
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [CONDITION_CARTS_HAS_ITEMS];
  }

  @override
  void init() {
    ComponentRegistry().init();
  }
}
