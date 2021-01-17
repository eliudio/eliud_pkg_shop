import 'dart:async';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package_with_subscription.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/model/component_registry.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_singleton.dart';

abstract class ShopPackage extends PackageWithSubscription {
  static final String CONDITION_CARTS_HAS_ITEMS = 'MustHaveStuffInBasket';
  bool stateCONDITION_CARTS_HAS_ITEMS = null;

  void _setState(bool newState, {MemberModel currentMember}) {
    if (newState != stateCONDITION_CARTS_HAS_ITEMS) {
      stateCONDITION_CARTS_HAS_ITEMS = newState;
      accessBloc.add(MemberUpdated(currentMember));
    }
  }

  @override
  void resubscribe(AppModel app, MemberModel currentMember) {
    String appId = app.documentID;
    if (currentMember != null) {
      subscription = memberCartRepository(appId: appId)
          .listenTo(currentMember.documentID, (memberCart) async {
        if (memberCart != null) {
          _setState(((memberCart.cartItems != null) && (memberCart.cartItems.length > 0)), currentMember: currentMember);
        } else {
          _setState(false, currentMember: currentMember);
        }
      });
    } else {
      _setState(false);
    }
  }

  static EliudQuery getCartQuery(String appId, String memberId) {
    return EliudQuery(
        theConditions: [
          EliudQueryCondition('assigneeId', isEqualTo: memberId),
          EliudQueryCondition('appId', isEqualTo: appId),
        ]
    );
  }

  void unsubscribe() {
    super.unsubscribe();
    _setState(false);
  }

  @override
  BlocProvider createMainBloc(
      NavigatorBloc navigatorBloc, AccessBloc accessBloc) {
    super.createMainBloc(navigatorBloc, accessBloc);
    // create a top level bloc
    // todo: review. I don't believe we have to do this!
    return BlocProvider<CartBloc>(
        create: (context) => CartBloc(navigatorBloc, accessBloc));
  }

  @override
  Future<bool> isConditionOk(
      String packageCondition,
      AppModel app,
      MemberModel member,
      bool isOwner,
      bool isBlocked,
      PrivilegeLevel privilegeLevel) async {
    if (packageCondition == CONDITION_CARTS_HAS_ITEMS) {
      return stateCONDITION_CARTS_HAS_ITEMS;
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

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }
}
