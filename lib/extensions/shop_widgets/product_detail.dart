import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_pkg_fundamentals/extensions/fader_widgets/fader_widgets.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_tools.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/tools/etc.dart';
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
    var positionsAndSizes = items.map((element) => (widget.productModel!.posSize)).toList();

    var title = widget.productModel!.title;
    var orientation = MediaQuery.of(context).orientation;
    var accessState = widget.accessState;
    if (accessState is AppLoaded) {
      return Container(
          decoration: BoxDecorationHelper.boxDecoration(
              accessState, widget.productDisplayModel!.itemDetailBackground!),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                TheImageGF(images, positionsAndSizes as List<PosSizeModel>, null, orientation,
                    1, 1000),
                Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 15.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              title!,
                              style: FontTools.textStyle(accessState.app.h3),
                            ),
                            Text(
                              widget.productModel!.price.toString(),
                              style: FontTools.textStyle(accessState.app.h3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          widget.productModel!.about!,
                          style: FontTools.textStyle(accessState.app.fontText),
                        ),
                      ),
                      RaisedButton(
                        color: RgbHelper.color(
                            rgbo: accessState.app.formSubmitButtonColor),
                        onPressed: () {
                          CartTools.addToCart(
                              context,
                              widget.productDisplayModel!.buyAction,
                              widget.productModel,
                              1);
                        },
                        child: Text(
                            widget.productDisplayModel!.addToBasketText !=
                                        null &&
                                    widget.productDisplayModel!.addToBasketText!
                                        .isNotEmpty
                                ? widget.productDisplayModel!.addToBasketText!
                                : 'Add to basket',
                            style: TextStyle(
                                color: RgbHelper.color(
                                    rgbo: accessState
                                        .app.formSubmitButtonTextColor))),
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
