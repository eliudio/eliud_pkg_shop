import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/custom_utils.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_bloc.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_event.dart';
import 'package:eliud_pkg_shop/bloc/cart/cart_state.dart';
import 'package:eliud_pkg_shop/extensions/shop_widgets/checkout_page.dart';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CartWidget extends StatefulWidget {
  final CartModel? cart;

  const CartWidget({Key? key, this.cart}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    if (accessState is AppLoaded) {
      return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: BlocProvider.of<CartBloc>(context)
                ..add(LoadCart()),
            ),
          ],
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            if (state is CartInitialised) {
              return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  //createHeader(),
                  _buttonRowTop(context, accessState.app),
                  _createSubTitle(accessState.app, state.amountOfProducts()),
                  _createCartList(context, accessState.app, accessState, state.items!),
                  _footer(context, accessState.app, state.totalValue()),
                  _buttonRowBottom(context, accessState.app)
                ],
              );
            } else {
              return StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicator(context);
            }
          }
          ));
    } else {
      return Text('App not loaded');
    }

  }

  Widget _buttonRowTop(BuildContext context, AppModel app) {
    return StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .button(context, label: 'Continue shopping',
          onPressed: () {
            eliudrouter.Router.navigateTo(context, widget.cart!.backToShopAction!);
          });
  }

  Widget _buttonRowBottom(BuildContext context, AppModel app) {
    return StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .button(context, label: 'Checkout',
        onPressed: () {
          MaterialPageRoute(builder: (context) => CheckOutPage(checkoutAction: widget.cart!.checkoutAction));
        });
  }

  Widget _footer(BuildContext context, AppModel app, double totalValue) {
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
                child: StyleRegistry.registry()
                    .styleWithContext(context)
                    .frontEndStyle()
                    .h3(context, 'Total',),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: StyleRegistry.registry()
                    .styleWithContext(context)
                    .frontEndStyle()
                    .h3(context, NumberFormat.simpleCurrency(locale: 'eu')
                      .format(totalValue),
                ),
              ),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  Widget createHeader(AppModel app) {
    return Container(
      alignment: Alignment.topLeft,
      child: StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .h1(context, 'SHOPPING CART',
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  Widget _createSubTitle(AppModel app, int? amount) {
    String text;
    if (amount == 1) {
      text = 'Total (1) item';
    } else {
      text = 'Total ($amount) items';
    }
    return Container(
      alignment: Alignment.topLeft,
      child: StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .h2(context, text),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  Widget _createCartList(BuildContext context, AppModel app, AccessState accessState, List<CartItemModel> cartItems) {
    List<Widget> items = [];
    cartItems.forEach((element) {
      if (element.product != null) {
        items.add(createCartItem(app, accessState, element));
      }
    });
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: items
    );
  }

  Widget createCartItem(AppModel app, AccessState accessState, CartItemModel item) {
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecorationHelper.boxDecoration(accessState,
                widget.cart!.itemDetailBackground!),
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return createCartItemImage(accessState, item);
                } else {
                  return createCartItemPrice(app, item);
                }
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
                      .add(SimpleAddProduct(-item.amount!, item.product));
                }),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.black),
          ),
        )
      ],
    );
  }

  Widget createCartItemImage(AccessState accessState, CartItemModel item) {
    var image = item.product!.images != null && item.product!.images!.length > 0 ? NetworkImage(item.product!.images![0].image!.url!) : null;
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
          var parameters = <String, dynamic>{
            'productId': item.product!.documentID
          };
          eliudrouter.Router.navigateTo(
              context, widget.cart!.openProductAction!, parameters: parameters);
        });
  }

  Widget createCartItemPrice(AppModel app, CartItemModel item) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: StyleRegistry.registry()
                .styleWithContext(context)
                .frontEndStyle()
                .h2(context, item.product!.title!, maxLines: 2, softWrap: true),
          ),
          Utils.getSizedBox(height: 6),
          Center(
            child: StyleRegistry.registry()
                .styleWithContext(context)
                .frontEndStyle()
                .text(context, item.product!.about!,
              maxLines: 4,
              softWrap: true,
            ),
          ),
          Utils.getSizedBox(height: 6),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                StyleRegistry.registry()
                    .styleWithContext(context)
                    .frontEndStyle()
                    .h3(context, NumberFormat.simpleCurrency(locale: 'eu')
                      .format(item.product!.price),
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
                        child: StyleRegistry.registry()
                            .styleWithContext(context)
                            .frontEndStyle()
                            .h3(context,
                          item.amount.toString(),
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
