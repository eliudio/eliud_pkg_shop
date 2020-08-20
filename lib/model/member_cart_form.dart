/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_form.dart
                       
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


import 'member_cart_list_bloc.dart';
import 'member_cart_list_event.dart';
import 'member_cart_model.dart';
import 'member_cart_form_bloc.dart';
import 'member_cart_form_event.dart';
import 'member_cart_form_state.dart';


class MemberCartForm extends StatelessWidget {
  FormAction formAction;
  MemberCartModel value;
  ActionModel submitAction;

  MemberCartForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberCartFormBloc >(
            create: (context) => MemberCartFormBloc(
                                       formAction: formAction,

                                                )..add(InitialiseMemberCartFormEvent(value: value)),
  
        child: MyMemberCartForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberCartFormBloc >(
            create: (context) => MemberCartFormBloc(
                                       formAction: formAction,

                                                )..add(InitialiseMemberCartFormNoLoadEvent(value: value)),
  
        child: MyMemberCartForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update MemberCart", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add MemberCart", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<MemberCartFormBloc >(
            create: (context) => MemberCartFormBloc(
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberCartFormEvent(value: value) : InitialiseNewMemberCartFormEvent())),
  
        child: MyMemberCartForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberCartForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyMemberCartForm({this.formAction, this.submitAction});

  _MyMemberCartFormState createState() => _MyMemberCartFormState(this.formAction);
}


class _MyMemberCartFormState extends State<MyMemberCartForm> {
  final FormAction formAction;
  MemberCartFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();


  _MyMemberCartFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberCartFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberCartFormBloc, MemberCartFormState>(builder: (context, state) {
      if (state is MemberCartFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is MemberCartFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
      }
      if (state is MemberCartFormInitialized) {
        List<Widget> children = List();
        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'User UUID',
                    hintText: "User UUID",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDMemberCartFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: cartItemsList(state.value.items, _onItemsChanged)
                )
          );


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is MemberCartFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberCartListBloc>(context).add(
                          UpdateMemberCartList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              items: state.value.items, 
                        )));
                      } else {
                        BlocProvider.of<MemberCartListBloc>(context).add(
                          AddMemberCartList(value: MemberCartModel(
                              documentID: state.value.documentID, 
                              items: state.value.items, 
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
    _myFormBloc.add(ChangedMemberCartDocumentID(value: _documentIDController.text));
  }


  void _onItemsChanged(value) {
    _myFormBloc.add(ChangedMemberCartItems(value: value));
    setState(() {});
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    super.dispose();
  }

  bool _readOnly(MemberCartFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



