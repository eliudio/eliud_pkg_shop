import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_pkg_shop/model/order_component_bloc.dart';
import 'package:eliud_pkg_shop/model/order_component_state.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_pkg_shop/extensions/pay_widgets/order_helper.dart';

// ignore: must_be_immutable
class ConfirmationWidget extends StatefulWidget {
  final PayConfirmationModel payConfirmationModel;

  ConfirmationWidget(this.payConfirmationModel);

  @override
  State<StatefulWidget> createState() {
    return ConfirmationState();
  }
}

class ConfirmationState extends State<ConfirmationWidget> {
  Widget _getButton() {
    return RaisedButton(
          color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
          onPressed: () {
            eliudrouter.Router.navigateTo(context, widget.payConfirmationModel.backToShopAction);
          },
          child: Text('Back to the shop'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
      if (state is OrderLoaded) {
        var order = state.value;
        debugPrint('state is OrderPaid');
        var widgets = <Widget>[];
        widgets.add(
          ListTile(
              trailing: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50.0,
                semanticLabel: 'Success',
              ),
              title: Text('Payment successfull.'),
              subtitle: Text(
                  "We'll be working hard to get it to you asap. Thank you very much")),
        );
        OrderHelper.addOrderOverviewAfterPayment(widgets, order, context);
        widgets.add(_getButton());
        return ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: widgets,
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
