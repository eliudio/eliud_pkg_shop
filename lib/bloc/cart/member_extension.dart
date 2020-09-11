import 'dart:collection';
import 'dart:convert';

import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/cart_item_entity.dart';
import 'package:eliud_pkg_shop/model/cart_item_model.dart';

extension CartMemberExtension on MemberModel {
  Future<List<CartItemModel>> items() async {
    if (packageData != null) {
      var cartItems = packageData['CART_ITEMS'];
      if (cartItems != null) {
        var decoded = jsonDecode(cartItems);
        List<CartItemEntity> decodedItems = List();
        decoded.forEach((item) {
          decodedItems.add(CartItemEntity.fromJsonString(item));
        });

        var items = new List<CartItemModel>.from(await Future.wait(decodedItems
            .map((item) => CartItemModel.fromEntityPlus(newRandomKey(), item))
            .toList()));

        // TODO: we need to check if all item's have a reference to a product. If not it means the product has disappeared from our catalogue, in between pressing "buy" and checking out, which could be days in between

        return items;
      }
    }
    return Future.value([]);
  }

  MemberModel copyWithItems(List<CartItemModel> cartItems) {
    Map<String, Object> newPackageData;
    if (this.packageData != null) {
      newPackageData = this.packageData;
    } else {
      newPackageData = HashMap();
    }
    if (cartItems != null)
      newPackageData['CART_ITEMS'] = jsonEncode(cartItems.map((cartItem) => cartItem.toEntity().toJsonString()).toList());
    return MemberModel(documentID: this.documentID, name: this.name, subscriptions: this.subscriptions, photoURL: this.photoURL,
                      shipStreet1: this.shipStreet1, shipStreet2: this.shipStreet2, shipCity: this.shipCity, shipState: this.shipState, postcode: this.postcode, country: this.country,
                      invoiceSame: this.invoiceSame, invoiceStreet1: this.invoiceStreet1, invoiceStreet2: this.invoiceStreet2, invoiceCity: this.invoiceCity, invoiceState: this.invoiceState, invoicePostcode: this.invoicePostcode, invoiceCountry: this.invoiceCountry,
                      readAccess: this.readAccess, /*items: this.items,*/ email: this.email, isAnonymous: this.isAnonymous, packageData: newPackageData);
  }
}