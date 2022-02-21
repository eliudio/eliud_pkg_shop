import 'package:eliud_core/core/wizards/registry/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';

import 'builders/page/shop_page_builder.dart';

class ShopPageWizard extends NewAppWizardInfoWithActionSpecification {

  ShopPageWizard() : super('shop', 'Shop',  'Generate Shop Page');

  @override
  NewAppWizardParameters newAppWizardParameters() => ActionSpecificationParametersBase(
    requiresAccessToLocalFileSystem: false,
    availableInLeftDrawer: true,
    availableInRightDrawer: false,
    availableInAppBar: false,
    availableInHomeMenu: true,
    available: false,
  );

  @override
  List<MenuItemModel>? getThoseMenuItems(AppModel app) => [ /*menuItemAbout(app, SHOP_PAGE_ID, 'Shop')*/ ];

  menuItemAbout(AppModel app, pageID, text) => MenuItemModel(
      documentID: pageID,
      text: text,
      description: text,
      icon: IconModel(
          codePoint: Icons.info.codePoint, fontFamily: Icons.settings.fontFamily),
      action: GotoPage(app, pageID: pageID));

  @override
  List<NewAppTask>? getCreateTasks(
      AppModel app,
      NewAppWizardParameters parameters,
      MemberModel member,
      HomeMenuProvider homeMenuProvider,
      AppBarProvider appBarProvider,
      DrawerProvider leftDrawerProvider,
      DrawerProvider rightDrawerProvider,
      ) {
    if (parameters is ActionSpecificationParametersBase) {
      var ShopPageSpecifications = parameters.actionSpecifications;
      if (ShopPageSpecifications.shouldCreatePageDialogOrWorkflow()) {
        var memberId = member.documentID!;
        var tasks = <NewAppTask>[];

        tasks.add(() async {
          await ShopPageBuilder(
              app,
              memberId,
              homeMenuProvider(),
              appBarProvider(),
              leftDrawerProvider(),
              rightDrawerProvider())
              .create();
        });

        return tasks;
      }
    } else {
      throw Exception('Unexpected class for parameters: ' + parameters.toString());
    }
  }

  @override
  AppModel updateApp(NewAppWizardParameters parameters, AppModel adjustMe, ) => adjustMe;

  @override
  String? getPageID(String pageType) => null;

  @override
  ActionModel? getAction(AppModel app, String actionType) => null;
}
