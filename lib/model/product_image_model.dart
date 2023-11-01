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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'package:eliud_pkg_shop/model/product_image_entity.dart';




class ProductImageModel implements ModelBase {
  static const String packageName = 'eliud_pkg_shop';
  static const String id = 'productImages';

  String documentID;
  PlatformMediumModel? image;

  ProductImageModel({required this.documentID, this.image, })  {
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

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (image != null) {
      referencesCollector.add(ModelReference(PlatformMediumModel.packageName, PlatformMediumModel.id, image!));
    }
    if (image != null) referencesCollector.addAll(await image!.collectReferences(appId: appId));
    return referencesCollector;
  }

  ProductImageEntity toEntity({String? appId}) {
    return ProductImageEntity(
          imageId: (image != null) ? image!.documentID : null, 
    );
  }

  static Future<ProductImageModel?> fromEntity(String documentID, ProductImageEntity? entity) async {
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

