/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_references_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/order_references_entity.dart';

import 'package:eliud_core/tools/random.dart';



class OrderReferencesModel {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'orderReferencess';

  String? paymentReference;
  String? shipmentReference;
  String? deliveryReference;

  OrderReferencesModel({this.paymentReference, this.shipmentReference, this.deliveryReference, })  {
  }

  OrderReferencesModel copyWith({String? paymentReference, String? shipmentReference, String? deliveryReference, }) {
    return OrderReferencesModel(paymentReference: paymentReference ?? this.paymentReference, shipmentReference: shipmentReference ?? this.shipmentReference, deliveryReference: deliveryReference ?? this.deliveryReference, );
  }

  @override
  int get hashCode => paymentReference.hashCode ^ shipmentReference.hashCode ^ deliveryReference.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is OrderReferencesModel &&
          runtimeType == other.runtimeType && 
          paymentReference == other.paymentReference &&
          shipmentReference == other.shipmentReference &&
          deliveryReference == other.deliveryReference;

  @override
  String toString() {
    return 'OrderReferencesModel{paymentReference: $paymentReference, shipmentReference: $shipmentReference, deliveryReference: $deliveryReference}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  OrderReferencesEntity toEntity({String? appId}) {
    return OrderReferencesEntity(
          paymentReference: (paymentReference != null) ? paymentReference : null, 
          shipmentReference: (shipmentReference != null) ? shipmentReference : null, 
          deliveryReference: (deliveryReference != null) ? deliveryReference : null, 
    );
  }

  static Future<OrderReferencesModel?> fromEntity(OrderReferencesEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return OrderReferencesModel(
          paymentReference: entity.paymentReference, 
          shipmentReference: entity.shipmentReference, 
          deliveryReference: entity.deliveryReference, 
    );
  }

  static Future<OrderReferencesModel?> fromEntityPlus(OrderReferencesEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return OrderReferencesModel(
          paymentReference: entity.paymentReference, 
          shipmentReference: entity.shipmentReference, 
          deliveryReference: entity.deliveryReference, 
    );
  }

}

