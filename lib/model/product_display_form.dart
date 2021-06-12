/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_display_form.dart
                       
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

import 'package:eliud_pkg_shop/model/product_display_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_display_list_event.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_display_form_bloc.dart';
import 'package:eliud_pkg_shop/model/product_display_form_event.dart';
import 'package:eliud_pkg_shop/model/product_display_form_state.dart';


class ProductDisplayForm extends StatelessWidget {
  FormAction formAction;
  ProductDisplayModel? value;
  ActionModel? submitAction;

  ProductDisplayForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<ProductDisplayFormBloc >(
            create: (context) => ProductDisplayFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseProductDisplayFormEvent(value: value)),
  
        child: MyProductDisplayForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<ProductDisplayFormBloc >(
            create: (context) => ProductDisplayFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseProductDisplayFormNoLoadEvent(value: value)),
  
        child: MyProductDisplayForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update ProductDisplay' : 'Add ProductDisplay'),
        body: BlocProvider<ProductDisplayFormBloc >(
            create: (context) => ProductDisplayFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseProductDisplayFormEvent(value: value) : InitialiseNewProductDisplayFormEvent())),
  
        child: MyProductDisplayForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyProductDisplayForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyProductDisplayForm({this.formAction, this.submitAction});

  _MyProductDisplayFormState createState() => _MyProductDisplayFormState(this.formAction);
}


class _MyProductDisplayFormState extends State<MyProductDisplayForm> {
  final FormAction? formAction;
  late ProductDisplayFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  String? _itemDetailBackground;
  final TextEditingController _addToBasketTextController = TextEditingController();
  String? _shop;


  _MyProductDisplayFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ProductDisplayFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _addToBasketTextController.addListener(_onAddToBasketTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ProductDisplayFormBloc, ProductDisplayFormState>(builder: (context, state) {
      if (state is ProductDisplayFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is ProductDisplayFormLoaded) {
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
        if (state.value!.itemDetailBackground != null)
          _itemDetailBackground= state.value!.itemDetailBackground!.documentID;
        else
          _itemDetailBackground= "";
        if (state.value!.addToBasketText != null)
          _addToBasketTextController.text = state.value!.addToBasketText.toString();
        else
          _addToBasketTextController.text = "";
        if (state.value!.shop != null)
          _shop= state.value!.shop!.documentID;
        else
          _shop= "";
      }
      if (state is ProductDisplayFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _itemDetailBackground, trigger: _onItemDetailBackgroundSelected, optional: true),
          );

        children.add(

                ActionField(AccessBloc.appId(context), state.value!.buyAction, _onBuyActionChanged)
          );

        children.add(

                DropdownButtonComponentFactory().createNew(id: "shops", value: _shop, trigger: _onShopSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDProductDisplayFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitleProductDisplayFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Add to basket text', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _addToBasketTextController, keyboardType: TextInputType.text, validator: (_) => state is AddToBasketTextProductDisplayFormError ? state.message : null, hintText: null)
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
                    if (state is ProductDisplayFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<ProductDisplayListBloc>(context).add(
                          UpdateProductDisplayList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              itemDetailBackground: state.value!.itemDetailBackground, 
                              addToBasketText: state.value!.addToBasketText, 
                              buyAction: state.value!.buyAction, 
                              shop: state.value!.shop, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<ProductDisplayListBloc>(context).add(
                          AddProductDisplayList(value: ProductDisplayModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              itemDetailBackground: state.value!.itemDetailBackground, 
                              addToBasketText: state.value!.addToBasketText, 
                              buyAction: state.value!.buyAction, 
                              shop: state.value!.shop, 
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
    _myFormBloc.add(ChangedProductDisplayDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedProductDisplayAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedProductDisplayTitle(value: _titleController.text));
  }


  void _onItemDetailBackgroundSelected(String? val) {
    setState(() {
      _itemDetailBackground = val;
    });
    _myFormBloc.add(ChangedProductDisplayItemDetailBackground(value: val));
  }


  void _onAddToBasketTextChanged() {
    _myFormBloc.add(ChangedProductDisplayAddToBasketText(value: _addToBasketTextController.text));
  }


  void _onBuyActionChanged(value) {
    _myFormBloc.add(ChangedProductDisplayBuyAction(value: value));
    
  }


  void _onShopSelected(String? val) {
    setState(() {
      _shop = val;
    });
    _myFormBloc.add(ChangedProductDisplayShop(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _addToBasketTextController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, ProductDisplayFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



