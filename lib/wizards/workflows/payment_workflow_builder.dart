import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_pay/tasks/context_amount_pay_model.dart';
import 'package:eliud_pkg_pay/tasks/pay_type_types/creditcard_pay_type_model.dart';
import 'package:eliud_pkg_pay/tasks/pay_type_types/manual_pay_type_model.dart';
import 'package:eliud_pkg_pay/tasks/pay_type_types/pay_type_model.dart';
import 'package:eliud_pkg_pay/tasks/review_and_ship_task_model.dart';
import 'package:eliud_pkg_shop/shop_package.dart';
import 'package:eliud_pkg_workflow/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow/model/workflow_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_notification_model.dart';
import 'package:eliud_pkg_workflow/model/workflow_task_model.dart';
import 'package:eliud_pkg_workflow/tools/action/workflow_action_model.dart';

import '../payment_workflow_wizard.dart';

class CartPaymentWorkflows {
  WorkflowModel? workflowForManualPaymentCart;
  WorkflowModel? workflowForCreditCardPaymentCart;

  CartPaymentWorkflows(
      this.workflowForManualPaymentCart, this.workflowForCreditCardPaymentCart);
}

ActionModel getParameterAction(AppModel app, CartPaymentWorkflows cartPaymentWorkflows) => WorkflowActionModel(app,
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
        packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
      ),
      workflow: cartPaymentWorkflows.workflowForCreditCardPaymentCart ?? cartPaymentWorkflows.workflowForManualPaymentCart);

class PaymentWorkflowBuilder {
  final String uniqueId;
  final String appId;
  final PaymentParameters parameters;

  PaymentWorkflowBuilder(this.uniqueId, this.appId, {required this.parameters});

  Future<CartPaymentWorkflows> create() async {
    var workflowForManualPaymentCart;
    var workflowForCreditCardPaymentCart;
    if (parameters.manualPaymentCart) {
      workflowForManualPaymentCart = _workflowForManualPaymentCart();
      await workflowRepository(appId: appId)!.add(workflowForManualPaymentCart);
    }
    if (parameters.creditCardPaymentCart) {
      workflowForCreditCardPaymentCart = workflowForCreditCardPaymentCart();
      await workflowRepository(appId: appId)!
          .add(workflowForCreditCardPaymentCart());
    }
    return CartPaymentWorkflows(
        workflowForManualPaymentCart, workflowForCreditCardPaymentCart);
  }

  WorkflowModel _workflowForManualPaymentCart() {
    return workflowForManualPaymentCart(
        payTo: parameters.payTo ?? '?',
        country: parameters.country ?? '?',
        bankIdentifierCode: parameters.bankIdentifierCode ?? '?',
        payeeIBAN: parameters.payeeIBAN ?? '?',
        bankName: parameters.bankName ?? '?');
  }

  WorkflowActionModel payCart(AppModel app) => WorkflowActionModel(app,
      conditions: DisplayConditionsModel(
        privilegeLevelRequired: PrivilegeLevelRequired.NoPrivilegeRequired,
        packageCondition: ShopPackage.CONDITION_CARTS_HAS_ITEMS,
      ),
      workflow: workflowForCreditCardPaymentCart());

  // helper methods
  WorkflowModel workflowForManualPaymentCart(
      {required String payTo,
      required String country,
      required String bankIdentifierCode,
      required String payeeIBAN,
      required String bankName}) {
    return _workflowForPaymentCart(
        "cat_paid_manually",
        "Manual Cart Payment",
        ManualPayTypeModel(
            payTo: payTo,
            country: country,
            bankIdentifierCode: bankIdentifierCode,
            payeeIBAN: payeeIBAN,
            bankName: bankName));
  }

  WorkflowModel workflowForCreditCardPaymentCart() {
    return _workflowForPaymentCart("cart_paid_by_card",
        "Cart Payment with Card", CreditCardPayTypeModel());
  }

  WorkflowModel _workflowForPaymentCart(
      String documentID, String name, PayTypeModel payTypeModel) {
    return WorkflowModel(
        appId: appId,
        documentID: constructDocumentId(
            uniqueId: uniqueId, documentId: "payment"),
        name: "Manual Cart Payment",
        workflowTask: [
          WorkflowTaskModel(
            seqNumber: 1,
            documentID: "workflow_task_payment",
            responsible: WorkflowTaskResponsible.CurrentMember,
            task: ContextAmountPayModel(
              identifier: newRandomKey(),
              executeInstantly: false,
              description: 'Please pay for your purchase',
              paymentType: payTypeModel,
            ),
          ),
          WorkflowTaskModel(
            seqNumber: 2,
            documentID: "review_payment_and_ship",
            responsible: WorkflowTaskResponsible.Owner,
            confirmMessage: WorkflowNotificationModel(
                message:
                    "Your payment has been reviewed and approved and your order is being prepared for shipment. Feedback from the shop: ",
                addressee: WorkflowNotificationAddressee.CurrentMember),
            rejectMessage: WorkflowNotificationModel(
                message:
                    "Your payment has been reviewed and rejected. Feedback from the shop: ",
                addressee: WorkflowNotificationAddressee.CurrentMember),
            task: ReviewAndShipTaskModel(
              identifier: newRandomKey(),
              executeInstantly: false,
              description: 'Review the payment and ship the products',
            ),
          ),
        ]);
  }
}
