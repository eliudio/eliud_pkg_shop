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

class SelectWidget<T> extends StatefulWidget {
  final AppModel app;
  final String title;
  final T? currentlySelected;
  final void Function (T? selected) selectedCallback;

  const SelectWidget(
      {Key? key,
      required this.app,
      required this.currentlySelected,
      required this.selectedCallback, required this.title,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  @override
  Widget build(BuildContext context) {
    return topicContainer(
      widget.app,
      context,
      title: widget.title,
      collapsible: true,
      collapsed: true,
      children: [
        Center(
            child: text(widget.app, context,
                widget.currentlySelected != null ? widget.currentlySelected!.documentID ?? '?' : 'none')),
        Row(children: [
          Spacer(),
          button(widget.app, context, label: 'Select', onPressed: () {
            SelectDialog.openIt(
                context, widget.app, widget.currentlySelected);
          }),
          Spacer(),
          button(widget.app, context, label: 'Clear', onPressed: () {
            widget.currentlySelected(null);
          }),
          Spacer(),
        ]),
      ],
    );
  }
}

class SelectDialog<T> extends StatefulWidget {
  final AppModel app;
  final void Function (T? selected)  selectedCallback;

  SelectDialog._({
    required this.app,
    required this.selectedCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectDialogState();
  }

  static void openIt<T>(
    BuildContext context,
    AppModel app,
      Function (T? selected) selectedCallback,
  ) {
    openFlexibleDialog(app, context, app.documentID! + '/_selectShop',
        includeHeading: false,
        widthFraction: .8,
        child: SelectDialog<T>._(app: app, selectedCallback: selectedCallback,));
  }
}

class _SelectDialogState extends State<SelectDialog> {
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
                                        widget.selectedCallback(item);
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


