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
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

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



class MemberCartModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'MemberCart';

  String documentID;
  String appId;
  List<CartItemModel>? cartItems;

  MemberCartModel({required this.documentID, required this.appId, this.cartItems, })  {
    assert(documentID != null);
  }

  MemberCartModel copyWith({String? documentID, String? appId, List<CartItemModel>? cartItems, }) {
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
    String cartItemsCsv = (cartItems == null) ? '' : cartItems!.join(', ');

    return 'MemberCartModel{documentID: $documentID, appId: $appId, cartItems: CartItem[] { $cartItemsCsv }}';
  }

  MemberCartEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return MemberCartEntity(
          appId: (appId != null) ? appId : null, 
          cartItems: (cartItems != null) ? cartItems
            !.map((item) => item.toEntity(appId: appId, referencesCollector: referencesCollector))
            .toList() : null, 
    );
  }

  static Future<MemberCartModel?> fromEntity(String documentID, MemberCartEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberCartModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          cartItems: 
            entity.cartItems == null ? null : List<CartItemModel>.from(await Future.wait(entity. cartItems
            !.map((item) {
            counter++;
              return CartItemModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
    );
  }

  static Future<MemberCartModel?> fromEntityPlus(String documentID, MemberCartEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return MemberCartModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          cartItems: 
            entity. cartItems == null ? null : List<CartItemModel>.from(await Future.wait(entity. cartItems
            !.map((item) {
            counter++;
            return CartItemModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
    );
  }

}

