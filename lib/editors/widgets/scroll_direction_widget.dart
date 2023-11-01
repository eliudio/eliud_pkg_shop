import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef ScrollDirectionCallback = Function(
    ScrollDirection scrollDirection);

class ScrollDirectionWidget extends StatefulWidget {
  ScrollDirectionCallback scrollDirectionCallback;
  final ScrollDirection scrollDirection;
  final AppModel app;
  ScrollDirectionWidget(
      {Key? key,
      required this.app,
      required this.scrollDirectionCallback,
      required this.scrollDirection})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScrollDirectionWidgetState();
  }
}

class _ScrollDirectionWidgetState extends State<ScrollDirectionWidget> {
  int? _widthTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _widthTypeSelectedRadioTile = widget.scrollDirection.index;
  }

  String widthtTypePortraitStringValue(ScrollDirection? scrollDirection) {
    switch (scrollDirection) {
      case ScrollDirection.Vertical:
        return 'Vertical';
      case ScrollDirection.Horizontal:
        return 'Horizontal';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _widthTypeSelectedRadioTile = val;
      widget.scrollDirectionCallback(toScrollDirection(val));
    });
  }

  Widget getPrivilegeOption(ScrollDirection? scrollDirection) {
    if (scrollDirection == null) return Text("?");
    var stringValue = widthtTypePortraitStringValue(scrollDirection);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            scrollDirection.index,
            _widthTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(ScrollDirection.Horizontal),
      getPrivilegeOption(ScrollDirection.Vertical)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
