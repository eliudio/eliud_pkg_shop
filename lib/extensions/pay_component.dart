import 'package:eliud_model/tools/component_constructor.dart';
import 'package:eliud_model/core/widgets/alert_widget.dart';
import 'package:eliud_pkg_shop/core/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/payment_bloc.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/payment_event.dart';
import 'package:eliud_pkg_shop/extensions/pay_widgets/payment_widget.dart';
import 'package:eliud_pkg_shop/model/pay_component.dart';
import 'package:eliud_pkg_shop/model/pay_model.dart';
import 'package:eliud_pkg_shop/model/pay_repository.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, String> parameters}) {
    return PayProfileComponent(id: id);
  }
}

class PayProfileComponent extends AbstractPayComponent {
  PaymentBloc paymentBloc;

  PayProfileComponent({String id}) : super(payID: id);

  @override
  Widget yourWidget(BuildContext context, PayModel pay) {
    var cartBloc = BlocProvider.of<CartBloc>(context);
    return BlocProvider<PaymentBloc>(
        create: (context) => PaymentBloc(cartBloc)..add(CollectOrder(pay.shop)),
        child: PayWidget(pay),
    );
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  PayRepository getPayRepository() {
    return AbstractRepositorySingleton.singleton.payRepository();
  }
}
