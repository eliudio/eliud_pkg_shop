/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/shop_entity.dart';

import 'package:eliud_core/tools/random.dart';



class ShopModel {
  String documentID;
  String appId;
  String description;
  String shortDescription;
  String currency;

  ShopModel({this.documentID, this.appId, this.description, this.shortDescription, this.currency, })  {
    assert(documentID != null);
  }

  ShopModel copyWith({String documentID, String appId, String description, String shortDescription, String currency, }) {
    return ShopModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, shortDescription: shortDescription ?? this.shortDescription, currency: currency ?? this.currency, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ shortDescription.hashCode ^ currency.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ShopModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          shortDescription == other.shortDescription &&
          currency == other.currency;

  @override
  String toString() {
    return 'ShopModel{documentID: $documentID, appId: $appId, description: $description, shortDescription: $shortDescription, currency: $currency}';
  }

  ShopEntity toEntity() {
    appId = GlobalData.app().documentID;
    return ShopEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          shortDescription: (shortDescription != null) ? shortDescription : null, 
          currency: (currency != null) ? currency : null, 
    );
  }

  static ShopModel fromEntity(String documentID, ShopEntity entity) {
    if (entity == null) return null;
    return ShopModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          shortDescription: entity.shortDescription, 
          currency: entity.currency, 
    );
  }

  static Future<ShopModel> fromEntityPlus(String documentID, ShopEntity entity) async {
    if (entity == null) return null;

    return ShopModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          shortDescription: entity.shortDescription, 
          currency: entity.currency, 
    );
  }

}

