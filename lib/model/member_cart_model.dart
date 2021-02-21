/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/member_cart_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MemberCartModel {
  String documentID;
  String appId;
  List<CartItemModel> cartItems;

  MemberCartModel({this.documentID, this.appId, this.cartItems, })  {
    assert(documentID != null);
  }

  MemberCartModel copyWith({String documentID, String appId, List<CartItemModel> cartItems, }) {
    return MemberCartModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, cartItems: cartItems ?? this.cartItems, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ cartItems.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberCartModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          ListEquality().equals(cartItems, other.cartItems);

  @override
  String toString() {
    String cartItemsCsv = (cartItems == null) ? '' : cartItems.join(', ');

    return 'MemberCartModel{documentID: $documentID, appId: $appId, cartItems: CartItem[] { $cartItemsCsv }}';
  }

  MemberCartEntity toEntity({String appId}) {
    return MemberCartEntity(
          appId: (appId != null) ? appId : null, 
          cartItems: (cartItems != null) ? cartItems
            .map((item) => item.toEntity(appId: appId))
            .toList() : null, 
    );
  }

  static MemberCartModel fromEntity(String documentID, MemberCartEntity entity) {
    if (entity == null) return null;
    return MemberCartModel(
          documentID: documentID, 
          appId: entity.appId, 
          cartItems: 
            entity.cartItems == null ? null :
            entity.cartItems
            .map((item) => CartItemModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<MemberCartModel> fromEntityPlus(String documentID, MemberCartEntity entity, { String appId}) async {
    if (entity == null) return null;

    return MemberCartModel(
          documentID: documentID, 
          appId: entity.appId, 
          cartItems: 
            entity. cartItems == null ? null : new List<CartItemModel>.from(await Future.wait(entity. cartItems
            .map((item) => CartItemModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
    );
  }

}
