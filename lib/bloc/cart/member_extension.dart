import 'dart:collection';
import 'dart:convert';

import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/cart_item_entity.dart';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';

extension CartMemberExtension on MemberModel {
  bool hasItemsInCart() {
    if (packageData != null) {
      var cartItems = packageData['CART_ITEMS'];
      if (cartItems == null) return false;
      if (cartItems == '[]') return false;
      var decoded = jsonDecode(cartItems);
      return decoded.length > 0;
    }
    return false;
  }

  Future<List<CartItemModel>> items() async {
    if (packageData != null) {
      var cartItems = packageData['CART_ITEMS'];
      if (cartItems != null) {
        var decoded = jsonDecode(cartItems);
        List<CartItemEntity> decodedItems = [];
        decoded.forEach((item) {
          decodedItems.add(CartItemEntity.fromJsonString(item));
        });

        var items = List<CartItemModel>.from(await Future.wait(decodedItems
            .map((item) => CartItemModel.fromEntityPlus(newRandomKey(), item, appId: item.appId))
            .toList()));

        // TODO: we need to check if all item's have a reference to a product. If not it means the product has disappeared from our catalogue, in between pressing "buy" and checking out, which could be days in between

        return items;
      }
    }
    return Future.value([]);
  }

  MemberModel copyWithItems(List<CartItemModel> cartItems) {
    Map<String, Object> newPackageData;
    if (packageData != null) {
      newPackageData = packageData;
    } else {
      newPackageData = HashMap();
    }
    if (cartItems != null) {
      newPackageData['CART_ITEMS'] = jsonEncode(cartItems.map((cartItem) => cartItem.toEntity(appId: cartItem.appId).toJsonString()).toList());
    }
    return MemberModel(documentID: documentID, name: name, subscriptions: subscriptions, photoURL: photoURL,
                      shipStreet1: shipStreet1, shipStreet2: shipStreet2, shipCity: shipCity, shipState: shipState, postcode: postcode, country: country,
                      invoiceSame: invoiceSame, invoiceStreet1: invoiceStreet1, invoiceStreet2: invoiceStreet2, invoiceCity: invoiceCity, invoiceState: invoiceState, invoicePostcode: invoicePostcode, invoiceCountry: invoiceCountry,
                      readAccess: readAccess, /*items: this.items,*/ email: email, isAnonymous: isAnonymous, packageData: newPackageData);
  }

  static cartsEqual(List<CartItemModel> items1, List<CartItemModel> items2) {
    if (items1.length != items2.length)
      return false;
    if (items1.isEmpty) return true;
    for (var i = 0; i < items1.length; i++) {
      var item1 = items1[i];
      var item2 = items2[i];
      if (item1.amount != item2.amount)
        return false;
      if (item1.appId != item2.appId)
        return false;
      if (item1.product != item2.product)
        return false;
    }
    return true;
  }

  Future<bool> cartEqualsOtherCart(MemberModel otherMember) async {
    var items1 = await items();
    var items2 = await otherMember.items();
    return cartsEqual(items1, items2);
  }
}