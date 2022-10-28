import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/edge_insets_geometry_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/helpers/parse_helper.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/background_widget.dart';
import 'package:eliud_core/tools/widgets/background_widgets/edge_insets_geometry_widget.dart';
import 'package:eliud_core/tools/widgets/background_widgets/style_color_widget.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_shop/editors/widgets/scroll_direction_widget.dart';
import 'package:eliud_pkg_shop/editors/widgets/select_shop_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

import 'bloc/shop_front_bloc.dart';

class ShopFrontComponentEditorConstructor extends ComponentEditorConstructor {
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
        ShopFrontModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New Shop Front',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var shopFront = await shopFrontRepository(appId: app.documentID)!.get(id);
    if (shopFront != null) {
      _openIt(app, context, false, shopFront, feedback);
    } else {
      openErrorDialog(app, context, app.documentID + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find notification dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      ShopFrontModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/notificationdashboard',
      title: create
          ? 'Create Notification Dashboard'
          : 'Update Notification Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<ShopFrontBloc>(
          create: (context) => ShopFrontBloc(
                app.documentID,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<ShopFrontModel>(model)),
          child: ShopFrontComponentEditor(
            app: app,
          )),
    );
  }

  @override
  Future<ShopFrontModel> revalidateModel(AppModel app, model) async {
    if (model != null) {
      var myModel = model as ShopFrontModel;
      var newModel = myModel.copyWith(
        buyAction: myModel.buyAction != null ? myModel
            .buyAction!.copyWith(app) : null,
        openProductAction: myModel.openProductAction != null ? myModel
            .openProductAction!.copyWith(app) : null,
      );
      return newModel;
    } else {
      return model;
    }
  }
}

class ShopFrontComponentEditor extends StatefulWidget {
  final AppModel app;

  const ShopFrontComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShopFrontComponentEditorState();
}

