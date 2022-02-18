import 'package:eliud_core/core/wizards/registry/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';

class AboutPageWizard extends NewAppWizardInfoWithActionSpecification {
  static String ABOUT_PAGE_ID = 'about';

  AboutPageWizard() : super('about', 'About',  'Generate About Page');

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
  List<MenuItemModel>? getThoseMenuItems(AppModel app) => [ menuItemAbout(app, ABOUT_PAGE_ID, 'About') ];

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
      var aboutPageSpecifications = parameters.actionSpecifications;
      if (aboutPageSpecifications.shouldCreatePageDialogOrWorkflow()) {
        var memberId = member.documentID!;
        List<NewAppTask> tasks = [];
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
}
