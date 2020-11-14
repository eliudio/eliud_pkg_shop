import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
import 'package:eliud_core/core/app/app_state.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/extensions/fader_widgets/fader_widgets.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_tools.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/tools/etc.dart';
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
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    var appState = AppBloc.getState(context);
    var accessState = AccessBloc.getState(context);
    return ProductDetailWithAccess(appState, accessState, widget.itemDetailBackground, widget.addToBasketText, widget.continueShoppingAction, widget.productModel);
  }

}

class ProductDetailWithAccess extends StatefulWidget {
  final BackgroundModel itemDetailBackground;
  final String addToBasketText;
  final ActionModel continueShoppingAction;
  final ProductModel productModel;
  final AppState appState;
  final AccessState accessState;

  const ProductDetailWithAccess(this.appState, this.accessState, this.itemDetailBackground, this.addToBasketText, this.continueShoppingAction, this.productModel);

  @override
  State<StatefulWidget> createState()  => _ProductDetailWithAccessState();
}

class _ProductDetailWithAccessState extends State<ProductDetailWithAccess> {
  List<ImageProvider> cachedImages;
  List<PosSizeModel> positionsAndSizes;

  @override
  void didChangeDependencies() {
    var items = widget.productModel.images;
    cachedImages = items
        .map((element) =>
            AbstractPlatform.platform.getImageProvider(widget.accessState, element.image))
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
    var title = widget.productModel.title;
    var orientation = MediaQuery.of(context).orientation;
    var appState = widget.appState;
    var accessState = widget.accessState;
    if (appState is AppLoaded) {
      return Scaffold(
          appBar: AppBar(
            title: Text(title,
                style: TextStyle(
                    color: RgbHelper.color(
                        rgbo: appState.app.formAppBarTextColor))),
            flexibleSpace: Container(
                decoration: BoxDecorationHelper.boxDecoration(accessState,
                    appState.app.formAppBarBackground)),
          ),
          body: Container(
            decoration:
                BoxDecorationHelper.boxDecoration(accessState, widget.itemDetailBackground),
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
                                style: FontTools.textStyle(appState.app.h3),
                              ),
                              Text(
                                widget.productModel.price.toString(),
                                style: FontTools.textStyle(appState.app.h3),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            widget.productModel.about,
                            style: FontTools.textStyle(appState.app.fontText),
                          ),
                        ),
                        RaisedButton(
                          color: RgbHelper.color(
                              rgbo: appState.app.formSubmitButtonColor),
                          onPressed: () {
                            CartTools.addToCart(context, widget.continueShoppingAction, widget.productModel, 1);
                          },
                          child: Text(
                              widget.addToBasketText != null &&
                                      widget.addToBasketText.isNotEmpty
                                  ? widget.addToBasketText
                                  : 'Add to basket',
                              style: TextStyle(
                                  color: RgbHelper.color(
                                      rgbo: appState.app
                                          .formSubmitButtonTextColor))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
  } else {
    return Text('App not loaded');
  }
  }
}
