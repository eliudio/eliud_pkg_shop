/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/screen_size.dart';

import 'package:eliud_core/tools/delete_snackbar.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/core/eliud.dart';

import 'order_item_list_event.dart';
import 'order_item_list_state.dart';
import 'order_item_list_bloc.dart';
import 'order_item_model.dart';

import 'order_item_form.dart';
class OrderItemListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  OrderItemListWidgetState state;

  OrderItemListWidget({ Key key, this.readOnly, this.form }): super(key: key);

  @override
  OrderItemListWidgetState createState() {
    state ??= OrderItemListWidgetState();
    return state;
  }

  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= OrderItemListWidgetState();
    return state.fab(context);
  }
}

class OrderItemListWidgetState extends State<OrderItemListWidget> {
  OrderItemListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<OrderItemListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose () {
    if (bloc != null) bloc.close();
    super.dispose();
  }

  @override
  Widget fab(BuildContext aContext) {
    return !GlobalData.memberIsOwner()  
        ? null
        :FloatingActionButton(
      heroTag: "OrderItemFloatBtnTag",
      foregroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonBackgroundColor),
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(page: BlocProvider.value(
              value: bloc,
              child: OrderItemForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderItemListBloc, OrderItemListState>(builder: (context, state) {
      if (state is OrderItemListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is OrderItemListLoaded) {
        final values = state.values;
        return Container(
                 decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().listBackground),
                 child: ListView.separated(
                   separatorBuilder: (context, index) => Divider(
                     color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)
                   ),
                   shrinkWrap: true,
                   physics: ScrollPhysics(),
                   itemCount: values.length,
                   itemBuilder: (context, index) {
                     final value = values[index];
                     return OrderItemListItem(
                       value: value,
                       onDismissed: (direction) {
                         BlocProvider.of<OrderItemListBloc>(context)
                             .add(DeleteOrderItemList(value: value));
                         Scaffold.of(context).showSnackBar(DeleteSnackBar(
                           message: "OrderItem " + value.documentID,
                           onUndo: () => BlocProvider.of<OrderItemListBloc>(context)
                               .add(AddOrderItemList(value: value)),
                         ));
                       },
                       onTap: () async {
                                             final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(page: BlocProvider.value(
                              value: BlocProvider.of<OrderItemListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "OrderItem " + value.documentID,
                            onUndo: () => BlocProvider.of<OrderItemListBloc>(context)
                                .add(AddOrderItemList(value: value)),
                          ),
                        );
                      }

                       },
                     );
                   }
               ));
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
  
  Widget getForm(value, action) {
    if (widget.form == null) {
      return OrderItemForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class OrderItemListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final OrderItemModel value;

  OrderItemListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__OrderItem_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__OrderItemheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.amount != null ? value.amount.toString() + ' ' + (value.product == null ? '' : value.product.title) + ' ' + (value.soldPrice == null ? '' : value.soldPrice.toString()) : '0',
              style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
            )),
          ),
        ),
      ),
    );
  }
}

