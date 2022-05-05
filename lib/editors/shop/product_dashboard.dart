import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/tools/helpers/parse_helper.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/tools/widgets/pos_size_widget.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/product_image_model.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_core/package/access_rights.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';

import 'product_bloc/product_bloc.dart';
import 'product_image_widget.dart';

class ProductDashboard extends StatefulWidget {
  static void updateProduct(
      AppModel app, BuildContext context, ShopModel shop, model) {
    _openIt(app, context, shop, false, model);
  }

  static void createNewProduct(
      AppModel app, BuildContext context, ShopModel shop) {
    _openIt(
      app,
      context,
      shop,
      true,
      ProductModel(
        appId: app.documentID,
        documentID: newRandomKey(),
        shop: shop,
/*
        conditions: StorageConditionsModel(
            privilegeLevelRequired:
            PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
*/
      ),
    );
  }

  static void _openIt(AppModel app, BuildContext context, ShopModel shop, bool create,
      ProductModel model) {
    openComplexDialog(app, context, app.documentID! + '/Product',
        title: create ? 'Create product' : 'Update product',
        includeHeading: false,
        widthFraction: .9,
        child: BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
            app.documentID!,
                (_) {},
            shop,
          )..add(ExtEditorBaseInitialise<ProductModel>(model)),
          child: ProductDashboard(
            app: app,
          ),
        ));
  }
  final AppModel app;

  const ProductDashboard({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductDashboardState();
}

class _ProductDashboardState extends State<ProductDashboard> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
          if (accessState is AccessDetermined) {
            return BlocBuilder<ProductBloc, ExtEditorBaseState<ProductModel>>(
                builder: (ppContext, productState) {
                  if (productState is ExtEditorBaseInitialised<ProductModel, dynamic>) {
                    return ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: [
                          HeaderWidget(
                            app: widget.app,
                            title: 'Product',
                            okAction: () async {
                              await BlocProvider.of<ProductBloc>(context)
                                  .save(ExtEditorBaseApplyChanges<ProductModel>(model: productState.model));
                              return true;
                            },
                            cancelAction: () async {
                              return true;
                            },
                          ),
                          topicContainer(widget.app, context,
                              title: 'General',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.vpn_key),
                                    title: text(widget.app, context,
                                        productState.model.documentID!)),
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: productState.model.title,
                                      valueChanged: (value) {
                                        productState.model.title = value;
                                      },
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'Title',
                                        labelText: 'Title',
                                      ),
                                    )),
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: productState.model.about,
                                      valueChanged: (value) {
                                        productState.model.about = value;
                                      },
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                        hintText: 'About',
                                        labelText: 'About',
                                      ),
                                    )),
                              ]),
                          topicContainer(widget.app, context,
                              title: 'Values',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: productState.model.price != null
                                          ? productState.model.price.toString()
                                          : '0.0',
                                      keyboardType: TextInputType.numberWithOptions(
                                        signed: false,
                                      ),
                                      valueChanged: (value) {
                                        productState.model.price = double_parse(value);
                                      },
                                      decoration: const InputDecoration(
                                        hintText: 'Price',
                                        labelText: 'Price',
                                      ),
                                    )),
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: productState.model.weight != null
                                          ? productState.model.weight.toString()
                                          : '0.0',
                                      keyboardType: TextInputType.numberWithOptions(
                                        signed: false,
                                      ),
                                      valueChanged: (value) {
                                        productState.model.weight = double_parse(value);
                                      },
                                      decoration: const InputDecoration(
                                        hintText: 'Weight',
                                        labelText: 'Weight',
                                      ),
                                    )),
                              ]),
                          PosSizeWidget(
                            app: widget.app,
                            posSizeModel: productState.model.posSize ?? ProductBloc.defaultPosSize(),
                          ),
