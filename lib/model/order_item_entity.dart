/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class OrderItemEntity {
  final int? amount;
  final String? appId;
  final double? soldPrice;
  final String? productId;

  OrderItemEntity({this.amount, this.appId, this.soldPrice, this.productId, });


  List<Object?> get props => [amount, appId, soldPrice, productId, ];

  @override
  String toString() {
    return 'OrderItemEntity{amount: $amount, appId: $appId, soldPrice: $soldPrice, productId: $productId}';
  }

  static OrderItemEntity? fromMap(Map? map) {
    if (map == null) return null;

    return OrderItemEntity(
      amount: int.tryParse(map['amount'].toString()), 
      appId: map['appId'], 
      soldPrice: double.tryParse(map['soldPrice'].toString()), 
      productId: map['productId'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (amount != null) theDocument["amount"] = amount;
      else theDocument["amount"] = null;
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (soldPrice != null) theDocument["soldPrice"] = soldPrice;
      else theDocument["soldPrice"] = null;
    if (productId != null) theDocument["productId"] = productId;
      else theDocument["productId"] = null;
    return theDocument;
  }

  static OrderItemEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

