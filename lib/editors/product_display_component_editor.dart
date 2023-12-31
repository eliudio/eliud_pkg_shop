import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core/core/widgets/background_widget.dart';
import 'package:eliud_core/core/widgets/helper_widgets/condition_simple_widget.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_pkg_shop/editors/widgets/select_shop_widget.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/product_display_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_state.dart';

import 'package:eliud_pkg_shop_model/model/product_display_entity.dart';

class ProductDisplayComponentEditorConstructor
    extends ComponentEditorConstructor {
  @override
  void updateComponent(
      AppModel app, BuildContext context, model, EditorFeedback feedback) {
    _openIt(app, context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(
      AppModel app, BuildContext context, EditorFeedback feedback) {
    _openIt(
        app,
        context,
        true,
        ProductDisplayModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New Product Display',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var productDisplay =
        await productDisplayRepository(appId: app.documentID)!.get(id);
    if (productDisplay != null) {
      _openIt(app, context, false, productDisplay, feedback);
    } else {
      openErrorDialog(app, context, '${app.documentID}/_error',
          title: 'Error',
          errorMessage: 'Cannot find notification dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      ProductDisplayModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      '${app.documentID}/notificationdashboard',
      title: create
          ? 'Create Notification Dashboard'
          : 'Update Notification Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<ProductDisplayBloc>(
          create: (context) => ProductDisplayBloc(
                app.documentID,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<ProductDisplayModel>(model)),
          child: ProductDisplayComponentEditor(
            app: app,
          )),
    );
  }

  @override
  Future<ProductDisplayEntity> revalidateEntity(AppModel app, entity) async {
    if (entity != null) {
      var myEntity = entity as ProductDisplayEntity;
      var newEntity = myEntity.copyWith(
        buyAction: myEntity.buyAction != null
            ? myEntity.buyAction!.copyWith(appId: app.documentID)
            : null,
      );
      return newEntity;
    } else {
      return entity;
    }
  }
}

class ProductDisplayBloc
    extends EditorBaseBloc<ProductDisplayModel, ProductDisplayEntity> {
  ProductDisplayBloc(String appId, EditorFeedback feedback)
      : super(appId, productDisplayRepository(appId: appId)!, feedback);

  @override
  ProductDisplayModel newInstance(StorageConditionsModel conditions) {
    return ProductDisplayModel(
        appId: appId,
        itemDetailBackground: BackgroundModel(),
        description: 'New Product Display',
        documentID: newRandomKey(),
        conditions: conditions);
  }

  @override
  ProductDisplayModel setDefaultValues(
      ProductDisplayModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        itemDetailBackground: t.itemDetailBackground ?? BackgroundModel(),
        conditions: t.conditions ?? conditions);
  }
}

class ProductDisplayComponentEditor extends StatefulWidget {
  final AppModel app;

  const ProductDisplayComponentEditor({
    super.key,
    required this.app,
  });

  @override
  State<StatefulWidget> createState() => _ProductDisplayComponentEditorState();
}

class _ProductDisplayComponentEditorState
    extends State<ProductDisplayComponentEditor> {
  @override
  Widget build(BuildContext context) {
    var ownerId = AccessBloc.member(context)!.documentID;
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        var member = accessState.getMember();
        if (member != null) {
          var memberId = member.documentID;
          return BlocBuilder<ProductDisplayBloc,
                  EditorBaseState<ProductDisplayModel>>(
              builder: (ppContext, productDisplayState) {
            if (productDisplayState
                is EditorBaseInitialised<ProductDisplayModel>) {
              return ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    HeaderWidget(
                      app: widget.app,
                      title: 'ProductDisplay',
                      okAction: () async {
                        await BlocProvider.of<ProductDisplayBloc>(context).save(
                            EditorBaseApplyChanges<ProductDisplayModel>(
                                model: productDisplayState.model));
                        return true;
                      },
                      cancelAction: () async {
                        return true;
                      },
                    ),
                    topicContainer(widget.app, context,
                        title: 'General',
                        collapsible: true,
                        collapsed: true,
                        children: [
                          getListTile(context, widget.app,
                              leading: Icon(Icons.vpn_key),
                              title: text(widget.app, context,
                                  productDisplayState.model.documentID)),
                          getListTile(context, widget.app,
                              leading: Icon(Icons.description),
                              title: dialogField(
                                widget.app,
                                context,
                                initialValue:
                                    productDisplayState.model.description,
                                valueChanged: (value) {
                                  productDisplayState.model.description = value;
                                },
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  hintText: 'Description',
                                  labelText: 'Description',
                                ),
                              )),
                        ]),
                    selectShopWidget(
                        context,
                        widget.app,
                        productDisplayState.model.conditions,
                        productDisplayState.model.shop,
                        (shop) => setState(() {
                              productDisplayState.model.shop = shop;
                            })),
                    topicContainer(widget.app, context,
                        title: 'Background',
                        collapsible: true,
                        collapsed: true,
                        children: [
                          checkboxListTile(widget.app, context, 'Background?',
                              productDisplayState.model.background != null,
                              (value) {
                            setState(() {
                              if (value!) {
                                productDisplayState.model.background =
                                    BackgroundModel();
                              } else {
                                productDisplayState.model.background = null;
                              }
                            });
                          }),
                          if (productDisplayState.model.background != null)
                            BackgroundWidget(
                                app: widget.app,
                                memberId: ownerId,
                                value: productDisplayState.model.background!,
                                label: 'Background'),
                        ]),
                    topicContainer(widget.app, context,
                        title: 'Background / Layout',
                        collapsible: true,
                        collapsed: true,
                        children: [
                          getListTile(context, widget.app,
                              leading: Icon(Icons.description),
                              title: dialogField(
                                widget.app,
                                context,
                                initialValue:
                                    productDisplayState.model.addToBasketText,
                                valueChanged: (value) {
                                  productDisplayState.model.addToBasketText =
                                      value;
                                },
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  hintText: 'Add To Basket Text',
                                  labelText: 'Add To Basket Text',
                                ),
                              )),
                          BackgroundWidget(
                              app: widget.app,
                              memberId: memberId,
                              value: productDisplayState
                                  .model.itemDetailBackground!,
                              label: 'Item Detail Background'),
                        ]),
                    topicContainer(widget.app, context,
                        title: 'Actions',
                        collapsible: true,
                        collapsed: true,
                        children: [
                          Apis.apis().getRegistryApi().openSelectActionWidget(
                              app: widget.app,
                              action: productDisplayState.model.buyAction,
                              label: 'Buy Action',
                              containerPrivilege:
                                  ((productDisplayState.model.conditions !=
                                              null) &&
                                          (productDisplayState.model.conditions!
                                                  .privilegeLevelRequired !=
                                              null))
                                      ? productDisplayState.model.conditions!
                                          .privilegeLevelRequired!.index
                                      : 0,
                              actionSelected: (action) {
                                setState(() {
                                  productDisplayState.model.buyAction = action;
                                });
                              }),
                        ]),
                    topicContainer(widget.app, context,
                        title: 'Condition',
                        collapsible: true,
                        collapsed: true,
                        children: [
                          getListTile(context, widget.app,
                              leading: Icon(Icons.security),
                              title: ConditionsSimpleWidget(
                                app: widget.app,
                                value: productDisplayState.model.conditions!,
                              )),
                        ]),
                  ]);
            } else {
              return progressIndicator(widget.app, context);
            }
          });
        } else {
          return progressIndicator(widget.app, context);
        }
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }
}
