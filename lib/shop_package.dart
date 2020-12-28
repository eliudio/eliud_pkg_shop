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
  Timer timer;
  AccessBloc accessBloc;
  StreamSubscription _memberSubscription; // to check for items in cart
  AppModel stateApp;
  MemberModel stateMember;
  List<CartItemModel> itemsInCart = List<CartItemModel>();

  void mapAccessEvent(AccessEvent event, AccessState state) {
    if ((event is SwitchAppEvent) || (event is SwitchAppAndPageEvent) || (event is LogoutEvent) || (event is LoginEvent))
      _listenForCartChanges(state.app, state.getMember());
  }

  void mapAccessState(AccessState state) {
  }

  void _listenForCartChanges(AppModel app, MemberModel currentMember) {
    if ((itemsInCart == null) || (stateMember == null) || (stateApp == null) || (stateApp.documentID != app.documentID) || (stateMember.documentID != currentMember.documentID)) {
      // remember which member and app we were observing
      stateMember = currentMember;
      stateApp = app;

      // listen to the new member's cart, if the cart items change then send a MemberUpdate
      _memberSubscription?.cancel();
      if (stateMember != null) {
        _memberSubscription = memberRepository(appId: app.documentID).listenTo(
            stateMember.documentID, (member) async {
          var itemsInUpdatedCart = await member.items();
          if (!CartMemberExtension.cartsEqual(itemsInUpdatedCart, itemsInCart)) {
            itemsInCart = itemsInUpdatedCart;
            accessBloc.add(MemberUpdated(member));
          }
        });
      }
    }
  }

  @override
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc,
      AccessBloc accessBloc) {
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
    return [ CONDITION_CARTS_HAS_ITEMS];
  }

  @override
  void init() {
    ComponentRegistry().init();
  }
}
