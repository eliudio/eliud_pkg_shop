import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart'
    as corerepo;
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';

abstract class AbstractPageTemplate extends PageBuilder {
  final PrivilegeLevelRequiredSimple? privilegeLevelRequired;
  final String? packageCondition;
  final ConditionOverride? conditionOverride;

  PresentationImageAlignment? presentationImageAlignment;

  String pageTitle();

/*
  String assetLocation();

*/
  String? componentID();
  String componentName();
  Future<void> setupComponent();

  AbstractPageTemplate(
    String uniqueId,
    String pageId,
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
     {
    this.privilegeLevelRequired,
    this.packageCondition,
    this.conditionOverride,
  }) : super(uniqueId, pageId, app, memberId, theHomeMenu, theAppBar, leftDrawer,
            rightDrawer, );

  Future<PageModel> _setupPage(
      AppBarModel appBar, String? presentationId) async {
    return await corerepo.AbstractRepositorySingleton.singleton
        .pageRepository(app.documentID)!
        .add(_page(appBar, presentationId));
  }

  PageModel _page(AppBarModel appBar, String? presentationId) {
    var components = <BodyComponentModel>[];
    components.add(BodyComponentModel(
        documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageId),
        componentId: presentationId,
        componentName: AbstractPresentationComponent.componentName));

    return PageModel(
        documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageId),
        appId: app.documentID,
        title: pageTitle(),
        drawer: leftDrawer,
        endDrawer: rightDrawer,
        appBar: appBar,
        homeMenu: theHomeMenu,
        layout: PageLayout.ListView,
        conditions: StorageConditionsModel(
          privilegeLevelRequired: privilegeLevelRequired,
        ),
        bodyComponents: components);
  }

  PresentationModel _presentation(PlatformMediumModel? image) {
    return PresentationModel(
      documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageId),
      appId: app.documentID,
      bodyComponents: [
        BodyComponentModel(
            documentID: newRandomKey(),
            componentId: componentID(),
            componentName: componentName())
      ],
      image: image,
      imagePositionRelative: PresentationRelativeImagePosition.Aside,
      imageAlignment: presentationImageAlignment ?? PresentationImageAlignment.Right,
      imageWidth: .40,
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  Future<PresentationModel> _setupPresentation(
      PlatformMediumModel? image) async {
    var presentation = _presentation(image);
    await AbstractRepositorySingleton.singleton
        .presentationRepository(app.documentID)!
        .add(presentation);
    return presentation;
  }

/*
  Future<PlatformMediumModel> uploadImage() async {
    return await ImageTools.uploadPlatformPhoto(app, memberId, assetLocation(),
        PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple);
  }

*/
  Future<PageModel> create(PlatformMediumModel? image) async {
    var presentationModelId;
    presentationModelId = (await _setupPresentation(image)).documentID;
    await setupComponent();
    return await _setupPage(theAppBar, presentationModelId);
  }
}
