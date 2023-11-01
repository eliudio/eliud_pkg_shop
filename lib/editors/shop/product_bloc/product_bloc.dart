import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/product_image_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';

import '../../../model/product_entity.dart';

class ProductBloc extends ExtEditorBaseBloc<ProductModel, ProductImageModel, ProductEntity> {
  final ShopModel shopModel;

  ProductBloc(String appId, EditorFeedback feedback, this.shopModel)
      : super(appId, productRepository(appId: appId)!, feedback);

  @override
  ProductModel addItem(ProductModel model, ProductImageModel newItem) {
    List<ProductImageModel> newItems =
        model.images == null ? [] : model.images!;
    newItems.add(newItem);
    var newModel = model.copyWith(images: newItems);
    return newModel;
  }

  @override
  ProductModel deleteItem(ProductModel model, ProductImageModel deleteItem) {
    var newItems = <ProductImageModel>[];
    if (model.images != null) {
      for (var item in model.images!) {
        if (item != deleteItem) {
          newItems.add(item);
        }
      }
    }
    var newModel = model.copyWith(images: newItems);
    return newModel;
  }

  @override
  ProductModel newInstance(StorageConditionsModel conditions) {
    return ProductModel(
      documentID: newRandomKey(),
      title: 'new product',
      about: 'about the new product',
      appId: appId,
      price: 0,
      weight: 0,
      shop: shopModel,
      images: [],
      posSize: defaultPosSize(),
//      conditions: conditions,
    );
  }

  static PosSizeModel defaultPosSize() => PosSizeModel(
      widthPortrait: .75,
      widthTypePortrait: WidthTypePortrait.PercentageWidth,
      heightPortrait: .75,
      heightTypePortrait: HeightTypePortrait.PercentageHeight,
      fitPortrait: PortraitFitType.PortraitFitWidth,
      alignTypePortrait: PortraitAlignType.PortraitAlignCenter,
      widthLandscape: .75,
      widthTypeLandscape: WidthTypeLandscape.PercentageWidth,
      heightLandscape: .75,
      heightTypeLandscape: HeightTypeLandscape.PercentageHeight,
      fitLandscape: LandscapeFitType.LandscapeFitHeight,
      alignTypeLandscape: LandscapeAlignType.LandscapeAlignCenter,
      clip: ClipType.NoClip);


  @override
  ProductModel setDefaultValues(
      ProductModel t, StorageConditionsModel conditions) {
    return t.copyWith(
/*
        conditions: t.conditions ??
            StorageConditionsModel(
                privilegeLevelRequired:
                    PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple)
*/
    );
  }

  @override
  ProductModel updateItem(ProductModel model, ProductImageModel oldItem,
      ProductImageModel newItem) {
    List<ProductImageModel> currentItems =
        model.images == null ? [] : model.images!;
    var index = currentItems.indexOf(oldItem);
    if (index != -1) {
      var newItems = currentItems.map((e) => e).toList();
      newItems[index] = newItem;
      var newModel = model.copyWith(images: newItems);
      return newModel;
    } else {
      throw Exception("Could not find " + oldItem.toString());
    }
  }

  @override
  List<ProductImageModel> copyOf(List<ProductImageModel> ts) {
    return ts.map((t) => t).toList();
  }
}
