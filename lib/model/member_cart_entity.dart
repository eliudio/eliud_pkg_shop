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
import 'cart_item_entity.dart';

class MemberCartEntity {
  final List<CartItemEntity> items;

  MemberCartEntity({this.items, });

  List<Object> get props => [items, ];

  @override
  String toString() {
    String itemsCsv = (items == null) ? '' : items.join(', ');

    return 'MemberCartEntity{items: CartItem[] { $itemsCsv }}';
  }

  static MemberCartEntity fromMap(Map map) {
    if (map == null) return null;

    final itemsList = (map['items'] as List<dynamic>)
        .map((dynamic item) =>
        CartItemEntity.fromMap(item as Map))
        .toList();

    return MemberCartEntity(
      items: itemsList, 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> itemsListMap = items != null 
        ? items.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (items != null) theDocument["items"] = itemsListMap;
      else theDocument["items"] = null;
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

