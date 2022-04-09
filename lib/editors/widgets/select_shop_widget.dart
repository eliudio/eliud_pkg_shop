import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/shop_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_list_state.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

typedef void ShopSelected(ShopModel? shop);

class SelectShopWidget extends StatefulWidget {
  final AppModel app;
  final ShopModel? shop;
  final ShopSelected shopSelected;

  const SelectShopWidget(
      {Key? key,
      required this.app,
      required this.shop,
      required this.shopSelected,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectShopWidgetState();
}

class _SelectShopWidgetState extends State<SelectShopWidget> {
  @override
  Widget build(BuildContext context) {
    return topicContainer(
      widget.app,
      context,
      title: "Shop",
      collapsible: true,
      collapsed: true,
      children: [
        Center(
            child: text(widget.app, context,
                widget.shop != null ? widget.shop!.documentID ?? '?' : 'none')),
        Row(children: [
          Spacer(),
          button(widget.app, context, label: 'Select', onPressed: () {
            SelectShopDialog.openIt(
                context, widget.app, widget.shopSelected);
          }),
          Spacer(),
          button(widget.app, context, label: 'Clear', onPressed: () {
            widget.shopSelected(null);
          }),
          Spacer(),
        ]),
      ],
    );
  }
}

class SelectShopDialog extends StatefulWidget {
  final AppModel app;
  final ShopSelected shopSelected;

  SelectShopDialog._({
    required this.app,
    required this.shopSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectShopDialogState();
  }

  static void openIt(
    BuildContext context,
    AppModel app,
    ShopSelected ShopSelected,
  ) {
    openFlexibleDialog(app, context, app.documentID! + '/_selectShop',
        includeHeading: false,
        widthFraction: .8,
        child: SelectShopDialog._(app: app, shopSelected: ShopSelected,));
  }
}

class _SelectShopDialogState extends State<SelectShopDialog> {
  @override
  Widget build(BuildContext context) {
    var app = widget.app;
    var appId = app.documentID!;
    return MultiBlocProvider(
        providers: [
          BlocProvider<ShopListBloc>(
            create: (context) => ShopListBloc(
              shopRepository: shopRepository(appId: appId)!,
            )..add(LoadShopList()),
          ),
        ],
        child:ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
        HeaderWidget(
          app: widget.app,
          cancelAction: () async {
            return true;
          },
          title: 'Select shop',
        ),
        divider(widget.app, context),
        ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
          Container(
              height: height(),
              child: BlocBuilder<ShopListBloc, ShopListState>(
                  builder: (context, state) {
                    if ((state is ShopListLoaded) && (state.values != null)) {
                      var items = state.values!;
                      return ListView(children: [
                        Container(
                            height: 200,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: items.length,
                                itemBuilder: (context, position) {
                                  var item = items[position];
                                  return GestureDetector(
                                      child: ListTile(
                                          title: text(
                                              app, context, item!.documentID!)),
                                      onTap: () {
                                        widget.shopSelected(item);
                                        Navigator.pop(context);
                                      });
                                })),
                      ], shrinkWrap: true, physics: const ScrollPhysics());
                    } else {
                      return progressIndicator(app, context);
                    }
                  })),
      ])]));
  }

  double height() => 250; //(widget.widgetHeight / 2);
}


