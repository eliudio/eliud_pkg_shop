/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
class ProductImageEntity {
  final String imageId;

  ProductImageEntity({this.imageId, });

  List<Object> get props => [imageId, ];

  @override
  String toString() {
    return 'ProductImageEntity{imageId: $imageId}';
  }

  static ProductImageEntity fromMap(Map map) {
    if (map == null) return null;

    return ProductImageEntity(
      imageId: map['imageId'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    return theDocument;
  }

  static ProductImageEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

