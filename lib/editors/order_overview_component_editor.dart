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
import 'package:eliud_pkg_shop/editors/widgets/select_shop_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/order_overview_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

import 'bloc/order_overview_bloc.dart';

class OrderOverviewComponentEditorConstructor
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
        OrderOverviewModel(
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
    var orderOverview =
    await orderOverviewRepository(appId: app.documentID!)!.get(id);
    if (orderOverview != null) {
      _openIt(app, context, false, orderOverview, feedback);
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find notification dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      OrderOverviewModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID! + '/notificationdashboard',
      title: create
          ? 'Create Notification Dashboard'
          : 'Update Notification Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<OrderOverviewBloc>(
          create: (context) => OrderOverviewBloc(
            app.documentID!,
            /*create,
            */
            feedback,
          )..add(EditorBaseInitialise<OrderOverviewModel>(model)),
          child: OrderOverviewComponentEditor(
            app: app,
          )),
    );
  }
}

class OrderOverviewComponentEditor extends StatefulWidget {
  final AppModel app;

  const OrderOverviewComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _OrderOverviewComponentEditorState();
}

class _OrderOverviewComponentEditorState
    extends State<OrderOverviewComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
          if (accessState is AccessDetermined) {
            var member = accessState.getMember();
            if (member != null) {
              var memberId = member.documentID!;
              return BlocBuilder<OrderOverviewBloc, EditorBaseState<OrderOverviewModel>>(
                  builder: (ppContext, orderOverviewState) {
                    if (orderOverviewState is EditorBaseInitialised<OrderOverviewModel>) {
                      return ListView(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: [
                            HeaderWidget(
                              app: widget.app,
                              title: 'OrderOverview',
                              okAction: () async {
                                await BlocProvider.of<OrderOverviewBloc>(context)
                                    .save(EditorBaseApplyChanges<OrderOverviewModel>(
                                    model: orderOverviewState.model));
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
                                          orderOverviewState.model.documentID!)),
                                  getListTile(context, widget.app,
                                      leading: Icon(Icons.title),
                                      title: dialogField(
                                        widget.app,
                                        context,
                                        initialValue: orderOverviewState.model.title,
                                        valueChanged: (value) {
                                          orderOverviewState.model.title = value;
                                        },
                                        maxLines: 1,
                                        decoration: const InputDecoration(
                                          hintText: 'Title',
                                          labelText: 'Title',
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
                                      value: orderOverviewState.model.itemDetailBackground!,
                                      label: 'Item Detail Background'),
                                  BackgroundWidget(
                                      app: widget.app,
                                      memberId: memberId,
                                      value: orderOverviewState.model.itemImageBackground!,
                                      label: 'Item Image Background'),
                                ]),
                            SelectShopWidget(
                                app: widget.app,
                                shop: orderOverviewState.model.shop,
                                shopSelected: (shop) {
                                  setState(() {
                                    orderOverviewState.model.shop = shop;
                                  });
                                }),
                            topicContainer(widget.app, context,
                                title: 'Conditions',
                                collapsible: true,
                                collapsed: true,
                                children: [
                                  getListTile(context, widget.app,
                                      leading: Icon(Icons.security),
                                      title: ConditionsSimpleWidget(
                                        app: widget.app,
                                        value: orderOverviewState.model.conditions!,
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
