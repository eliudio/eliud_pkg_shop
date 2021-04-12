import 'package:eliud_pkg_shop/model/cart_item_model.dart';

class CartHelper {
  static double totalValue(List<CartItemModel> items) {
    if (items.isEmpty) return 0;
    return items.map((item) => item.amount! * (item.product != null ? item.product!.price! : 0)).reduce((value, element) => value + element) as double;
  }

  static int? amountOfProducts( List<CartItemModel>? items) {
    if (items == null) return 0;
    if (items.isEmpty) return 0;
    return items.map((item) => item.amount).reduce((value, element) => value! + element!);
  }
}
