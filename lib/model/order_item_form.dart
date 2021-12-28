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

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
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
  final AppModel app;
  FormAction formAction;
  OrderItemModel? value;
  ActionModel? submitAction;

  OrderItemForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<OrderItemFormBloc >(
            create: (context) => OrderItemFormBloc(appId,
                                       
                                                )..add(InitialiseOrderItemFormEvent(value: value)),
  
        child: MyOrderItemForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<OrderItemFormBloc >(
            create: (context) => OrderItemFormBloc(appId,
                                       
                                                )..add(InitialiseOrderItemFormNoLoadEvent(value: value)),
  
        child: MyOrderItemForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update OrderItem' : 'Add OrderItem'),
        body: BlocProvider<OrderItemFormBloc >(
            create: (context) => OrderItemFormBloc(appId,
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseOrderItemFormEvent(value: value) : InitialiseNewOrderItemFormEvent())),
  
        child: MyOrderItemForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyOrderItemForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyOrderItemForm({required this.app, this.formAction, this.submitAction});

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
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<OrderItemFormBloc, OrderItemFormState>(builder: (context, state) {
      if (state is OrderItemFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
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
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Amount', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _amountController, keyboardType: TextInputType.number, validator: (_) => state is AmountOrderItemFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Price', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _soldPriceController, keyboardType: TextInputType.number, validator: (_) => state is SoldPriceOrderItemFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'App')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'App ID', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _appIdController, keyboardType: TextInputType.text, validator: (_) => state is AppIdOrderItemFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Product')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "products", value: _product, trigger: _onProductSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
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
                ));

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
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
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID!));
  }
  

}



