/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_form.dart
                       
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

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import 'package:eliud_pkg_shop/model/embedded_component.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';

import 'package:eliud_pkg_shop/model/order_item_list_bloc.dart';
import 'package:eliud_pkg_shop/model/order_item_list_event.dart';
import 'package:eliud_pkg_shop/model/order_item_model.dart';
import 'package:eliud_pkg_shop/model/order_item_form_bloc.dart';
import 'package:eliud_pkg_shop/model/order_item_form_event.dart';
import 'package:eliud_pkg_shop/model/order_item_form_state.dart';


class OrderItemForm extends StatelessWidget {
  FormAction formAction;
  OrderItemModel? value;
  ActionModel? submitAction;

  OrderItemForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<OrderItemFormBloc >(
            create: (context) => OrderItemFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseOrderItemFormEvent(value: value)),
  
        child: MyOrderItemForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<OrderItemFormBloc >(
            create: (context) => OrderItemFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseOrderItemFormNoLoadEvent(value: value)),
  
        child: MyOrderItemForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update OrderItem", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app!.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add OrderItem", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app!.formAppBarBackground)),
                ),
        body: BlocProvider<OrderItemFormBloc >(
            create: (context) => OrderItemFormBloc(AccessBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseOrderItemFormEvent(value: value) : InitialiseNewOrderItemFormEvent())),
  
        child: MyOrderItemForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyOrderItemForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyOrderItemForm({this.formAction, this.submitAction});

  _MyOrderItemFormState createState() => _MyOrderItemFormState(this.formAction);
}


class _MyOrderItemFormState extends State<MyOrderItemForm> {
  final FormAction? formAction;
  late OrderItemFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _soldPriceController = TextEditingController();
  String? _product;


  _MyOrderItemFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<OrderItemFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _amountController.addListener(_onAmountChanged);
    _appIdController.addListener(_onAppIdChanged);
    _soldPriceController.addListener(_onSoldPriceChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<OrderItemFormBloc, OrderItemFormState>(builder: (context, state) {
      if (state is OrderItemFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is OrderItemFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.amount != null)
          _amountController.text = state.value!.amount.toString();
        else
          _amountController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.soldPrice != null)
          _soldPriceController.text = state.value!.soldPrice.toString();
        else
          _soldPriceController.text = "";
        if (state.value!.product != null)
          _product= state.value!.product!.documentID;
        else
          _product= "";
      }
      if (state is OrderItemFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app!.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _amountController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app!.formFieldHeaderColor)),
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is AmountOrderItemFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _soldPriceController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app!.formFieldHeaderColor)),
                    labelText: 'Price',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is SoldPriceOrderItemFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app!.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('App',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app!.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _appIdController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app!.formFieldHeaderColor)),
                    labelText: 'App ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is AppIdOrderItemFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app!.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Product',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app!.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "products", value: _product, trigger: _onProductSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app!.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app!.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is OrderItemFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<OrderItemListBloc>(context).add(
                          UpdateOrderItemList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              amount: state.value!.amount, 
                              appId: state.value!.appId, 
                              soldPrice: state.value!.soldPrice, 
                              product: state.value!.product, 
                        )));
                      } else {
                        BlocProvider.of<OrderItemListBloc>(context).add(
                          AddOrderItemList(value: OrderItemModel(
                              documentID: state.value!.documentID, 
                              amount: state.value!.amount, 
                              appId: state.value!.appId, 
                              soldPrice: state.value!.soldPrice, 
                              product: state.value!.product, 
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
    _myFormBloc.add(ChangedOrderItemDocumentID(value: _documentIDController.text));
  }


  void _onAmountChanged() {
    _myFormBloc.add(ChangedOrderItemAmount(value: _amountController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedOrderItemAppId(value: _appIdController.text));
  }


  void _onSoldPriceChanged() {
    _myFormBloc.add(ChangedOrderItemSoldPrice(value: _soldPriceController.text));
  }


  void _onProductSelected(String? val) {
    setState(() {
      _product = val;
    });
    _myFormBloc.add(ChangedOrderItemProduct(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _amountController.dispose();
    _appIdController.dispose();
    _soldPriceController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, OrderItemFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



