import 'dart:async';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/access_event.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_main/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_fundamentals/fundamentals_package.dart';
import 'package:eliud_pkg_notifications/notifications_package.dart';
import 'package:eliud_pkg_pay/pay_package.dart';
import 'package:eliud_pkg_shop_model/model/component_registry.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/repository_singleton.dart';
import 'package:eliud_pkg_shop/wizards/payment_workflow_wizard.dart';
import 'package:eliud_pkg_workflow/workflow_package.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop_model/model/member_cart_model.dart';
import 'editors/cart_component_editor.dart';
import 'editors/order_overview_component_editor.dart';
import 'editors/pay_component_editor.dart';
import 'editors/pay_confirmation_component_editor.dart';
import 'editors/product_display_component_editor.dart';
import 'editors/shop_front_component_editor.dart';
import 'extensions/cart_component.dart';
import 'extensions/order_overview_component.dart';
import 'extensions/pay_component.dart';
import 'extensions/pay_confirmation_component.dart';
import 'extensions/product_display_component.dart';
import 'extensions/shop_front_component.dart';
import 'wizards/shop_page_wizard.dart';

import 'package:eliud_pkg_shop/shop_package_stub.dart'
    if (dart.library.io) 'shop_mobile_package.dart'
    if (dart.library.html) 'shop_web_package.dart';

abstract class ShopPackage extends Package {
  ShopPackage() : super('eliud_pkg_shop');

  static final String conditionCartsHasItems = 'MustHaveStuffInBasket';
  final Map<String, bool?> stateConditionCartsHasItems = {};
  final Map<String, StreamSubscription<List<MemberCartModel?>>> subscription =
      {};

  @override
  BlocProvider createPackageAppBloc(String appId, AccessBloc accessBloc) =>
      BlocProvider<CartBloc>(create: (context) => CartBloc(appId, accessBloc));

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
          stateConditionCartsHasItems[appId] = cartHasItems;
          // the first time we get this trigger, it's upon entry of the getAndSubscribe. Now we simply return the value
          c.complete([
            PackageConditionDetails(
                packageName: packageName,
                conditionName: conditionCartsHasItems,
                value: cartHasItems)
          ]);
        } else {
          // subsequent calls we get this trigger, it's when the date has changed. Now add the event to the bloc
          if (cartHasItems != stateConditionCartsHasItems[appId]) {
            stateConditionCartsHasItems[appId] = cartHasItems;
            accessBloc.add(UpdatePackageConditionEvent(
                app, this, conditionCartsHasItems, cartHasItems));
          }
        }
      }, eliudQuery: getCartQuery(appId, member.documentID));
      return c.future;
    } else {
      stateConditionCartsHasItems[appId] = false;
      return Future.value([
        PackageConditionDetails(
            packageName: packageName,
            conditionName: conditionCartsHasItems,
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
    return [conditionCartsHasItems];
  }

  @override
  void init() {
    ComponentRegistry().init(
      CartComponentConstructorDefault(),
      CartComponentEditorConstructor(),
      OrderOverviewComponentConstructorDefault(),
      OrderOverviewComponentEditorConstructor(),
      PayComponentConstructorDefault(),
      PayComponentEditorConstructor(),
      PayConfirmationComponentConstructorDefault(),
      PayConfirmationComponentEditorConstructor(),
      ProductDisplayComponentConstructorDefault(),
      ProductDisplayComponentEditorConstructor(),
      ShopFrontComponentConstructorDefault(),
      ShopFrontComponentEditorConstructor(),
    );

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
  @override
  void registerDependencies(Eliud eliud) {
    eliud.registerPackage(CorePackage.instance());
    eliud.registerPackage(FundamentalsPackage.instance());
    eliud.registerPackage(PayPackage.instance());
    eliud.registerPackage(NotificationsPackage.instance());
    eliud.registerPackage(WorkflowPackage.instance());
  }
}
