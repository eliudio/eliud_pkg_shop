import 'dart:async';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_fundamentals/fundamentals_package.dart';
import 'package:eliud_pkg_notifications/notifications_package.dart';
import 'package:eliud_pkg_pay/pay_package.dart';
import 'package:eliud_pkg_shop/model/component_registry.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_singleton.dart';
import 'package:eliud_pkg_shop/wizards/payment_workflow_wizard.dart';
import 'package:eliud_pkg_workflow/workflow_package.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart/cart_bloc.dart';
import 'model/member_cart_model.dart';
import 'wizards/shop_page_wizard.dart';

import 'package:eliud_pkg_shop/shop_package_stub.dart'
if (dart.library.io) 'shop_mobile_package.dart'
if (dart.library.html) 'shop_web_package.dart';

abstract class ShopPackage extends Package {
  ShopPackage() : super('eliud_pkg_shop');

  static final String CONDITION_CARTS_HAS_ITEMS = 'MustHaveStuffInBasket';
  Map<String, bool?> stateCONDITION_CARTS_HAS_ITEMS = {};
  Map<String, StreamSubscription<List<MemberCartModel?>>> subscription = {};

  @override
  BlocProvider createPackageAppBloc(String appId, AccessBloc accessBloc) =>
      BlocProvider<CartBloc>(create: (context) =>
          CartBloc(appId, accessBloc));

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(
      AccessBloc accessBloc,
      AppModel app,
      MemberModel? member,
      bool isOwner,
      bool? isBlocked,
      PrivilegeLevel? privilegeLevel) {
    var appId = app.documentID;
    subscription[appId]?.cancel();
    if (member != null) {
      final c = Completer<List<PackageConditionDetails>>();
      subscription[appId] = memberCartRepository(appId: appId)!.listen((list) {
        var cartHasItems = (list.isNotEmpty) &&
            (list.first!.cartItems != null) &&
            (list.first!.cartItems!.isNotEmpty);
        if (!c.isCompleted) {
          stateCONDITION_CARTS_HAS_ITEMS[appId] = cartHasItems;
          // the first time we get this trigger, it's upon entry of the getAndSubscribe. Now we simply return the value
          c.complete([
            PackageConditionDetails(
                packageName: packageName,
                conditionName: CONDITION_CARTS_HAS_ITEMS,
                value: cartHasItems)
          ]);
        } else {
          // subsequent calls we get this trigger, it's when the date has changed. Now add the event to the bloc
          if (cartHasItems != stateCONDITION_CARTS_HAS_ITEMS[appId]) {
            stateCONDITION_CARTS_HAS_ITEMS[appId] = cartHasItems;
            accessBloc.add(UpdatePackageConditionEvent(
                app, this, CONDITION_CARTS_HAS_ITEMS, cartHasItems));
          }
        }
      }, eliudQuery: getCartQuery(appId, member.documentID));
      return c.future;
    } else {
      stateCONDITION_CARTS_HAS_ITEMS[appId] = false;
      return Future.value([
        PackageConditionDetails(
            packageName: packageName,
            conditionName: CONDITION_CARTS_HAS_ITEMS,
            value: false)
      ]);
    }
  }

  static EliudQuery getCartQuery(String? appId, String? memberId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition(DocumentIdField(), isEqualTo: memberId)
    ]);
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [CONDITION_CARTS_HAS_ITEMS];
  }

  @override
  void init() {
    ComponentRegistry().init();

    // Wizards
    NewAppWizardRegistry.registry().register(ShopPageWizard());
    NewAppWizardRegistry.registry().register(PaymentWorkflowWizard());

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() =>
      AbstractRepositorySingleton.collections;

  static ShopPackage instance() => getShopPackage();

  /*
   * Register depending packages
   */
  void registerDependencies(Eliud eliud) {
    eliud.registerPackage(CorePackage.instance());
    eliud.registerPackage(FundamentalsPackage.instance());
    eliud.registerPackage(PayPackage.instance());
    eliud.registerPackage(NotificationsPackage.instance());
    eliud.registerPackage(WorkflowPackage.instance());
  }
}
