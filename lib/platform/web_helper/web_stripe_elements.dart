import 'dart:convert';
import 'dart:html';
import 'dart:ui' as ui;
import 'dart:js' as js;

import 'package:eliud_pkg_shop/model/order_model.dart';
import 'package:flutter/material.dart';

import 'package:eliud_pkg_shop/platform/payment_platform.dart';

class WebStripeElements extends StatefulWidget {
  final HandlePayment handlePayment;
  final OrderModel order;
  final String ccy;
  final String name;
  final int cents;

  const WebStripeElements({Key key, this.ccy, this.name, this.cents, this.order, this.handlePayment}) : super(key: key);

  @override
  _WebStripeElementsState createState() => _WebStripeElementsState();
}

class _WebStripeElementsState extends State<WebStripeElements> {
  Widget _iframeWidget;

  final IFrameElement _iframeElement = IFrameElement();

  final _textController = TextEditingController();

  @override
  void initState() {
    print("initState");
    super.initState();

    _iframeElement.height = '150';
    _iframeElement.width = '400';

    _iframeElement.src = 'https://juuwle.com?stripe_amount=' + widget.cents.toString() + '&stripe_ccy=' + widget.ccy + '&stripe_name=' + widget.name;
    _iframeElement.style.border = 'none';

    js.context['flutter_feedback'] = (msg) {
      debugPrint("flutter_feedback:");
      debugPrint(msg);
      debugPrint("after flutter_feedback:");
      Map<String, dynamic> feedback = jsonDecode(msg);
      debugPrint("decoded msg");
      Map<String, dynamic> paymentIntent = feedback['paymentIntent'];
      if (paymentIntent == null) {
        widget.handlePayment(widget.order, PaymentFailure("paymentIntent is null", msg));
      } else {
        debugPrint("got paymentIntent");
        debugPrint("paymentIntent = " + jsonEncode(paymentIntent));

        String status = paymentIntent['status'];
        if (status == 'succeeded') {
          debugPrint("succeeded");
          String id = paymentIntent['id'];
          debugPrint("id");
          widget.handlePayment(widget.order, PaymentSucceeded(id));
        } else {
          debugPrint("not succeeded");
          widget.handlePayment(widget.order, PaymentFailure(status, msg));
        }

        debugPrint("before pop");
      }
      Navigator.of(context).pop();
      debugPrint("after pop");
    };

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    debugPrint("_iframeWidget");
    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return  _iframeWidget;
 }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
