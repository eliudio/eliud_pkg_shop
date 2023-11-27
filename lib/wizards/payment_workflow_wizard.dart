import 'package:eliud_core_main/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/model/menu_item_model.dart';
import 'package:eliud_core_main/model/public_medium_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_pkg_shop_model/tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/wizards/workflows/payment_workflow_builder.dart';
import 'package:flutter/material.dart';

import 'builders/widgets/payment_parameters_widget.dart';

class PaymentWorkflowWizard extends NewAppWizardInfo {
  PaymentWorkflowWizard()
      : super(
          'paymentworkflow',
          'Payment Workflow',
        );

  @override
  String getPackageName() => "eliud_pkg_shop";

  static PaymentParameters defaultParameters() => PaymentParameters(
        payTo: 'Mr Minkey',
        country: 'United Kingdom',
        bankIdentifierCode: 'Bank ID Code',
        payeeIBAN: 'IBAN 543232187632167',
        bankName: 'Bank Of America',
        manualPaymentCart: true,
        creditCardPaymentCart: false,
      );

  @override
  NewAppWizardParameters newAppWizardParameters() => defaultParameters();

  @override
  List<NewAppTask>? getCreateTasks(
    String uniqueId,
    AppModel app,
    NewAppWizardParameters parameters,
    MemberModel member,
    HomeMenuProvider homeMenuProvider,
    AppBarProvider appBarProvider,
    DrawerProvider leftDrawerProvider,
    DrawerProvider rightDrawerProvider,
  ) {
    if (parameters is PaymentParameters) {
      if ((parameters.creditCardPaymentCart) ||
          (parameters.manualPaymentCart)) {
        var tasks = <NewAppTask>[];
        tasks.add(() async {
          print('Payment workflow');
          var cartPaymentWorkflows = await PaymentWorkflowBuilder(
            uniqueId,
            app.documentID,
            parameters: parameters,
          ).create();
          parameters.registerCartPaymentWorkflows(cartPaymentWorkflows);
        });
        return tasks;
      }
    } else {
      throw Exception('Unexpected class for parameters: $parameters');
    }
    return null;
  }

  @override
  AppModel updateApp(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel adjustMe,
  ) =>
      adjustMe;

  @override
  String? getPageID(String uniqueId, NewAppWizardParameters parameters,
          String pageType) =>
      null;

  @override
  ActionModel? getAction(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel app,
    String actionType,
  ) {
    if (parameters is PaymentParameters) {
      if (parameters.cartPaymentWorkflows != null) {
        return getParameterAction(app, parameters.cartPaymentWorkflows!);
      } else {
        return null;
      }
    } else {
      throw Exception('Unexpected class for parameters: $parameters');
    }
  }

  @override
  List<MenuItemModel>? getMenuItemsFor(String uniqueId, AppModel app,
          NewAppWizardParameters parameters, MenuType type) =>
      null;

  @override
  Widget wizardParametersWidget(
      AppModel app, BuildContext context, NewAppWizardParameters parameters) {
    if (parameters is PaymentParameters) {
      return PaymentParametersWidget(
        app: app,
        parameters: parameters,
      );
    } else {
      return text(app, context, 'Unexpected class for parameters: $parameters');
    }
  }

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId,
          NewAppWizardParameters parameters, String mediumType) =>
      null;
}

class PaymentParameters extends NewAppWizardParameters {
  bool manualPaymentCart;
  bool creditCardPaymentCart;
  String? payTo;
  String? country;
  String? bankIdentifierCode;
  String? payeeIBAN;
  String? bankName;

  CartPaymentWorkflows? cartPaymentWorkflows;

  PaymentParameters({
    required this.manualPaymentCart,
    required this.creditCardPaymentCart,
    required this.payTo,
    required this.country,
    required this.bankIdentifierCode,
    required this.payeeIBAN,
    required this.bankName,
  });

  void registerCartPaymentWorkflows(
      CartPaymentWorkflows theCartPaymentWorkflows) {
    cartPaymentWorkflows = theCartPaymentWorkflows;
  }
}
