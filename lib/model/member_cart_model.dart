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
import 'package:eliud_model/core/global_data.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';

import '../shared/abstract_repository_singleton.dart';


import 'member_cart_entity.dart';
import 'cart_item_model.dart';
import 'package:eliud_model/tools/random.dart';



class MemberCartModel {

  // User UUID
  String documentID;
  List<CartItemModel> items;

  MemberCartModel({this.documentID, this.items, })  {
    assert(documentID != null);
  }

  MemberCartModel copyWith({String documentID, List<CartItemModel> items, }) {
    return MemberCartModel(documentID: documentID ?? this.documentID, items: items ?? this.items, );
  }

  @override
  int get hashCode => documentID.hashCode ^ items.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberCartModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          ListEquality().equals(items, other.items);

  @override
  String toString() {
    String itemsCsv = (items == null) ? '' : items.join(', ');

    return 'MemberCartModel{documentID: $documentID, items: CartItem[] { $itemsCsv }}';
  }

  MemberCartEntity toEntity() {
    return MemberCartEntity(
          items: (items != null) ? items
            .map((item) => item.toEntity())
            .toList() : null, 
    );
  }

  static MemberCartModel fromEntity(String documentID, MemberCartEntity entity) {
    if (entity == null) return null;
    return MemberCartModel(
          documentID: documentID, 
          items: 
            entity. items
            .map((item) => CartItemModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<MemberCartModel> fromEntityPlus(String documentID, MemberCartEntity entity) async {
    if (entity == null) return null;

    return MemberCartModel(
          documentID: documentID, 
          items: 
            new List<CartItemModel>.from(await Future.wait(entity. items
            .map((item) => CartItemModel.fromEntityPlus(newRandomKey(), item))
            .toList())), 
    );
  }

}

