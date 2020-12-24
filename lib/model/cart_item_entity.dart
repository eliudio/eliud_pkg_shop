/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class CartItemEntity {
  final int amount;
  final String appId;
  final String productId;

  CartItemEntity({this.amount, this.appId, this.productId, });


  List<Object> get props => [amount, appId, productId, ];

  @override
  String toString() {
    return 'CartItemEntity{amount: $amount, appId: $appId, productId: $productId}';
  }

  static CartItemEntity fromMap(Map map) {
    if (map == null) return null;

    return CartItemEntity(
      amount: int.tryParse(map['amount'].toString()), 
      appId: map['appId'], 
      productId: map['productId'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (amount != null) theDocument["amount"] = amount;
      else theDocument["amount"] = null;
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (productId != null) theDocument["productId"] = productId;
      else theDocument["productId"] = null;
    return theDocument;
  }

  static CartItemEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

