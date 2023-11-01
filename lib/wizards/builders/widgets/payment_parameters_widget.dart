import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

import '../../payment_workflow_wizard.dart';

class PaymentParametersWidget extends StatefulWidget {
  final AppModel app;
  final PaymentParameters parameters;

  PaymentParametersWidget({
    Key? key,
    required this.app,
    required this.parameters,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PaymentParametersWidgetState();
  }
}

class _PaymentParametersWidgetState
    extends State<PaymentParametersWidget> {
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          h4(widget.app, context, 'Generate a default Payment Workflow'),
          checkboxListTile(widget.app, context, 'Manually paid Payment',
              widget.parameters.manualPaymentCart, (value) {
            setState(() {
              widget.parameters.manualPaymentCart = value ?? false;
            });
          }),
          if (widget.parameters.manualPaymentCart) getListTile(context, widget.app,
              leading: Icon(Icons.description),
              title: dialogField(
                widget.app,
                context,
                initialValue: widget.parameters.payTo,
                valueChanged: (value) {
                  widget.parameters.payTo = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Pay To',
                  labelText: 'Pay To',
                ),
              )),
          if (widget.parameters.manualPaymentCart) getListTile(context, widget.app,
              leading: Icon(Icons.description),
              title: dialogField(
                widget.app,
                context,
                initialValue: widget.parameters.country,
                valueChanged: (value) {
                  widget.parameters.country = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Country',
                  labelText: 'Country',
                ),
              )),
          if (widget.parameters.manualPaymentCart) getListTile(context, widget.app,
              leading: Icon(Icons.description),
              title: dialogField(
                widget.app,
                context,
                initialValue: widget.parameters.bankIdentifierCode,
                valueChanged: (value) {
                  widget.parameters.bankIdentifierCode = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Bank Identifier Code',
                  labelText: 'Bank Identifier Code',
                ),
              )),
          if (widget.parameters.manualPaymentCart) getListTile(context, widget.app,
              leading: Icon(Icons.description),
              title: dialogField(
                widget.app,
                context,
                initialValue: widget.parameters.payeeIBAN,
                valueChanged: (value) {
                  widget.parameters.payeeIBAN = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Payee IBAN',
                  labelText: 'Payee IBAN',
                ),
              )),
          if (widget.parameters.manualPaymentCart) getListTile(context, widget.app,
              leading: Icon(Icons.description),
              title: dialogField(
                widget.app,
                context,
                initialValue: widget.parameters.bankName,
                valueChanged: (value) {
                  widget.parameters.bankName = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Bank Name',
                  labelText: 'Bank Name',
                ),
              )),
          checkboxListTile(widget.app, context, 'Payment by card',
              widget.parameters.creditCardPaymentCart, (value) {
            setState(() {
              widget.parameters.creditCardPaymentCart = value ?? false;
            });
          }),
        ]);
  }
}