class _ShopFrontComponentEditorState extends State<ShopFrontComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        var member = accessState.getMember();
        if (member != null) {
          var memberId = member.documentID;
          return BlocBuilder<ShopFrontBloc, EditorBaseState<ShopFrontModel>>(
              builder: (ppContext, shopFrontState) {
            if (shopFrontState is EditorBaseInitialised<ShopFrontModel>) {
              return ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    HeaderWidget(
                      app: widget.app,
                      title: 'ShopFront',
                      okAction: () async {
                        await BlocProvider.of<ShopFrontBloc>(context).save(
                            EditorBaseApplyChanges<ShopFrontModel>(
                                model: shopFrontState.model));
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
                                  shopFrontState.model.documentID)),
                          getListTile(context, widget.app,
                              leading: Icon(Icons.description),
                              title: dialogField(
                                widget.app,
                                context,
                                initialValue: shopFrontState.model.description,
                                valueChanged: (value) {
                                  shopFrontState.model.description = value;
                                },
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  hintText: 'Description',
                                  labelText: 'Description',
                                ),
                              )),
                          getListTile(context, widget.app,
                              leading: Icon(Icons.title),
                              title: dialogField(
                                widget.app,
                                context,
                                initialValue: shopFrontState.model.title,
                                valueChanged: (value) {
                                  shopFrontState.model.title = value;
                                },
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  hintText: 'Title',
                                  labelText: 'Title',
                                ),
                              )),
                        ]),
                    topicContainer(widget.app, context,
                        title: 'Actions',
                        collapsible: true,
                        collapsed: true,
                        children: [
                          Registry.registry()!.openSelectActionWidget(
                              app: widget.app,
                              action: shopFrontState.model.buyAction,
                              label: 'Buy Product',
                              containerPrivilege:
                                  ((shopFrontState.model.conditions != null) &&
                                          (shopFrontState.model.conditions!
                                                  .privilegeLevelRequired !=
                                              null))
                                      ? shopFrontState.model.conditions!
                                          .privilegeLevelRequired!.index
                                      : 0,
                              actionSelected: (action) {
                                setState(() {
                                  shopFrontState.model.openProductAction =
                                      action;
                                });
                              }),
                          Registry.registry()!.openSelectActionWidget(
                              app: widget.app,
                              action: shopFrontState.model.openProductAction,
                              label: 'Open Product',
                              containerPrivilege:
                                  ((shopFrontState.model.conditions != null) &&
                                          (shopFrontState.model.conditions!
                                                  .privilegeLevelRequired !=
                                              null))
                                      ? shopFrontState.model.conditions!
                                          .privilegeLevelRequired!.index
                                      : 0,
                              actionSelected: (action) {
                                setState(() {
                                  shopFrontState.model.openProductAction =
                                      action;
                                });
                              }),
                        ]),
                    selectShopWidget(
                        context,
                        widget.app,
                        shopFrontState.model.conditions,
                        shopFrontState.model.shop,
                        (shop) => setState(() {
                              shopFrontState.model.shop = shop;
                            })),
                    topicContainer(widget.app, context,
                        title: 'Layout, colours and backgrounds',
                        collapsible: true,
                        collapsed: true,
                        children: [
                          topicContainer(widget.app, context,
                              title: 'Card parameters',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue:
                                          shopFrontState.model.size.toString(),
                                      valueChanged: (value) {
                                        shopFrontState.model.size =
                                            double_parse(value);
                                      },
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'Card size',
                                        labelText: 'Card size',
                                      ),
                                    )),
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: shopFrontState
                                          .model.cardElevation
                                          .toString(),
                                      valueChanged: (value) {
                                        shopFrontState.model.cardElevation =
                                            double_parse(value);
                                      },
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'Card Elevation',
                                        labelText: 'Card Elevation',
                                      ),
                                    )),
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: shopFrontState
                                          .model.cardAxisSpacing
                                          .toString(),
                                      valueChanged: (value) {
                                        shopFrontState.model.cardAxisSpacing =
                                            double_parse(value);
                                      },
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'Card Axis Spacing',
                                        labelText: 'Card Axis Spacing',
                                      ),
                                    )),
                              ]),
                          topicContainer(widget.app, context,
                              title: 'Card Padding',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                checkboxListTile(widget.app, context, 'With padding',
                                    shopFrontState.model.padding != null, (value) {
                                      setState(() {
                                        if (value!) {
                                          shopFrontState.model.padding = EdgeInsetsGeometryModel(left: 0, right: 0, top: 0, bottom: 0);
                                        } else {
                                          shopFrontState.model.padding = null;
                                        }
                                      });
                                    }),
                                if (shopFrontState.model.padding != null) EdgeInsetsGeometryWidget(app: widget.app, edgeInsetsGeometryModel: shopFrontState.model.padding!, )
                              ]),
                          StyleColorWidget(
                              app: widget.app,
                              value: shopFrontState.model.addToCartColor!,
                              label: 'Add-to-cart colour'),
                          topicContainer(widget.app, context,
                              title: 'Item Card Background',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                checkboxListTile(
                                    widget.app,
                                    context,
                                    'Item Card Background?',
                                    shopFrontState.model.itemCardBackground !=
                                        null, (value) {
                                  setState(() {
                                    if (value!) {
                                      shopFrontState.model.itemCardBackground =
                                          BackgroundModel();
                                    } else {
                                      shopFrontState.model.itemCardBackground =
                                          null;
                                    }
                                  });
                                }),
                                if (shopFrontState.model.itemCardBackground !=
                                    null)
                                  BackgroundWidget(
                                      app: widget.app,
                                      memberId: memberId,
                                      value: shopFrontState
                                          .model.itemCardBackground!,
                                      label: 'Item Card Background'),
                              ]),
                          topicContainer(widget.app, context,
                              title: 'Scroll direction',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                ScrollDirectionWidget(
                                    app: widget.app,
                                    scrollDirectionCallback:
                                        (ScrollDirection scrollDirection) {
                                      shopFrontState.model.scrollDirection =
                                          scrollDirection;
                                    },
                                    scrollDirection:
                                        shopFrontState.model.scrollDirection ??
                                            ScrollDirection.Horizontal),
                              ]),
                        ]),
                    topicContainer(widget.app, context,
                        title: 'Conditions',
                        collapsible: true,
                        collapsed: true,
                        children: [
                          getListTile(context, widget.app,
                              leading: Icon(Icons.security),
                              title: ConditionsSimpleWidget(
                                app: widget.app,
                                value: shopFrontState.model.conditions!,
                              )),
                        ]),
                  ]);
            } else {
              return progressIndicator(widget.app, context);
            }
          });
        } else {
          return text(widget.app, context, 'Member should be logged');
        }
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }
}
