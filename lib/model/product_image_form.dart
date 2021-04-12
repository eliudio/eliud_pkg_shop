/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_form.dart
                       
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

import 'package:eliud_pkg_shop/model/product_image_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_image_list_event.dart';
import 'package:eliud_pkg_shop/model/product_image_model.dart';
import 'package:eliud_pkg_shop/model/product_image_form_bloc.dart';
import 'package:eliud_pkg_shop/model/product_image_form_event.dart';
import 'package:eliud_pkg_shop/model/product_image_form_state.dart';


class ProductImageForm extends StatelessWidget {
  FormAction formAction;
  ProductImageModel? value;
  ActionModel? submitAction;

  ProductImageForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<ProductImageFormBloc >(
            create: (context) => ProductImageFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseProductImageFormEvent(value: value)),
  
        child: MyProductImageForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<ProductImageFormBloc >(
            create: (context) => ProductImageFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseProductImageFormNoLoadEvent(value: value)),
  
        child: MyProductImageForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update ProductImage", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app!.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add ProductImage", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app!.formAppBarBackground)),
                ),
        body: BlocProvider<ProductImageFormBloc >(
            create: (context) => ProductImageFormBloc(AccessBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseProductImageFormEvent(value: value) : InitialiseNewProductImageFormEvent())),
  
        child: MyProductImageForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyProductImageForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyProductImageForm({this.formAction, this.submitAction});

  _MyProductImageFormState createState() => _MyProductImageFormState(this.formAction);
}


class _MyProductImageFormState extends State<MyProductImageForm> {
  final FormAction? formAction;
  late ProductImageFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  String? _image;


  _MyProductImageFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ProductImageFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ProductImageFormBloc, ProductImageFormState>(builder: (context, state) {
      if (state is ProductImageFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is ProductImageFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.image != null)
          _image= state.value!.image!.documentID;
        else
          _image= "";
      }
      if (state is ProductImageFormInitialized) {
        List<Widget?> children = [];
        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberMediums", value: _image, trigger: _onImageSelected, optional: false),
          );


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app!.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is ProductImageFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<ProductImageListBloc>(context).add(
                          UpdateProductImageList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              image: state.value!.image, 
                        )));
                      } else {
                        BlocProvider.of<ProductImageListBloc>(context).add(
                          AddProductImageList(value: ProductImageModel(
                              documentID: state.value!.documentID, 
                              image: state.value!.image, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: app!.formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(accessState, app!.formBackground),
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          )
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedProductImageDocumentID(value: _documentIDController.text));
  }


  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedProductImageImage(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, ProductImageFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



