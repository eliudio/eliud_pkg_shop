/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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


import 'package:eliud_pkg_shop/model/product_image_entity.dart';

import 'package:eliud_core/tools/random.dart';



class ProductImageModel {
  String? documentID;
  PlatformMediumModel? image;

  ProductImageModel({this.documentID, this.image, })  {
    assert(documentID != null);
  }

  ProductImageModel copyWith({String? documentID, PlatformMediumModel? image, }) {
    return ProductImageModel(documentID: documentID ?? this.documentID, image: image ?? this.image, );
  }

  @override
  int get hashCode => documentID.hashCode ^ image.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ProductImageModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          image == other.image;

  @override
  String toString() {
    return 'ProductImageModel{documentID: $documentID, image: $image}';
  }

  ProductImageEntity toEntity({String? appId}) {
    return ProductImageEntity(
          imageId: (image != null) ? image!.documentID : null, 
    );
  }

  static ProductImageModel? fromEntity(String documentID, ProductImageEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return ProductImageModel(
          documentID: documentID, 
    );
  }

  static Future<ProductImageModel?> fromEntityPlus(String documentID, ProductImageEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PlatformMediumModel? imageHolder;
    if (entity.imageId != null) {
      try {
          imageHolder = await platformMediumRepository(appId: appId)!.get(entity.imageId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise image');
        print('Error whilst retrieving platformMedium with id ${entity.imageId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return ProductImageModel(
          documentID: documentID, 
          image: imageHolder, 
    );
  }

}

