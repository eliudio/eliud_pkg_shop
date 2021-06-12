/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_pkg_shop/model/embedded_component.dart';
import 'package:eliud_pkg_shop/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_pkg_shop/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/product_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_list_event.dart';
import 'package:eliud_pkg_shop/model/product_model.dart';
import 'package:eliud_pkg_shop/model/product_form_bloc.dart';
import 'package:eliud_pkg_shop/model/product_form_event.dart';
import 'package:eliud_pkg_shop/model/product_form_state.dart';


class ProductForm extends StatelessWidget {
  FormAction formAction;
  ProductModel? value;
  ActionModel? submitAction;

  ProductForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<ProductFormBloc >(
            create: (context) => ProductFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseProductFormEvent(value: value)),
  
        child: MyProductForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<ProductFormBloc >(
            create: (context) => ProductFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseProductFormNoLoadEvent(value: value)),
  
        child: MyProductForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update Product' : 'Add Product'),
        body: BlocProvider<ProductFormBloc >(
            create: (context) => ProductFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseProductFormEvent(value: value) : InitialiseNewProductFormEvent())),
  
        child: MyProductForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyProductForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyProductForm({this.formAction, this.submitAction});

  _MyProductFormState createState() => _MyProductFormState(this.formAction);
}


class _MyProductFormState extends State<MyProductForm> {
  final FormAction? formAction;
  late ProductFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String? _shop;
  String? _posSize;


  _MyProductFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ProductFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _aboutController.addListener(_onAboutChanged);
    _priceController.addListener(_onPriceChanged);
    _weightController.addListener(_onWeightChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ProductFormBloc, ProductFormState>(builder: (context, state) {
      if (state is ProductFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is ProductFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.title != null)
          _titleController.text = state.value!.title.toString();
        else
          _titleController.text = "";
        if (state.value!.about != null)
          _aboutController.text = state.value!.about.toString();
        else
          _aboutController.text = "";
        if (state.value!.price != null)
          _priceController.text = state.value!.price.toString();
        else
          _priceController.text = "";
        if (state.value!.weight != null)
          _weightController.text = state.value!.weight.toString();
        else
          _weightController.text = "";
        if (state.value!.shop != null)
          _shop= state.value!.shop!.documentID;
        else
          _shop= "";
        if (state.value!.posSize != null)
          _posSize= state.value!.posSize!.documentID;
        else
          _posSize= "";
      }
      if (state is ProductFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDProductFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Title', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitleProductFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'About', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _aboutController, keyboardType: TextInputType.text, validator: (_) => state is AboutProductFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Price', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _priceController, keyboardType: TextInputType.number, validator: (_) => state is PriceProductFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Weight', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _weightController, keyboardType: TextInputType.number, validator: (_) => state is WeightProductFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Shop')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "shops", value: _shop, trigger: _onShopSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Images')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: productImagesList(context, state.value!.images, _onImagesChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Position and Size of images')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "posSizes", value: _posSize, trigger: _onPosSizeSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Conditions')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is ProductFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<ProductListBloc>(context).add(
                          UpdateProductList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              about: state.value!.about, 
                              price: state.value!.price, 
                              weight: state.value!.weight, 
                              shop: state.value!.shop, 
                              images: state.value!.images, 
                              posSize: state.value!.posSize, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<ProductListBloc>(context).add(
                          AddProductList(value: ProductModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              about: state.value!.about, 
                              price: state.value!.price, 
                              weight: state.value!.weight, 
                              shop: state.value!.shop, 
                              images: state.value!.images, 
                              posSize: state.value!.posSize, 
                              conditions: state.value!.conditions, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedProductDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedProductAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedProductTitle(value: _titleController.text));
  }


  void _onAboutChanged() {
    _myFormBloc.add(ChangedProductAbout(value: _aboutController.text));
  }


  void _onPriceChanged() {
    _myFormBloc.add(ChangedProductPrice(value: _priceController.text));
  }


  void _onWeightChanged() {
    _myFormBloc.add(ChangedProductWeight(value: _weightController.text));
  }


  void _onShopSelected(String? val) {
    setState(() {
      _shop = val;
    });
    _myFormBloc.add(ChangedProductShop(value: val));
  }


  void _onImagesChanged(value) {
    _myFormBloc.add(ChangedProductImages(value: value));
    setState(() {});
  }


  void _onPosSizeSelected(String? val) {
    setState(() {
      _posSize = val;
    });
    _myFormBloc.add(ChangedProductPosSize(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _aboutController.dispose();
    _priceController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, ProductFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



