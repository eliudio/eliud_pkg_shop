import 'dart:math';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_tools.dart';
import 'package:eliud_pkg_shop/model/product_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_list_state.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridProducts extends StatefulWidget {
  final AppModel app;
  final ShopFrontModel shopFrontModel;

  /*
  7) create a new basket.spec file with the details of the basket. Include the shopPage and checkout page as part of the specifications of the basket.
  8) in the basket, show the list of products, and show a button "checkout" as well as "continue shopping"
  9) create a checkout.spec which is for checkout.
  */

  const GridProducts({Key? key, required this.app, required this.shopFrontModel}) : super(key: key);

  @override
  _GridProductsState createState() => _GridProductsState();
}

class _GridProductsState extends State<GridProducts> {
  int selectedSliderPosition = 0;

  ProductListBloc? bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<ProductListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (bloc != null) bloc!.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
          if (accessState is AccessDetermined) {
            var amountAcross =
            max(1, fullScreenWidth(context) / widget.shopFrontModel.size!);
            var width = (fullScreenWidth(context) / amountAcross) - 5;
            return BlocBuilder<ProductListBloc, ProductListState>(
              builder: (context, state) {
                if (state is ProductListLoaded) {
                  var products = state.values!;

                  List<Widget> cards = products.map((item) {
                    Widget? show;
                    if ((item!.images != null) &&
                        (item.images!.isNotEmpty) &&
                        (item.images![0].image != null)) {
                      show = ImageHelper.getThumbnailFromPlatformMediumModel(
                          width: width,
                          height: width,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.topCenter,
                          platformMediumModel: item.images![0].image!);
                    }
                    return Container(
                        clipBehavior: (widget.shopFrontModel.itemCardBackground == null) ? Clip.none : Clip.hardEdge,
                        decoration: BoxDecorationHelper.boxDecoration(widget.app, accessState.getMember(),
                            widget.shopFrontModel.itemCardBackground),
                        child: Card(
                          margin: EdgeInsets.all(0.0),
                          elevation: widget.shopFrontModel.cardElevation,
                          color: Colors.transparent,
                          child: Stack(
                            fit: StackFit.loose,
                            alignment: Alignment.center,
                            children: <Widget>[
                              GestureDetector(
                                  child: show,
                                  onTap: () {
                                    var parameters = <String, Object?>{
                                      'productId': item.documentID
                                    };
                                    eliudrouter.Router.navigateTo(
                                        context, widget.shopFrontModel.openProductAction!, parameters: parameters as Map<String, dynamic>);
                                  }),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      icon: Icon(Icons.add_shopping_cart,
                                          color: RgbHelper.color(rgbo: widget.shopFrontModel.addToCartColor!)),
                                      onPressed: () {
                                        CartTools.addToCart(
                                            context, widget.app, widget.shopFrontModel.buyAction, item, 1);
                                      })),
                            ],
                          ),
                        ));
                  }).toList();

                  return GridView.count(
                      crossAxisCount: amountAcross.toInt(),
                      crossAxisSpacing: widget.shopFrontModel.cardAxisSpacing!,
                      childAspectRatio: 1,
                      mainAxisSpacing: widget.shopFrontModel.cardAxisSpacing!,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: widget.shopFrontModel.scrollDirection ==
                          ScrollDirection.Vertical
                          ? Axis.vertical
                          : Axis.horizontal,
                      padding: const EdgeInsets.all(0.0),
                      children: cards);
                } else {
                  return progressIndicator(widget.app, context);
                }
              },
            );
          } else {
            return progressIndicator(widget.app, context);
          }
        });
  }
}
