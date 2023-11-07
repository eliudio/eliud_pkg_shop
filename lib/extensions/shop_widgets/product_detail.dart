import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_fundamentals/extensions/fader_widgets/fader_widgets.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_tools.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatefulWidget {
  final AppModel app;
  final ProductDisplayModel? productDisplayModel;
  final ProductModel? productModel;

  const ProductDetail(
      {super.key,
      required this.app,
      this.productDisplayModel,
      this.productModel});

  @override
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        return ProductDetailWithAccess(widget.app, accessState,
            widget.productDisplayModel, widget.productModel);
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }
}

class ProductDetailWithAccess extends StatefulWidget {
  final AppModel app;
  final ProductDisplayModel? productDisplayModel;
  final AccessState accessState;
  final ProductModel? productModel;

  const ProductDetailWithAccess(
      this.app, this.accessState, this.productDisplayModel, this.productModel);

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
    if (accessState is AccessDetermined) {
      return Container(
          clipBehavior: BoxDecorationHelper.determineClipBehaviour(
              widget.app,
              accessState.getMember(),
              widget.productDisplayModel!.itemDetailBackground),
          margin: BoxDecorationHelper.determineMargin(
              widget.app,
              accessState.getMember(),
              widget.productDisplayModel!.itemDetailBackground),
          padding: BoxDecorationHelper.determinePadding(
              widget.app,
              accessState.getMember(),
              widget.productDisplayModel!.itemDetailBackground),
          decoration: BoxDecorationHelper.boxDecoration(
              widget.app,
              accessState.getMember(),
              widget.productDisplayModel!.itemDetailBackground),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                TheImageGF(
                    widget.app,
                    accessState.getMember(),
                    widget.productDisplayModel!.background,
                    images,
                    positionsAndSizes,
                    null,
                    orientation,
                    1,
                    1000),
                Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 15.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            h3(widget.app, context, title!),
                            h3(widget.app, context,
                                widget.productModel!.price.toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: text(widget.app, context,
                            widget.productModel!.about ?? ''),
                      ),
                      button(
                        widget.app,
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
                              widget.app,
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
