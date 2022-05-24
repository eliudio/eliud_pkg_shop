import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/confirmation_widget.dart';
import 'package:eliud_pkg_shop/model/order_component_bloc.dart';
import 'package:eliud_pkg_shop/model/order_component_event.dart';
import 'package:eliud_pkg_shop/model/order_repository.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayConfirmationComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required AppModel app, required String id, Map<String, dynamic>? parameters}) {
    return PayConfirmationComponent(key: key, app: app, id: id, parameters: parameters,);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async => await payConfirmationRepository(appId: app.documentID)!.get(id);
}

class PayConfirmationComponent extends AbstractPayConfirmationComponent {
  final Map<String, dynamic>? parameters;

  PayConfirmationComponent({Key? key, required AppModel app, required String id, this.parameters}) : super(key: key, app: app, payConfirmationId: id);

  @override
  Widget yourWidget(BuildContext context, PayConfirmationModel? payConfirmationModel) {
    if (parameters != null) {
      var orderNumber = parameters!['orderId'];
      if (orderNumber != null) {
        return BlocProvider<OrderComponentBloc>(
          create: (context) =>
          OrderComponentBloc(orderRepository: orderRepository(appId: app.documentID))
            ..add(FetchOrderComponent(id: orderNumber as String?)),
          child: ConfirmationWidget(app, payConfirmationModel),
        );
      } else {
        return alertWidget(title: 'error', content: 'Ordernumber not provided');
      }
    } else {
      return alertWidget(title: 'error', content: 'Ordernumber not provided');
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(app: app, title: title, content: content);
  }
}
