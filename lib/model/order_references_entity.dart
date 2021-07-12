/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_references_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

class OrderReferencesEntity {
  final String? paymentReference;
  final String? shipmentReference;
  final String? deliveryReference;

  OrderReferencesEntity({this.paymentReference, this.shipmentReference, this.deliveryReference, });


  List<Object?> get props => [paymentReference, shipmentReference, deliveryReference, ];

  @override
  String toString() {
    return 'OrderReferencesEntity{paymentReference: $paymentReference, shipmentReference: $shipmentReference, deliveryReference: $deliveryReference}';
  }

  static OrderReferencesEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return OrderReferencesEntity(
      paymentReference: map['paymentReference'], 
      shipmentReference: map['shipmentReference'], 
      deliveryReference: map['deliveryReference'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (paymentReference != null) theDocument["paymentReference"] = paymentReference;
      else theDocument["paymentReference"] = null;
    if (shipmentReference != null) theDocument["shipmentReference"] = shipmentReference;
      else theDocument["shipmentReference"] = null;
    if (deliveryReference != null) theDocument["deliveryReference"] = deliveryReference;
      else theDocument["deliveryReference"] = null;
    return theDocument;
  }

  static OrderReferencesEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

