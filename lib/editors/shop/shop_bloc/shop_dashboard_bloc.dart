import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/product_model.dart';
import 'package:eliud_pkg_shop_model/model/shop_model.dart';

import 'shop_dashboard_event.dart';
import 'shop_dashboard_state.dart';

class ShopDashboardBloc
    extends Bloc<ShopDashboardBaseEvent, ShopDashboardBaseState> {
  final String appId;
  final EditorFeedback feedback;
  StreamSubscription? _productSubscription;

  ShopModel addItem(ShopModel model, ProductModel newItem) {
    productRepository(appId: appId)!.add(newItem);
    return model;
  }

  ShopModel deleteItem(ShopModel model, ProductModel deleteItem) {
    productRepository(appId: appId)!.delete(deleteItem);
    return model;
  }

  void updateItem(ShopModel model, ProductModel oldItem, ProductModel newItem) {
    productRepository(appId: appId)!.update(newItem);
  }

  void _loadProducts(String shopId) async {
    await _productSubscription?.cancel();
    _productSubscription = productRepository(appId: appId)!.listenWithDetails(
      (List<ProductModel?> list) {
        add(ProductListUpdated(list.map((e) => e!).toList()));
      },
      eliudQuery: EliudQuery(theConditions: [
        EliudQueryCondition('shopId', isEqualTo: shopId),
      ]),
    );
  }

  ShopDashboardBloc(this.appId, this.feedback)
      : super(ShopDashboardUninitialised()) {
    on<ShopDashboardInitialise>((event, emit) async {
      // retrieve the model, as it was retrieved without links
      var modelWithLinks =
          await shopRepository(appId: appId)!.get(event.model.documentID);
      if (modelWithLinks == null) {
        var shopId = newRandomKey();
        modelWithLinks = ShopModel(
            appId: appId, documentID: shopId, description: 'new shop');
      }
      _loadProducts(modelWithLinks.documentID);
      emit(ShopDashboardLoaded(
        shop: modelWithLinks,
      ));
    });

    on<ProductListUpdated>((event, emit) {
      if (state is ShopDashboardInitialised) {
        var theState = state as ShopDashboardInitialised;
        emit(ShopDashboardLoaded(shop: theState.shop, values: event.values));
      }
    });

    on<SelectForEditEvent>((event, emit) {
      if (state is ShopDashboardInitialised) {
        var theState = state as ShopDashboardInitialised;
        emit(ShopDashboardLoaded(
          shop: theState.shop,
          values: theState.values,
        ));
      }
    });
  }

  Future<void> save(ShopDashboardApplyChanges event) async {
    if (state is ShopDashboardInitialised) {
      var theState = state as ShopDashboardInitialised;
      var newModel = theState.shop;
      if (await shopRepository(appId: appId)!.get(newModel.documentID) ==
          null) {
        await shopRepository(appId: appId)!.add(newModel);
      } else {
        await shopRepository(appId: appId)!.update(newModel);
      }
      feedback(true, newModel);
    }
  }
}
