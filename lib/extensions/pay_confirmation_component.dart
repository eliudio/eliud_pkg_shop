import 'package:eliud_model/core/widgets/alert_widget.dart';
import 'package:eliud_model/tools/component_constructor.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/confirmation_widget.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/payment_bloc.dart';
import 'package:eliud_pkg_shop/model/order_component_bloc.dart';
import 'package:eliud_pkg_shop/model/order_component_event.dart';
import 'package:eliud_pkg_shop/model/order_repository.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component_bloc.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_component_event.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';
import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';
import 'package:eliud_pkg_shop/shared/abstract_repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayConfirmationComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, String> parameters}) {
    return PayConfirmationComponent(id: id, parameters: parameters,);
  }
}

class PayConfirmationComponent extends AbstractPayConfirmationComponent {
  final Map<String, String> parameters;

  PayConfirmationComponent({String id, this.parameters}) : super(payConfirmationID: id);

  @override
  Widget yourWidget(BuildContext context, PayConfirmationModel payConfirmationModel) {
    var orderNumber = parameters['orderId'];
    if (orderNumber != null) {
      return BlocProvider<OrderBloc>(
        create: (context) =>
        OrderBloc(orderRepository: getOrderRepository())
          ..add(FetchOrder(id: orderNumber)),
        child: ConfirmationWidget(payConfirmationModel),
      );
    } else {
      return alertWidget(title: 'error', content: 'Ordernumber not provided');
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  PayConfirmationRepository getPayConfirmationRepository() {
    return AbstractRepositorySingleton.singleton.payConfirmationRepository();
  }

  OrderRepository getOrderRepository() {
    return AbstractRepositorySingleton.singleton.orderRepository();
  }
}
