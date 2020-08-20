import 'package:eliud_model/component/fader_model.dart';
import 'package:eliud_pkg_shop/core/cart/cart_tools.dart';
import 'package:eliud_model/core/global_data.dart';
import 'package:eliud_model/core/navigate/router.dart';
import 'package:eliud_model/extensions/fader_widgets/fader_widgets.dart';
import 'package:eliud_pkg_shop/model/product_image_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:eliud_model/platform/platform.dart';
import 'package:eliud_model/shared/action_model.dart';
import 'package:eliud_model/shared/background_model.dart';
import 'package:eliud_model/shared/pos_size_model.dart';
import 'package:eliud_model/tools/etc.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final BackgroundModel itemDetailBackground;
  final String addToBasketText;
  final ActionModel continueShoppingAction;
  final ProductModel productModel;

  const ProductDetail(
      {Key key,
      this.continueShoppingAction,
      this.productModel,
      this.itemDetailBackground,
      this.addToBasketText})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<ImageProvider> cachedImages;
  List<PosSizeModel> positionsAndSizes;

  @override
  void didChangeDependencies() {
    List<ProductImageModel> items = widget.productModel.images;
    cachedImages = items
        .map((element) =>
            AbstractPlatform.platform.getImageProvider(element.image))
        .toList();
    positionsAndSizes =
        items.map((element) => (widget.productModel.posSize)).toList();
    if (cachedImages != null) {
      cachedImages.forEach((element) {
        precacheImage(element, context);
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.productModel.title;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        appBar: AppBar(
          title: Text(title,
              style: TextStyle(
                  color: RgbHelper.color(
                      rgbo: GlobalData.app().formAppBarTextColor))),
          flexibleSpace: Container(
              decoration: BoxDecorationHelper.boxDecoration(
                  GlobalData.app().formAppBarBackground)),
        ),
        body: Container(
          decoration:
              BoxDecorationHelper.boxDecoration(widget.itemDetailBackground),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                TheImageGF(cachedImages, positionsAndSizes, null, orientation,
                    1, FaderAnimation.Fade, 1000),
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
                              title,
                              style: FontTools.textStyle(GlobalData.app().h3),
                            ),
                            Text(
                              widget.productModel.price.toString(),
                              style: FontTools.textStyle(GlobalData.app().h3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          widget.productModel.about,
                          style: FontTools.textStyle(GlobalData.app().fontText),
                        ),
                      ),
                      RaisedButton(
                        color: RgbHelper.color(
                            rgbo: GlobalData.app().formSubmitButtonColor),
                        onPressed: () {
                          CartTools.addToCart(context, widget.continueShoppingAction, widget.productModel, 1);
                        },
                        child: Text(
                            widget.addToBasketText != null &&
                                    widget.addToBasketText.length > 0
                                ? widget.addToBasketText
                                : 'Add to basket',
                            style: TextStyle(
                                color: RgbHelper.color(
                                    rgbo: GlobalData.app()
                                        .formSubmitButtonTextColor))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
