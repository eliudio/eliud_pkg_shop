import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/registry.dart';
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
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_notifications/model/notification_dashboard_model.dart';
import 'package:eliud_pkg_shop/editors/widgets/select_shop_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

import '../model/pay_entity.dart';

class PayComponentEditorConstructor extends ComponentEditorConstructor {
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
        PayModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New payment',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var pay = await payRepository(appId: app.documentID)!.get(id);
    if (pay != null) {
      _openIt(app, context, false, pay, feedback);
    } else {
      openErrorDialog(app, context, app.documentID + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find notification dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create, PayModel model,
      EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/notificationdashboard',
      title: create
          ? 'Create Notification Dashboard'
          : 'Update Notification Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<PayBloc>(
          create: (context) => PayBloc(
                app.documentID,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<PayModel>(model)),
          child: PayComponentEditor(
            app: app,
          )),
    );
  }

  @override
  Future<PayEntity> revalidateEntity(AppModel app, entity) async {
    if (entity != null) {
      var myEntity = entity as PayEntity;
      var newEntity = myEntity.copyWith(
        succeeded:
          myEntity.succeeded == null ? myEntity.succeeded!.copyWith(appId: app.documentID) : null,
        payAction:
          myEntity.payAction == null ? myEntity.payAction!.copyWith(appId: app.documentID) : null,
      );
      return newEntity;
    } else {
      return entity;
    }
  }
}

class PayBloc extends EditorBaseBloc<PayModel, PayEntity> {
  PayBloc(String appId, EditorFeedback feedback)
      : super(appId, payRepository(appId: appId)!, feedback);

  @override
  PayModel newInstance(StorageConditionsModel conditions) {
    return PayModel(
        appId: appId,
        documentID: newRandomKey(),
        description: 'New payment',
        conditions: conditions);
  }

  @override
  PayModel setDefaultValues(PayModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}

class PayComponentEditor extends StatefulWidget {
  final AppModel app;

  const PayComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PayComponentEditorState();
}

class _PayComponentEditorState extends State<PayComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        var member = accessState.getMember();
        if (member != null) {
          var memberId = member.documentID;
          return BlocBuilder<PayBloc, EditorBaseState<PayModel>>(
              builder: (ppContext, payState) {
            if (payState is EditorBaseInitialised<PayModel>) {
              return ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    HeaderWidget(
                      app: widget.app,
                      title: 'Pay',
                      okAction: () async {
                        await BlocProvider.of<PayBloc>(context).save(
                            EditorBaseApplyChanges<PayModel>(
                                model: payState.model));
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
                                  payState.model.documentID)),
                          getListTile(context, widget.app,
                              leading: Icon(Icons.description),
                              title: dialogField(
                                widget.app,
                                context,
                                initialValue: payState.model.description,
                                valueChanged: (value) {
                                  payState.model.description = value;
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
                        payState.model.conditions,
                        payState.model.shop,
                        (shop) => setState(() {
                              payState.model.shop = shop;
                            })),
                    Registry.registry()!.openSelectActionWidget(
                        app: widget.app,
                        action: payState.model.payAction,
                        label: 'Pay Action',
                        containerPrivilege:
                            ((payState.model.conditions != null) &&
                                    (payState.model.conditions!
                                            .privilegeLevelRequired !=
                                        null))
                                ? payState.model.conditions!
                                    .privilegeLevelRequired!.index
                                : 0,
                        actionSelected: (action) {
                          setState(() {
                            payState.model.payAction = action;
                          });
                        }),
                    topicContainer(widget.app, context,
                        title: 'Condition',
                        collapsible: true,
                        collapsed: true,
                        children: [
                          getListTile(context, widget.app,
                              leading: Icon(Icons.security),
                              title: ConditionsSimpleWidget(
                                app: widget.app,
                                value: payState.model.conditions!,
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
