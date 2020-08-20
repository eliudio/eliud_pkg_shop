/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_model/core/global_data.dart';
import 'package:eliud_model/shared/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_model/tools/screen_size.dart';

import 'package:eliud_model/tools/delete_snackbar.dart';
import 'package:eliud_model/tools/router_builders.dart';
import 'package:eliud_model/tools/etc.dart';
import 'package:eliud_model/tools/enums.dart';
import 'package:eliud_model/core/eliud.dart';

import 'cart_list_event.dart';
import 'cart_list_state.dart';
import 'cart_list_bloc.dart';
import 'cart_model.dart';

import 'cart_form.dart';
class CartListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  CartListWidgetState state;

  CartListWidget({ Key key, this.readOnly, this.form }): super(key: key);

  @override
  CartListWidgetState createState() {
    state ??= CartListWidgetState();
    return state;
  }

  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= CartListWidgetState();
    return state.fab(context);
  }
}

class CartListWidgetState extends State<CartListWidget> {
  CartListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<CartListBloc>(context);
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
      heroTag: "CartFloatBtnTag",
      foregroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonBackgroundColor),
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(page: BlocProvider.value(
              value: bloc,
              child: CartForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartListBloc, CartListState>(builder: (context, state) {
      if (state is CartListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CartListLoaded) {
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
                     return CartListItem(
                       value: value,
                       onDismissed: (direction) {
                         BlocProvider.of<CartListBloc>(context)
                             .add(DeleteCartList(value: value));
                         Scaffold.of(context).showSnackBar(DeleteSnackBar(
                           message: "Cart " + value.documentID,
                           onUndo: () => BlocProvider.of<CartListBloc>(context)
                               .add(AddCartList(value: value)),
                         ));
                       },
                       onTap: () async {
                                             final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(page: BlocProvider.value(
                              value: BlocProvider.of<CartListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "Cart " + value.documentID,
                            onUndo: () => BlocProvider.of<CartListBloc>(context)
                                .add(AddCartList(value: value)),
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
      return CartForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class CartListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final CartModel value;

  CartListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__Cart_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__CartheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.documentID,
              style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
            )),
          ),
        ),
        subtitle: (value.description != null) && (value.description.isNotEmpty)
            ? Center( child: Text(
          value.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
        ))
            : null,
      ),
    );
  }
}

