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

import 'package:eliud_model/core/global_data.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';

import '../shared/abstract_repository_singleton.dart';


import 'order_references_entity.dart';
import 'package:eliud_model/tools/random.dart';



class OrderReferencesModel {
  String paymentReference;
  String shipmentReference;
  String deliveryReference;

  OrderReferencesModel({this.paymentReference, this.shipmentReference, this.deliveryReference, })  {
  }

  OrderReferencesModel copyWith({String paymentReference, String shipmentReference, String deliveryReference, }) {
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

  OrderReferencesEntity toEntity() {
    return OrderReferencesEntity(
          paymentReference: (paymentReference != null) ? paymentReference : null, 
          shipmentReference: (shipmentReference != null) ? shipmentReference : null, 
          deliveryReference: (deliveryReference != null) ? deliveryReference : null, 
    );
  }

  static OrderReferencesModel fromEntity(OrderReferencesEntity entity) {
    if (entity == null) return null;
    return OrderReferencesModel(
          paymentReference: entity.paymentReference, 
          shipmentReference: entity.shipmentReference, 
          deliveryReference: entity.deliveryReference, 
    );
  }

  static Future<OrderReferencesModel> fromEntityPlus(OrderReferencesEntity entity) async {
    if (entity == null) return null;

    return OrderReferencesModel(
          paymentReference: entity.paymentReference, 
          shipmentReference: entity.shipmentReference, 
          deliveryReference: entity.deliveryReference, 
    );
  }

}