/*
                          topicContainer(widget.app, context,
                              title: 'Condition',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.security),
                                    title: ConditionsSimpleWidget(
                                      app: widget.app,
                                      value: productState.model.conditions!,
                                      readOnly: productState.model.images != null && productState.model.images!.isNotEmpty,
                                    )),
                              ]),
*/
                          topicContainer(widget.app, context,
                              title: 'Images',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                _images(context, productState),
                              ]),
                        ]);
                  } else {
                    return progressIndicator(widget.app, context);
                  }
                });
          } else {
            return progressIndicator(widget.app, context);
          }
        });
  }

  Widget _images(BuildContext context, ExtEditorBaseInitialised<ProductModel, dynamic> state) {
    var widgets = <Widget>[];
    var items = state.model.images != null ? state.model.images! : [];
    if (state.model.images != null) {
      var photos = <PlatformMediumModel>[];
      items.forEach((item) {
        if (item.image != null) {
          photos.add(item.image!);
        }
      });
    }
    for (var item in items) {
      var medium = item.image;
      if (medium != null) {
        widgets.add(GestureDetector(
            onTap: () {
              BlocProvider.of<ProductBloc>(context)
                  .add(SelectForEditEvent<ProductModel, ProductImageModel>(item: item));
            },
            child: Padding(
                padding: const EdgeInsets.all(5), child: item == state.currentEdit ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 1 ),
                ),
                child: Image.network(
                  medium.url!,
                  //            height: height,
                )
            ) : Image.network(
              medium.url!,
              //            height: height,
            ))
        ));
      }
    }
    widgets.add(_addButton(state));

    var theWidget = GridView.extent(
        maxCrossAxisExtent: 200,
        padding: const EdgeInsets.all(0),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        physics: const ScrollPhysics(), // to disable GridView's scrolling
        shrinkWrap: true,
        children: widgets);

    if (state.currentEdit != null) {
      var currentEdit = state.currentEdit!;
      return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
        theWidget,
        divider(widget.app, context),
        Row(children: [
          button(widget.app, context,
              icon: Icon(
                Icons.arrow_left,
              ),
              label: 'Move up',
              onPressed: () async {
                BlocProvider.of<ProductBloc>(context)
                    .add(MoveEvent<ProductModel, ProductImageModel>(isUp: true, item: currentEdit));

              }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.edit,
              ),
              label: 'Edit',
              onPressed: () async {
                openFlexibleDialog(
                  widget.app,
                  context,
                  widget.app.documentID! + '/_listeditem',
                  includeHeading: false,
                  widthFraction: .8,
                  child: ProductImageModelWidget.getIt(
                    context,
                    widget.app,
                    false,
                    fullScreenWidth(context) * .8,
                    fullScreenHeight(context) - 100,
                    currentEdit,
                        (newItem) => _listedItemModelCallback(currentEdit, newItem),
                  ),
                );
              }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.delete,
              ),
              label: 'Delete',
              onPressed: () async {
                BlocProvider.of<ProductBloc>(context)
                    .add(DeleteItemEvent<ProductModel, ProductImageModel>(itemModel: currentEdit));
              }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.arrow_right,
              ),
              label: 'Move down',
              onPressed: () async {
                BlocProvider.of<ProductBloc>(context)
                    .add(MoveEvent<ProductModel, ProductImageModel>(isUp: false, item: currentEdit));

              }),
        ]),      ]);
    } else {
      return theWidget;
    }
  }

  void _listedItemModelCallback(ProductImageModel oldItem, ProductImageModel newItem, ) {
    BlocProvider.of<ProductBloc>(context)
        .add(UpdateItemEvent<ProductModel, ProductImageModel>(oldItem: oldItem, newItem: newItem));
  }

  Widget _addButton(ExtEditorBaseInitialised<ProductModel, dynamic> productState) {
    if (_progress != null) {
      return progressIndicatorWithValue(widget.app, context, value: _progress!);
    } else {
      return PopupMenuButton<int>(
          child: Icon(Icons.add),
          elevation: 10,
          itemBuilder: (context) => [
            if (Registry.registry()!.getMediumApi().hasCamera())
              PopupMenuItem(
                value: 0,
                child: text(widget.app, context, 'Take photo'),
              ),
            PopupMenuItem(
              value: 1,
              child: text(widget.app, context, 'Upload image'),
            ),
          ],
          onSelected: (value) async {
            if (value == 0) {
              Registry.registry()!.getMediumApi().takePhoto(
                  context,
                  widget.app,
                  widget.app.ownerID!,
                      () => PlatformMediumAccessRights(
                          PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
//                      productState.model.conditions!.privilegeLevelRequired!),
                      (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            } else if (value == 1) {
              Registry.registry()!.getMediumApi().uploadPhoto(
                  context,
                  widget.app,
                  widget.app.ownerID!,
                      () => PlatformMediumAccessRights(
                          PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
//                      productState.model.conditions!.privilegeLevelRequired!),
                      (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            }
          });
    }
  }

  void _photoFeedbackFunction(PlatformMediumModel? platformMediumModel) {
    setState(() {
      _progress = null;
      if (platformMediumModel != null) {
        BlocProvider.of<ProductBloc>(context)
            .add(AddItemEvent<ProductModel, ProductImageModel>(itemModel: ProductImageModel(
          documentID: newRandomKey(),
          image: platformMediumModel,
        )));
      }
    });
  }

  void _photoUploading(dynamic progress) {
    if (progress != null) {}
    setState(() {
      _progress = progress;
    });
  }
}
