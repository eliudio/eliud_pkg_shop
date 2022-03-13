import 'package:eliud_core/core/wizards/widgets/action_specification_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_pkg_medium/wizards/widgets/photo_widget.dart';
import 'package:eliud_pkg_shop/wizards/builders/widgets/payment_parameters_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../shop_page_wizard.dart';

class ShopParametersWidget extends StatefulWidget {
  final AppModel app;
  final ShopParameters parameters;

  ShopParametersWidget({
    Key? key,
    required this.app,
    required this.parameters,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShopParametersWidgetState();
  }
}

class _ShopParametersWidgetState extends State<ShopParametersWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
            ActionSpecificationWidget(
                app: widget.app,
                enabled: true,
                actionSpecification: widget.parameters.shopSpecifications,
                label: 'Generate Shop Page'),
            ActionSpecificationWidget(
                app: widget.app,
                enabled: true,
                actionSpecification: widget.parameters.cartSpecifications,
                label: 'Generate Cart Page'),
            PaymentParametersWidget(app: widget.app, parameters: widget.parameters.paymentParameters, ),
            PlatformPhotoWidget(
              title: 'Shop Page Image',
              defaultImage:
              'packages/eliud_pkg_shop/assets/shop/decorating/charlotte_presenting.png',
              feedbackFunction: (mediumModel) {
                setState(() {
                  widget.parameters.shopImage = mediumModel;
                });
              },
              app: widget.app,
              initialImage: widget.parameters.shopImage,
            ),
            PlatformPhotoWidget(
              title: 'Shop Fader Image',
              defaultImage:
              'packages/eliud_pkg_shop/assets/shop/logo/day30-cafe.png',
              feedbackFunction: (mediumModel) {
                setState(() {
                  widget.parameters.faderImage = mediumModel;
                });
              },
              app: widget.app,
              initialImage: widget.parameters.faderImage,
            ),
            PlatformPhotoWidget(
              title: 'Cart Page Image',
              defaultImage:
              'packages/eliud_pkg_shop/assets/shop/decorating/charlotte_with_bags.png',
              feedbackFunction: (mediumModel) {
                setState(() {
                  widget.parameters.cartImage = mediumModel;
                });
              },
              app: widget.app,
              initialImage: widget.parameters.cartImage,
            ),
            PlatformPhotoWidget(
              title: 'Order Overview Image',
              defaultImage:
              'packages/eliud_pkg_shop/assets/shop/decorating/charlotte_with_bags.png',
              feedbackFunction: (mediumModel) {
                setState(() {
                  widget.parameters.orderImage = mediumModel;
                });
              },
              app: widget.app,
              initialImage: widget.parameters.orderImage,
            ),
            PlatformPhotoWidget(
              title: 'Pay Confirmation Image',
              defaultImage: 'packages/eliud_pkg_shop/assets/shop/decorating/charlotte_with_credit_card.png',
              feedbackFunction: (mediumModel) {
                setState(() {
                  widget.parameters.payConfirmationImage = mediumModel;
                });
              },
              app: widget.app,
              initialImage: widget.parameters.payConfirmationImage,
            ),
            PlatformPhotoWidget(
              title: 'Pay image',
              defaultImage: 'packages/eliud_pkg_shop/assets/shop/decorating/charlotte_with_credit_card.png',
              feedbackFunction: (mediumModel) {
                setState(() {
                  widget.parameters.payImage = mediumModel;
                });
              },
              app: widget.app,
              initialImage: widget.parameters.payImage,
            ),
        ]);
  }
}
