/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_model/core/global_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:eliud_model/platform/platform.dart';

import 'package:cached_network_image/cached_network_image.dart';


import 'order_list_bloc.dart';
import 'order_list_state.dart';
import 'order_model.dart';


typedef OrderChanged(String value);

class OrderDropdownButtonWidget extends StatefulWidget {
  final String value;
  final OrderChanged trigger;
  final bool optional;

  OrderDropdownButtonWidget({ this.value, this.trigger, this.optional, Key key }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OrderDropdownButtonWidgetState();
  }
}

class OrderDropdownButtonWidgetState extends State<OrderDropdownButtonWidget> {
  OrderListBloc bloc;

  OrderDropdownButtonWidgetState();

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<OrderListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (bloc != null) bloc.close();
    super.dispose();
  }

List<Widget> widgets(OrderModel pm) {
List<Widget> widgets = List();
if (pm.documentID != null) widgets.add(new Text(pm.documentID));
if (pm.paymentReference != null) widgets.add(new Text(pm.paymentReference));
return widgets;
}


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<OrderListBloc, OrderListState>(builder: (context, state) {
      if (state is OrderListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is OrderListLoaded) {
        String valueChosen;
        if (state.values.indexWhere((v) => (v.documentID == widget.value)) >= 0)
          valueChosen = widget.value;
        else
          if (widget.optional != null && widget.optional) valueChosen = null;
          
        final values = state.values;
        final List<DropdownMenuItem<String>> items = List();
        if (state.values.isNotEmpty) {
          if (widget.optional != null && widget.optional) {
            items.add(new DropdownMenuItem<String>(
                value: null,
                child: new Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  height: 100.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [ new Text("None") ],
                  ),
                )));
          }
          state.values.forEach((element) {
            items.add(new DropdownMenuItem<String>(
                value: element.documentID,
                child: new Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  height: 100.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widgets(element),
                  ),
                )));
          });
        }
        DropdownButton button = 
                    DropdownButton<String>(
                      isDense: false,
                      isExpanded: false,
                      items: items,
                      value: valueChosen,
                      hint: Text('Select a order'),
                      onChanged: !GlobalData.memberIsOwner() ? null : _onChange,
                    );
        if (false) {
          return Container(height:48, child: Center(child: button));
        } else {
          return Center(child: button);
        }
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  void _onChange(String value) {
    widget.trigger(value);
  }
}

