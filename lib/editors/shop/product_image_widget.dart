import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_core/core/widgets/helper_widgets/platform_medium_widget.dart';
import 'package:eliud_pkg_shop_model/model/product_image_model.dart';
import 'package:flutter/material.dart';

typedef ProductImageModelCallback = void Function(
    ProductImageModel tutorialEntryModel);

class ProductImageModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  final ProductImageModel tutorialEntryModel;
  final ProductImageModelCallback tutorialEntryModelCallback;

  ProductImageModelWidget._({
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.tutorialEntryModel,
    required this.tutorialEntryModelCallback,
  });

  @override
  State<StatefulWidget> createState() {
    return _ProductImageModelWidgetState();
  }

  static Widget getIt(
      BuildContext context,
      AppModel app,
      bool create,
      double widgetWidth,
      double widgetHeight,
      ProductImageModel tutorialEntryModel,
      ProductImageModelCallback tutorialEntryModelCallback) {
    var copyOf = tutorialEntryModel.copyWith();
    return ProductImageModelWidget._(
      app: app,
      create: create,
      widgetWidth: widgetWidth,
      widgetHeight: widgetHeight,
      tutorialEntryModel: copyOf,
      tutorialEntryModelCallback: tutorialEntryModelCallback,
    );
  }
}

class _ProductImageModelWidgetState extends State<ProductImageModelWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        app: widget.app,
        cancelAction: () async {
          return true;
        },
        okAction: () async {
          widget.tutorialEntryModelCallback(widget.tutorialEntryModel);
          return true;
        },
        title: 'Fader image settings',
      ),
      divider(widget.app, context),
      topicContainer(widget.app, context,
          title: 'General',
          collapsible: true,
          collapsed: true,
          children: [
            getListTile(context, widget.app,
                leading: Icon(Icons.vpn_key),
                title: text(
                    widget.app, context, widget.tutorialEntryModel.documentID)),
          ]),
      if (widget.tutorialEntryModel.image != null)
        PlatformMediumWidget(
            app: widget.app,
            platformMediumModel: widget.tutorialEntryModel.image!)
    ]);
  }
}
