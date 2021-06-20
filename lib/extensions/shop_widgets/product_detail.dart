import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_fundamentals/extensions/fader_widgets/fader_widgets.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_tools.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final ProductDisplayModel? productDisplayModel;
  final ProductModel? productModel;

  const ProductDetail({Key? key, this.productDisplayModel, this.productModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return ProductDetailWithAccess(
        accessState, widget.productDisplayModel, widget.productModel);
  }
}

class ProductDetailWithAccess extends StatefulWidget {
  final ProductDisplayModel? productDisplayModel;
  final AccessState accessState;
  final ProductModel? productModel;

  const ProductDetailWithAccess(
      this.accessState, this.productDisplayModel, this.productModel);

  @override
  State<StatefulWidget> createState() => _ProductDetailWithAccessState();
}

class _ProductDetailWithAccessState extends State<ProductDetailWithAccess> {
  @override
  Widget build(BuildContext context) {
    var items = widget.productModel!.images!;
    var images = items.map((element) => element.image).toList();
    var positionsAndSizes =
        items.map((element) => (widget.productModel!.posSize)).toList();

    var title = widget.productModel!.title;
    var orientation = MediaQuery.of(context).orientation;
    var accessState = widget.accessState;
    if (accessState is AppLoaded) {
      return Container(
          decoration: BoxDecorationHelper.boxDecoration(
              accessState, widget.productDisplayModel!.itemDetailBackground),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                TheImageGF(
                    images, positionsAndSizes, null, orientation, 1, 1000),
                Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 15.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            StyleRegistry.registry()
                                .styleWithContext(context)
                                .frontEndStyle().textStyle()
                                .h3(context, title!),
                            StyleRegistry.registry()
                                .styleWithContext(context)
                                .frontEndStyle().textStyle()
                                .h3(context,
                                    widget.productModel!.price.toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: StyleRegistry.registry()
                            .styleWithContext(context)
                            .frontEndStyle().textStyle()
                            .text(context, widget.productModel!.about!),
                      ),
                      StyleRegistry.registry()
                          .styleWithContext(context)
                          .frontEndStyle().buttonStyle()
                          .button(
                        context,
                        label: widget.productDisplayModel!.addToBasketText !=
                                    null &&
                                widget.productDisplayModel!.addToBasketText!
                                    .isNotEmpty
                            ? widget.productDisplayModel!.addToBasketText!
                            : 'Add to basket',
                        onPressed: () {
                          CartTools.addToCart(
                              context,
                              widget.productDisplayModel!.buyAction,
                              widget.productModel,
                              1);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    } else {
      return Text('App not loaded');
    }
  }
}
