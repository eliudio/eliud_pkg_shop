import 'package:eliud_core_main/model/app_bar_model.dart';
import 'package:eliud_core_main/model/body_component_model.dart';
import 'package:eliud_core_main/model/page_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_main/wizards/builders/page_builder.dart';
import 'package:eliud_core_main/wizards/tools/document_identifier.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart'
    as mainrepo;
import 'package:eliud_pkg_fundamentals_model/model/presentation_model.dart';

abstract class AbstractBasicPageTemplate extends PageBuilder {
  final PrivilegeLevelRequiredSimple? privilegeLevelRequired;

  PresentationImageAlignment? presentationImageAlignment;

  String pageTitle();
  String pageDescription();

  String? componentID();
  String componentName();
  Future<void> setupComponent();

  AbstractBasicPageTemplate(
      super.uniqueId,
      super.pageId,
      super.app,
      super.memberId,
      super.theHomeMenu,
      super.theAppBar,
      super.leftDrawer,
      super.rightDrawer,
      {this.privilegeLevelRequired,
      this.presentationImageAlignment});

  Future<PageModel> _setupPage(AppBarModel appBar) async {
    return await mainrepo.AbstractRepositorySingleton.singleton
        .pageRepository(app.documentID)!
        .add(_page(appBar));
  }

  PageModel _page(AppBarModel appBar) {
    var components = <BodyComponentModel>[];
    components.add(BodyComponentModel(
        documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageId),
        componentId: componentID(),
        componentName: componentName()));

    return PageModel(
        documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageId),
        appId: app.documentID,
        title: pageTitle(),
        description: pageDescription(),
        drawer: leftDrawer,
        endDrawer: rightDrawer,
        appBar: appBar,
        homeMenu: theHomeMenu,
        layout: PageLayout.listView,
        conditions: StorageConditionsModel(
          privilegeLevelRequired: privilegeLevelRequired,
        ),
        bodyComponents: components);
  }

  Future<PageModel> create() async {
    await setupComponent();
    return await _setupPage(theAppBar);
  }
}
