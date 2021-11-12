import 'dart:async';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_shop/model/component_registry.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_singleton.dart';

import 'model/member_cart_model.dart';

abstract class ShopPackage extends Package {
  ShopPackage() : super('eliud_pkg_shop');

  static final String CONDITION_CARTS_HAS_ITEMS = 'MustHaveStuffInBasket';
  bool? stateCONDITION_CARTS_HAS_ITEMS = null;
  late StreamSubscription<List<MemberCartModel?>> subscription;

  void _setState(bool newState, {MemberModel? currentMember}) {
    if (newState != stateCONDITION_CARTS_HAS_ITEMS) {
      stateCONDITION_CARTS_HAS_ITEMS = newState;
    }
  }

  @override
  void resubscribe(AppModel? app, MemberModel? currentMember) {
    var appId = app!.documentID;
    if (currentMember != null) {
      subscription = memberCartRepository(appId: appId)!.listen((list) {
        if (list.isNotEmpty) {
          _setState(((list.first!.cartItems != null) && (list.first!.cartItems!.isNotEmpty)), currentMember: currentMember);
        } else {
          _setState(false, currentMember: currentMember);
        }
      }, eliudQuery: getCartQuery(
          appId, currentMember.documentID));
    } else {
      _setState(false);
    }
  }

  static EliudQuery getCartQuery(String? appId, String? memberId) {
    return EliudQuery(
        theConditions: [EliudQueryCondition(
            DocumentIdField(),
            isEqualTo: memberId
        )]
    );
  }

  @override
  Future<bool?> isConditionOk(
      String? packageCondition,
      AppModel? app,
      MemberModel? member,
      bool? isOwner,
      bool? isBlocked,
      PrivilegeLevel? privilegeLevel) async {
    if (packageCondition == CONDITION_CARTS_HAS_ITEMS) {
      if (stateCONDITION_CARTS_HAS_ITEMS == null) return false;
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

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => AbstractRepositorySingleton.collections;
}
