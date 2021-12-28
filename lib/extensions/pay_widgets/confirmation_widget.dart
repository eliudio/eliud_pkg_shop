import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/order_helper.dart';
import 'package:eliud_pkg_shop/model/order_component_bloc.dart';
import 'package:eliud_pkg_shop/model/order_component_state.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ConfirmationWidget extends StatefulWidget {
  final AppModel app;
  final PayConfirmationModel? payConfirmationModel;

  ConfirmationWidget(this.app, this.payConfirmationModel);

  @override
  State<StatefulWidget> createState() {
    return ConfirmationState();
  }
}

class ConfirmationState extends State<ConfirmationWidget> {
  Widget _getButton() {
    return button(
      widget.app,
      context,
      label: 'Back to the shop',
      onPressed: () {
        eliudrouter.Router.navigateTo(
            context, widget.payConfirmationModel!.backToShopAction!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
          if (accessState is AccessDetermined) {
            return BlocBuilder<OrderComponentBloc, OrderComponentState>(
                builder: (context, state) {
                  if (state is OrderComponentLoaded) {
                    var order = state.value;
                    debugPrint('state is OrderPaid');
                    var widgets = <Widget>[];
                    widgets.add(ListTile(
                      trailing: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 50.0,
                        semanticLabel: 'Success',
                      ),
                      title: h4(widget.app, context, 'Payment successfull.'),
                      subtitle: text(widget.app, context,
                          "We'll be working hard to get it to you asap. Thank you very much"),
                    ));
                    OrderHelper.addOrderOverviewAfterPayment(widget.app,
                        widgets, order, context);
                    widgets.add(_getButton());
                    return ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: widgets,
                    );
                  } else {
                    return progressIndicator(widget.app, context);
                  }
                });
          } else {
            return progressIndicator(widget.app, context);
          }
        });
  }
}
