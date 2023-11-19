import 'package:eliud_core/core/wizards/tools/document_identifier.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core_model/model/storage_conditions_model.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_core/tools/storage/platform_medium_helper.dart';
import 'package:eliud_pkg_shop_model/model/product_image_model.dart';
import 'package:eliud_pkg_shop_model/model/product_model.dart';
import 'package:eliud_pkg_shop_model/model/shop_model.dart';

import 'pos_sizes.dart';

class Product {
  final String? id;
  final String? title;
  final String? about;
  final String? assetLocation1;
  final String? assetLocation2;
  final String? assetLocation3;
  final String? assetLocation4;
  final double? price;

  Product(
      {this.id,
      this.title,
      this.about,
      this.assetLocation1,
      this.assetLocation2,
      this.assetLocation3,
      this.assetLocation4,
      this.price});

  String imageId1() => '${title!}a';
  String imageId2() => '${title!}b';
}

Future<PlatformMediumModel> uploadPlatformPhoto(
    AppModel app, String memberId, String photoLocation) async {
  return await PlatformMediumHelper(
          app, memberId, PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple)
      .createThumbnailUploadPhotoAsset(newRandomKey(), photoLocation);
}

Future<ProductModel> productToProductModel(String uniqueId, ShopModel shop,
    AppModel app, String memberId, Product product) async {
  var productImages = <ProductImageModel>[];
  if (product.assetLocation1 != null) {
    productImages.add(ProductImageModel(
        documentID: constructDocumentId(
            uniqueId: uniqueId, documentId: product.imageId1()),
        image:
            await uploadPlatformPhoto(app, memberId, product.assetLocation1!)));
  }
  if (product.assetLocation2 != null) {
    productImages.add(ProductImageModel(
        documentID: constructDocumentId(
            uniqueId: uniqueId, documentId: product.imageId1()),
        image:
            await uploadPlatformPhoto(app, memberId, product.assetLocation2!)));
  }
  if (product.assetLocation3 != null) {
    productImages.add(ProductImageModel(
        documentID: constructDocumentId(
            uniqueId: uniqueId, documentId: product.imageId1()),
        image:
            await uploadPlatformPhoto(app, memberId, product.assetLocation3!)));
  }
  if (product.assetLocation4 != null) {
    productImages.add(ProductImageModel(
        documentID: constructDocumentId(
            uniqueId: uniqueId, documentId: product.imageId1()),
        image:
            await uploadPlatformPhoto(app, memberId, product.assetLocation4!)));
  }
  return ProductModel(
    documentID:
        constructDocumentId(uniqueId: uniqueId, documentId: product.id!),
    appId: app.documentID,
    title: product.title,
    about: product.about,
    shop: shop,
    images: productImages,
    price: product.price,
    weight: 100,
    posSize: screen75(app.documentID),
/*
    conditions: StorageConditionsModel(
        privilegeLevelRequired:
            PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
*/
  );
}
