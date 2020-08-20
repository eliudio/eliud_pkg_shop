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

import 'package:eliud_model/core/global_data.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';

import '../shared/abstract_repository_singleton.dart';


import 'product_image_entity.dart';
import 'package:eliud_model/shared/image_model.dart';
import 'package:eliud_model/shared/image_repository.dart';
import 'package:eliud_model/tools/random.dart';



class ProductImageModel {
  String documentID;
  ImageModel image;

  ProductImageModel({this.documentID, this.image, })  {
    assert(documentID != null);
  }

  ProductImageModel copyWith({String documentID, ImageModel image, }) {
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

  ProductImageEntity toEntity() {
    return ProductImageEntity(
          imageId: (image != null) ? image.documentID : null, 
    );
  }

  static ProductImageModel fromEntity(String documentID, ProductImageEntity entity) {
    if (entity == null) return null;
    return ProductImageModel(
          documentID: documentID, 
    );
  }

  static Future<ProductImageModel> fromEntityPlus(String documentID, ProductImageEntity entity) async {
    if (entity == null) return null;

    ImageModel imageHolder;
    if (entity.imageId != null) {
      try {
        await imageRepository().get(entity.imageId).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return ProductImageModel(
          documentID: documentID, 
          image: imageHolder, 
    );
  }

}

