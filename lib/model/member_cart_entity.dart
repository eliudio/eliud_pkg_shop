/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class MemberCartEntity {
  final String appId;
  final List<CartItemEntity> cartItems;

  MemberCartEntity({this.appId, this.cartItems, });


  List<Object> get props => [appId, cartItems, ];

  @override
  String toString() {
    String cartItemsCsv = (cartItems == null) ? '' : cartItems.join(', ');

    return 'MemberCartEntity{appId: $appId, cartItems: CartItem[] { $cartItemsCsv }}';
  }

  static MemberCartEntity fromMap(Map map) {
    if (map == null) return null;

    var cartItemsFromMap;
    cartItemsFromMap = map['cartItems'];
    var cartItemsList;
    if (cartItemsFromMap != null)
      cartItemsList = (map['cartItems'] as List<dynamic>)
        .map((dynamic item) =>
        CartItemEntity.fromMap(item as Map))
        .toList();

    return MemberCartEntity(
      appId: map['appId'], 
      cartItems: cartItemsList, 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> cartItemsListMap = cartItems != null 
        ? cartItems.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (cartItems != null) theDocument["cartItems"] = cartItemsListMap;
      else theDocument["cartItems"] = null;
    return theDocument;
  }

  static MemberCartEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

