import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_shop_model/model/shop_front_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef ScrollDirectionCallback = Function(ScrollDirection scrollDirection);

class ScrollDirectionWidget extends StatefulWidget {
  final ScrollDirectionCallback scrollDirectionCallback;
  final ScrollDirection scrollDirection;
  final AppModel app;
  ScrollDirectionWidget(
      {super.key,
      required this.app,
      required this.scrollDirectionCallback,
      required this.scrollDirection});

  @override
  State<StatefulWidget> createState() {
    return _ScrollDirectionWidgetState();
  }
}

class _ScrollDirectionWidgetState extends State<ScrollDirectionWidget> {
  int? _widthTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _widthTypeSelectedRadioTile = widget.scrollDirection.index;
  }

  String widthTypePortraitStringValue(ScrollDirection? scrollDirection) {
    switch (scrollDirection) {
      case ScrollDirection.vertical:
        return 'Vertical';
      case ScrollDirection.horizontal:
        return 'Horizontal';
      case ScrollDirection.unknown:
        break;
      case null:
        break;
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
    var stringValue = widthTypePortraitStringValue(scrollDirection);
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
      getPrivilegeOption(ScrollDirection.horizontal),
      getPrivilegeOption(ScrollDirection.vertical)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
