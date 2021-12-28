import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/custom_utils.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/router_builders.dart';
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
  final CartModel cart;
  final AppModel app;

  const CartWidget({Key? key, required this.app, required this.cart}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
          if (accessState is AccessDetermined) {
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
                        _buttonRowTop(context, ),
                        _createSubTitle(state.amountOfProducts()),
                        _createCartList(context, accessState.getMember(), state.items!),
                        _footer(context, state.totalValue()),
                        _buttonRowBottom(context, )
                      ],
                    );
                  } else {
                    return progressIndicator(widget.app, context);
                  }
                }
                ));
          } else {
            return progressIndicator(widget.app, context);
          }
        });


  }

  Widget _buttonRowTop(BuildContext context,) {
    return button(widget.app, context, label: 'Continue shopping',
          onPressed: () {
            eliudrouter.Router.navigateTo(context, widget.cart.backToShopAction!);
          });
  }

  Widget _buttonRowBottom(BuildContext context, ) {
    return button(widget.app, context, label: 'Checkout',
        onPressed: ()
    {
      Navigator.push(context, pageRouteBuilder(widget.app,
          page: CheckOutPage(app: widget.app, checkoutAction: widget.cart.checkoutAction)));
    });
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
                child: h3(widget.app, context, 'Total',),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: h3(widget.app, context, NumberFormat.simpleCurrency(locale: 'eu')
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
      child: h1(widget.app, context, 'SHOPPING CART',
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  Widget _createSubTitle(int? amount) {
    String text;
    if (amount == 1) {
      text = 'Total (1) item';
    } else {
      text = 'Total ($amount) items';
    }
    return Container(
      alignment: Alignment.topLeft,
      child: h2(widget.app, context, text),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  Widget _createCartList(BuildContext context, MemberModel? member, List<CartItemModel> cartItems) {
    var items = <Widget>[];
    cartItems.forEach((element) {
      if (element.product != null) {
        items.add(createCartItem(member, element));
      }
    });
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: items
    );
  }

  Widget createCartItem(MemberModel? member, CartItemModel item) {
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecorationHelper.boxDecoration(member,
                widget.cart.itemDetailBackground!),
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return createCartItemImage(item);
                } else {
                  return createCartItemPrice(item);
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

  Widget createCartItemImage(CartItemModel item) {
    var image = item.product!.images != null && item.product!.images!.isNotEmpty ? NetworkImage(item.product!.images![0].image!.url!) : null;
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
              context, widget.cart.openProductAction!, parameters: parameters);
        });
  }

  Widget createCartItemPrice(CartItemModel item) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: h2(widget.app, context, item.product!.title!, maxLines: 2, softWrap: true),
          ),
          Utils.getSizedBox(height: 6),
          Center(
            child: text(widget.app, context, item.product!.about!,
              maxLines: 4,
              softWrap: true,
            ),
          ),
          Utils.getSizedBox(height: 6),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                h3(widget.app, context, NumberFormat.simpleCurrency(locale: 'eu')
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
                        child: h3(widget.app, context,
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
