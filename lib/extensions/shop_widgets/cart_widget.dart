import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/router.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/tools/custom_utils.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_event.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_state.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/product_detail.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/size_route.dart';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import "../../bloc/cart/member_extension.dart";
import 'checkout_page.dart';

class CartWidget extends StatefulWidget {
  final CartModel cart;

  const CartWidget({Key key, this.cart}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: BlocProvider.of<CartBloc>(context),
          ),
        ],
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartInitialised)
            return ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: <Widget>[
                //createHeader(),
                _buttonRowTop(context),
                _createSubTitle(state.amountOfProducts()),
                _createCartList(context, state.items),
                _footer(context, state.totalValue()),
                _buttonRowBottom(context)
              ],
            );
          }
    ));

  }

  Widget _buttonRowTop(BuildContext context) {
    return RaisedButton(
          color:
          RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
          onPressed: () {
            Router.navigateTo(context, widget.cart.backToShopAction);
          },
          child: Text('Continue shopping'));
  }

  Widget _buttonRowBottom(BuildContext context) {
    return RaisedButton(
        color:
        RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => CheckOutPage(checkoutAction: widget.cart.checkoutAction)));
        },
        child: Text('Checkout'));
  }

  Widget _footer(BuildContext context, double totalValue) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: FontTools.textStyle(GlobalData.app().h3),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  NumberFormat.simpleCurrency(locale: 'eu')
                      .format(totalValue),
                  style: FontTools.textStyle(GlobalData.app().h3),
                ),
              ),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  Widget createHeader() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "SHOPPING CART",
        style: FontTools.textStyle(GlobalData.app().h1),
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  Widget _createSubTitle(int amount) {
    String text;
    if (amount == 1)
      text = "Total (1) item";
    else
      text = "Total ($amount) items";
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: FontTools.textStyle(GlobalData
            .app()
            .h2),
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  Widget _createCartList(BuildContext context, List<CartItemModel> cartItems) {
    List<Widget> items = List();
    cartItems.forEach((element) {
      if (element.product != null) {
        items.add(createCartItem(element));
      }
    });
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: items
    );
  }

  createCartItem(CartItemModel item) {
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecorationHelper.boxDecoration(
                widget.cart.itemDetailBackground),
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                if (index == 0)
                  return createCartItemImage(item);
                else
                  return createCartItemPrice(item);
              },
              itemCount: 2,
            )),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: GestureDetector(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  BlocProvider.of<CartBloc>(context)
                      .add(SimpleAddProduct(-item.amount, item.product));
                }),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.black),
          ),
        )
      ],
    );
  }

  createCartItemImage(CartItemModel item) {
    var image = item.product.images != null && item.product.images.length > 0 ? AbstractPlatform.platform
        .getImageProvider(item.product.images[0].image) : null;
    Widget w;
    if (image == null) {
      w = Icon(Icons.image);
    } else {
      w = Container(
        margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            color: Colors.transparent,
            image: DecorationImage(
                image: image))
      );
    }
    return GestureDetector(
        child: w,
        onTap: () {
          Navigator.of(context).push(SizeRoute(
              page: ProductDetail(
            continueShoppingAction: widget.cart.backToShopAction,
            productModel: item.product,
            itemDetailBackground: null,
//todo: background
//                                widget.shopFrontModel.itemDetailBackground,
            addToBasketText: null,
//todo: background
//                                widget.shopFrontModel.addToBasketText
          )));
        });
  }

  createCartItemPrice(CartItemModel item) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              item.product.title,
              maxLines: 2,
              softWrap: true,
              style: FontTools.textStyle(GlobalData.app().h2),
            ),
          ),
          Utils.getSizedBox(height: 6),
          Center(
            child: Text(
              item.product.about,
              maxLines: 4,
              softWrap: true,
              style: FontTools.textStyle(GlobalData.app().fontText),
            ),
          ),
          Utils.getSizedBox(height: 6),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  NumberFormat.simpleCurrency(locale: 'eu')
                      .format(item.product.price),
                  style: FontTools.textStyle(GlobalData.app().h3),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                          child: Icon(
                            Icons.remove,
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                          onTap: () {
                            BlocProvider.of<CartBloc>(context)
                                .add(SimpleAddProduct(-1, item.product));
                            setState(() => {});
                          }),
                      Container(
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.only(
                            bottom: 2, right: 12, left: 12),
                        child: Text(
                          item.amount.toString(),
                          style: FontTools.textStyle(GlobalData.app().h3),
                        ),
                      ),
                      GestureDetector(
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                          onTap: () {
                            BlocProvider.of<CartBloc>(context)
                                .add(SimpleAddProduct(1, item.product));
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
