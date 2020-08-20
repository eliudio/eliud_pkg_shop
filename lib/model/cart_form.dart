/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_model/core/global_data.dart';

// import the main repository
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';
// import the shared repository
import 'package:eliud_model/shared/abstract_repository_singleton.dart';
// import the repository of this package:
import '../shared/abstract_repository_singleton.dart';

import 'package:eliud_model/shared/action_model.dart';
import 'package:eliud_model/core/navigate/router.dart';
import 'package:eliud_model/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_model/core/eliud.dart';

import 'package:eliud_model/shared/internal_component.dart';
import 'package:eliud_model/shared/embedded_component.dart';
import '../shared/embedded_component.dart';
import 'package:eliud_model/shared/bespoke_formfields.dart';

import 'package:eliud_model/tools/enums.dart';
import 'package:eliud_model/tools/etc.dart';


import 'cart_list_bloc.dart';
import 'cart_list_event.dart';
import 'cart_model.dart';
import 'cart_form_bloc.dart';
import 'cart_form_event.dart';
import 'cart_form_state.dart';


class CartForm extends StatelessWidget {
  FormAction formAction;
  CartModel value;
  ActionModel submitAction;

  CartForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<CartFormBloc >(
            create: (context) => CartFormBloc(
                                       formAction: formAction,

                                                )..add(InitialiseCartFormEvent(value: value)),
  
        child: MyCartForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<CartFormBloc >(
            create: (context) => CartFormBloc(
                                       formAction: formAction,

                                                )..add(InitialiseCartFormNoLoadEvent(value: value)),
  
        child: MyCartForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Cart", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Cart", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<CartFormBloc >(
            create: (context) => CartFormBloc(
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseCartFormEvent(value: value) : InitialiseNewCartFormEvent())),
  
        child: MyCartForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyCartForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyCartForm({this.formAction, this.submitAction});

  _MyCartFormState createState() => _MyCartFormState(this.formAction);
}


class _MyCartFormState extends State<MyCartForm> {
  final FormAction formAction;
  CartFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _checkoutTextController = TextEditingController();
  String _shop;
  String _itemImageBackground;
  String _itemDetailBackground;


  _MyCartFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<CartFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _checkoutTextController.addListener(_onCheckoutTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartFormBloc, CartFormState>(builder: (context, state) {
      if (state is CartFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is CartFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.title != null)
          _titleController.text = state.value.title.toString();
        else
          _titleController.text = "";
        if (state.value.description != null)
          _descriptionController.text = state.value.description.toString();
        else
          _descriptionController.text = "";
        if (state.value.checkoutText != null)
          _checkoutTextController.text = state.value.checkoutText.toString();
        else
          _checkoutTextController.text = "";
        if (state.value.shop != null)
          _shop= state.value.shop.documentID;
        else
          _shop= "";
        if (state.value.itemImageBackground != null)
          _itemImageBackground= state.value.itemImageBackground.documentID;
        else
          _itemImageBackground= "";
        if (state.value.itemDetailBackground != null)
          _itemDetailBackground= state.value.itemDetailBackground.documentID;
        else
          _itemDetailBackground= "";
      }
      if (state is CartFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Document ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDCartFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _titleController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'description',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is TitleCartFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'description',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DescriptionCartFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _checkoutTextController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Checkout text',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is CheckoutTextCartFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Checkout Action',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                ActionField(state.value.checkoutAction, _onCheckoutActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Continue Shopping Action',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                ActionField(state.value.backToShopAction, _onBackToShopActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Shop',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "shops", value: _shop, trigger: _onShopSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Item Image Background',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _itemImageBackground, trigger: _onItemImageBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Item Detail Background',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _itemDetailBackground, trigger: _onItemDetailBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Checkout Action',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                ActionField(state.value.checkoutAction, _onCheckoutActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is CartFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<CartListBloc>(context).add(
                          UpdateCartList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              description: state.value.description, 
                              checkoutText: state.value.checkoutText, 
                              shop: state.value.shop, 
                              itemImageBackground: state.value.itemImageBackground, 
                              itemDetailBackground: state.value.itemDetailBackground, 
                              checkoutAction: state.value.checkoutAction, 
                              backToShopAction: state.value.backToShopAction, 
                        )));
                      } else {
                        BlocProvider.of<CartListBloc>(context).add(
                          AddCartList(value: CartModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              description: state.value.description, 
                              checkoutText: state.value.checkoutText, 
                              shop: state.value.shop, 
                              itemImageBackground: state.value.itemImageBackground, 
                              itemDetailBackground: state.value.itemDetailBackground, 
                              checkoutAction: state.value.checkoutAction, 
                              backToShopAction: state.value.backToShopAction, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        Router.navigateTo(context, widget.submitAction);
                      } else {
                        Navigator.pop(context);
                      }
                      return true;
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(GlobalData.app().formBackground),
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children
            ),
          )
        );
      } else {
        return CircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedCartDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedCartAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedCartTitle(value: _titleController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedCartDescription(value: _descriptionController.text));
  }


  void _onCheckoutTextChanged() {
    _myFormBloc.add(ChangedCartCheckoutText(value: _checkoutTextController.text));
  }


  void _onShopSelected(String val) {
    setState(() {
      _shop = val;
    });
    _myFormBloc.add(ChangedCartShop(value: val));
  }


  void _onItemImageBackgroundSelected(String val) {
    setState(() {
      _itemImageBackground = val;
    });
    _myFormBloc.add(ChangedCartItemImageBackground(value: val));
  }


  void _onItemDetailBackgroundSelected(String val) {
    setState(() {
      _itemDetailBackground = val;
    });
    _myFormBloc.add(ChangedCartItemDetailBackground(value: val));
  }


  void _onCheckoutActionChanged(value) {
    _myFormBloc.add(ChangedCartCheckoutAction(value: value));
    
  }


  void _onBackToShopActionChanged(value) {
    _myFormBloc.add(ChangedCartBackToShopAction(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _checkoutTextController.dispose();
    super.dispose();
  }

  bool _readOnly(CartFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



