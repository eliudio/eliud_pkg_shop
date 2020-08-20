/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_form.dart
                       
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


import 'pay_list_bloc.dart';
import 'pay_list_event.dart';
import 'pay_model.dart';
import 'pay_form_bloc.dart';
import 'pay_form_event.dart';
import 'pay_form_state.dart';


class PayForm extends StatelessWidget {
  FormAction formAction;
  PayModel value;
  ActionModel submitAction;

  PayForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PayFormBloc >(
            create: (context) => PayFormBloc(
                                       formAction: formAction,

                                                )..add(InitialisePayFormEvent(value: value)),
  
        child: MyPayForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PayFormBloc >(
            create: (context) => PayFormBloc(
                                       formAction: formAction,

                                                )..add(InitialisePayFormNoLoadEvent(value: value)),
  
        child: MyPayForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Pay", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Pay", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<PayFormBloc >(
            create: (context) => PayFormBloc(
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePayFormEvent(value: value) : InitialiseNewPayFormEvent())),
  
        child: MyPayForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPayForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyPayForm({this.formAction, this.submitAction});

  _MyPayFormState createState() => _MyPayFormState(this.formAction);
}


class _MyPayFormState extends State<MyPayForm> {
  final FormAction formAction;
  PayFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  String _shop;


  _MyPayFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PayFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayFormBloc, PayFormState>(builder: (context, state) {
      if (state is PayFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is PayFormLoaded) {
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
        if (state.value.shop != null)
          _shop= state.value.shop.documentID;
        else
          _shop= "";
      }
      if (state is PayFormInitialized) {
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
                    return state is DocumentIDPayFormError ? state.message : null;
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
                    return state is TitlePayFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Succeeded Action',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                ActionField(state.value.succeeded, _onSucceededChanged)
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


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is PayFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<PayListBloc>(context).add(
                          UpdatePayList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              succeeded: state.value.succeeded, 
                              shop: state.value.shop, 
                        )));
                      } else {
                        BlocProvider.of<PayListBloc>(context).add(
                          AddPayList(value: PayModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              succeeded: state.value.succeeded, 
                              shop: state.value.shop, 
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
    _myFormBloc.add(ChangedPayDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPayAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedPayTitle(value: _titleController.text));
  }


  void _onSucceededChanged(value) {
    _myFormBloc.add(ChangedPaySucceeded(value: value));
    
  }


  void _onShopSelected(String val) {
    setState(() {
      _shop = val;
    });
    _myFormBloc.add(ChangedPayShop(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  bool _readOnly(PayFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



