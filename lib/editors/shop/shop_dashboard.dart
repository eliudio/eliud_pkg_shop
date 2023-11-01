import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_shop/editors/shop/product_dashboard.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shop_bloc/shop_dashboard_bloc.dart';
import 'shop_bloc/shop_dashboard_event.dart';
import 'shop_bloc/shop_dashboard_state.dart';

class ShopDashboard {
  static void updateShop(AppModel app, BuildContext context, model) {
    _openIt(app, context, false, model.copyWith());
  }

  static void deleteShop(AppModel app, BuildContext context, model) {
    // ask for confirmation. Very dangerous
  }

  static void addShop(AppModel app, BuildContext context) {
    _openIt(
      app,
      context,
      true,
      ShopModel(
        appId: app.documentID,
        documentID: newRandomKey(),
      ),
    );
  }

  static void _openIt(
      AppModel app, BuildContext context, bool create, ShopModel model) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/shop',
      title: create ? 'Create Shop' : 'Update Shop',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<ShopDashboardBloc>(
          create: (context) => ShopDashboardBloc(
                app.documentID,
                (_, __) {},
              )..add(ShopDashboardInitialise(model)),
          child: ShopDashboardWidget(
            app: app,
          )),
    );
  }
}

class ShopDashboardWidget extends StatefulWidget {
  final AppModel app;

  const ShopDashboardWidget({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShopDashboardWidgetState();
}

class _ShopDashboardWidgetState extends State<ShopDashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<ShopDashboardBloc, ShopDashboardBaseState>(
            builder: (ppContext, shopState) {
          if (shopState is ShopDashboardInitialised) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Shop',
                    okAction: () async {
                      await BlocProvider.of<ShopDashboardBloc>(context).save(
                          ShopDashboardApplyChanges(model: shopState.shop));
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
                                shopState.shop.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: shopState.shop.shortDescription,
                              valueChanged: (value) {
                                shopState.shop.shortDescription = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Short Description',
                                labelText: 'Short Description',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: shopState.shop.currency,
                              valueChanged: (value) {
                                shopState.shop.currency = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Currency',
                                labelText: 'Currency',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: shopState.shop.description,
                              valueChanged: (value) {
                                shopState.shop.description = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Products',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _products(shopState),
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
                              readOnly: false,
                              value: shopState.shop.conditions ?? StorageConditionsModel(
                                  privilegeLevelRequired:
                                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
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
    });
  }

  Widget _products(ShopDashboardInitialised state) {
    var items = state.values != null ? state.values! : [];
    return Container(
      height: 150,
      child: ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
        Container(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                //separatorBuilder: (context, index) => divider(widget.app, context),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final value = items[index];
                  return getListTile(
                    context,
                    widget.app,
                    title: text(widget.app, context, (value.title ?? '?')),
                    trailing: popupMenuButton<int>(widget.app, context,
                        child: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                              popupMenuItem(
                                widget.app,
                                context,
                                value: 1,
                                label: 'Update',
                              ),
                              popupMenuItem(
                                widget.app,
                                context,
                                value: 2,
                                label: 'Delete',
                              ),
                            ],
                        onSelected: (selectedValue) {
                          if (selectedValue == 1) {
                            ProductDashboard.updateProduct(
                                widget.app, context, state.shop, value);
                          } else if (selectedValue == 2) {
                            productRepository(appId: widget.app.documentID)!
                                .delete(value);
                          }
                        }),
                  );
                })),
        divider(
          widget.app,
          context,
        ),
        Row(children: [
          Spacer(),
          button(
            widget.app,
            context,
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
            onPressed: () {
              ProductDashboard.createNewProduct(
                widget.app,
                context,
                state.shop,
              );
            },
          ),
          Spacer(),
        ])
      ]),
    );
  }
}
