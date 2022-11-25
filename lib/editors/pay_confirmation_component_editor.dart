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
import 'package:eliud_pkg_shop/editors/widgets/select_shop_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

import '../model/pay_confirmation_entity.dart';

class PayConfirmationComponentEditorConstructor
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
        PayConfirmationModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New Pay Confirmation',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var payConfirmation =
        await payConfirmationRepository(appId: app.documentID)!.get(id);
    if (payConfirmation != null) {
      _openIt(app, context, false, payConfirmation, feedback);
    } else {
      openErrorDialog(app, context, app.documentID + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find notification dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      PayConfirmationModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/notificationdashboard',
      title: create
          ? 'Create Notification Dashboard'
          : 'Update Notification Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<PayConfirmationBloc>(
          create: (context) => PayConfirmationBloc(
                app.documentID,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<PayConfirmationModel>(model)),
          child: PayConfirmationComponentEditor(
            app: app,
          )),
    );
  }

  @override
  Future<PayConfirmationEntity> revalidateEntity(AppModel app, entity) async {
    if (entity != null) {
      var myEntiy = entity as PayConfirmationEntity;
      var newEntity = myEntiy.copyWith(
        backToShopAction: myEntiy.backToShopAction != null? myEntiy.backToShopAction!.copyWith(appId: app.documentID) : null,
      );
      return newEntity;
    } else {
      return entity;
    }
  }
}

class PayConfirmationBloc
    extends EditorBaseBloc<PayConfirmationModel, PayConfirmationEntity> {

  PayConfirmationBloc(String appId, EditorFeedback feedback)
      : super(appId, payConfirmationRepository(appId: appId)!, feedback);

  @override
  PayConfirmationModel newInstance(StorageConditionsModel conditions) {
    return PayConfirmationModel(
        appId: appId,
        description: 'New Pay Confirmation',
        documentID: newRandomKey(),
        conditions: conditions);
  }

  @override
  PayConfirmationModel setDefaultValues(
      PayConfirmationModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        conditions: t.conditions ?? conditions);
  }
}

class PayConfirmationComponentEditor extends StatefulWidget {
  final AppModel app;

  const PayConfirmationComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _PayConfirmationComponentEditorState();
}

class _PayConfirmationComponentEditorState
    extends State<PayConfirmationComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        var member = accessState.getMember();
        if (member != null) {
          var memberId = member.documentID;
          return BlocBuilder<PayConfirmationBloc,
              EditorBaseState<PayConfirmationModel>>(
              builder: (ppContext, payConfirmationState) {
                if (payConfirmationState is EditorBaseInitialised<
                    PayConfirmationModel>) {
                  return ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        HeaderWidget(
                          app: widget.app,
                          title: 'PayConfirmation',
                          okAction: () async {
                            await BlocProvider.of<PayConfirmationBloc>(context)
                                .save(
                                EditorBaseApplyChanges<PayConfirmationModel>(
                                    model: payConfirmationState.model));
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
                                      payConfirmationState.model.documentID)),
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.description),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: payConfirmationState.model
                                        .description,
                                    valueChanged: (value) {
                                      payConfirmationState.model.description = value;
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
                            payConfirmationState.model.conditions,
                            payConfirmationState.model.shop,
                                (shop) =>
                                setState(() {
                                  payConfirmationState.model.shop = shop;
                                })),
                        topicContainer(widget.app, context,
                            title: 'Actions',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              Registry.registry()!.openSelectActionWidget(
                                  app: widget.app,
                                  action: payConfirmationState.model.backToShopAction,
                                  label: 'Back to shop action',
                                  containerPrivilege:
                                  ((payConfirmationState.model.conditions != null) &&
                                      (payConfirmationState.model.conditions!
                                          .privilegeLevelRequired !=
                                          null))
                                      ? payConfirmationState.model.conditions!
                                      .privilegeLevelRequired!.index
                                      : 0,
                                  actionSelected: (action) {
                                    setState(() {
                                      payConfirmationState.model.backToShopAction =
                                          action;
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
                                    value: payConfirmationState.model
                                        .conditions!,
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
