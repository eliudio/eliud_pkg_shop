import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/editor/select_action_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_medium/editors/widgets/background_widget.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

class CartComponentEditorConstructor
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
        CartModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var cart =
        await cartRepository(appId: app.documentID!)!.get(id);
    if (cart != null) {
      _openIt(app, context, false, cart, feedback);
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find notification dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      CartModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID! + '/notificationdashboard',
      title: create
          ? 'Create Notification Dashboard'
          : 'Update Notification Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<CartBloc>(
          create: (context) => CartBloc(
                app.documentID!,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<CartModel>(model)),
          child: CartComponentEditor(
            app: app,
          )),
    );
  }
}

class CartBloc
    extends EditorBaseBloc<CartModel> {

  CartBloc(String appId, EditorFeedback feedback)
      : super(appId, cartRepository(appId: appId)!, feedback);

  @override
  CartModel newInstance(StorageConditionsModel conditions) {
    return CartModel(
        appId: appId,
        documentID: newRandomKey(), 
        conditions: conditions);
  }

  @override
  CartModel setDefaultConditions(
      CartModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        conditions: t.conditions ??
            StorageConditionsModel(
                privilegeLevelRequired:
                PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple));
  }
}

class CartComponentEditor extends StatefulWidget {
  final AppModel app;

  const CartComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _CartComponentEditorState();
}

class _CartComponentEditorState
    extends State<CartComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        var member = accessState.getMember();
        if (member != null) {
          var memberId = member.documentID!;
          return BlocBuilder<CartBloc, EditorBaseState<CartModel>>(
              builder: (ppContext, cartState) {
                if (cartState is EditorBaseInitialised<CartModel>) {
                  return ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        HeaderWidget(
                          app: widget.app,
                          title: 'Cart',
                          okAction: () async {
                            await BlocProvider.of<CartBloc>(context)
                                .save(EditorBaseApplyChanges<CartModel>(
                                model: cartState.model));
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
                                      cartState.model.documentID!)),
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.description),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: cartState.model.description,
                                    valueChanged: (value) {
                                      cartState.model.description = value;
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      hintText: 'Description',
                                      labelText: 'Description',
                                    ),
                                  )),
                            ]),
                        topicContainer(widget.app, context,
                            title: 'Text',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.title),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: cartState.model.title,
                                    valueChanged: (value) {
                                      cartState.model.title = value;
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      hintText: 'Title',
                                      labelText: 'Title',
                                    ),
                                  )),
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.description),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: cartState.model.checkoutText,
                                    valueChanged: (value) {
                                      cartState.model.checkoutText = value;
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      hintText: 'Checkout Text',
                                      labelText: 'Checkout Text',
                                    ),
                                  )),
                            ]),
                        topicContainer(widget.app, context,
                            title: 'Background',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              BackgroundWidget(
                                  app: widget.app,
                                  memberId: memberId,
                                  value: cartState.model.itemDetailBackground!,
                                  label: 'Item Detail Background'),
                              BackgroundWidget(
                                  app: widget.app,
                                  memberId: memberId,
                                  value: cartState.model.itemImageBackground!,
                                  label: 'Item Image Background'),
                            ]),
                        topicContainer(widget.app, context,
                            title: 'General',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.vpn_key),
                                  title: text(widget.app, context,
                                      cartState.model.documentID!)),
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.description),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: cartState.model.description,
                                    valueChanged: (value) {
                                      cartState.model.description = value;
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      hintText: 'Description',
                                      labelText: 'Description',
                                    ),
                                  )),
                            ]),
                        topicContainer(widget.app, context,
                            title: 'Actions',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              SelectActionWidget(
                                  app: widget.app,
                                  action: cartState.model.backToShopAction,
                                  label: 'Back To Shop',
                                  containerPrivilege: ((cartState.model.conditions != null) && (cartState.model.conditions!.privilegeLevelRequired != null)) ? cartState.model.conditions!.privilegeLevelRequired!.index : 0,
                                  actionSelected: (action) {
                                    setState(() {
                                      cartState.model.backToShopAction = action;
                                    });
                                  }),
                              SelectActionWidget(
                                  app: widget.app,
                                  action: cartState.model.checkoutAction,
                                  label: 'Checkout Action',
                                  containerPrivilege: ((cartState.model.conditions != null) && (cartState.model.conditions!.privilegeLevelRequired != null)) ? cartState.model.conditions!.privilegeLevelRequired!.index : 0,
                                  actionSelected: (action) {
                                    setState(() {
                                      cartState.model.checkoutAction = action;
                                    });
                                  }),
                              SelectActionWidget(
                                  app: widget.app,
                                  action: cartState.model.openProductAction,
                                  label: 'Open Product',
                                  containerPrivilege: ((cartState.model.conditions != null) && (cartState.model.conditions!.privilegeLevelRequired != null)) ? cartState.model.conditions!.privilegeLevelRequired!.index : 0,
                                  actionSelected: (action) {
                                    setState(() {
                                      cartState.model.openProductAction = action;
                                    });
                                  }),
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
                                    value: cartState.model.conditions!,
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
