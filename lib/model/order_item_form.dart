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
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/internal_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_pkg_shop/model/model_export.dart';

import 'package:eliud_pkg_shop/model/order_item_list_bloc.dart';
import 'package:eliud_pkg_shop/model/order_item_list_event.dart';
import 'package:eliud_pkg_shop/model/order_item_model.dart';
import 'package:eliud_pkg_shop/model/order_item_form_bloc.dart';
import 'package:eliud_pkg_shop/model/order_item_form_event.dart';
import 'package:eliud_pkg_shop/model/order_item_form_state.dart';

class OrderItemForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final OrderItemModel? value;
  final ActionModel? submitAction;

  OrderItemForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the OrderItemForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<OrderItemFormBloc>(
        create: (context) => OrderItemFormBloc(
          appId,
        )..add(InitialiseOrderItemFormEvent(value: value)),
        child: _MyOrderItemForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<OrderItemFormBloc>(
        create: (context) => OrderItemFormBloc(
          appId,
        )..add(InitialiseOrderItemFormNoLoadEvent(value: value)),
        child: _MyOrderItemForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update OrderItem'
                      : 'Add OrderItem'),
          body: BlocProvider<OrderItemFormBloc>(
            create: (context) => OrderItemFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseOrderItemFormEvent(value: value)
                : InitialiseNewOrderItemFormEvent())),
            child: _MyOrderItemForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyOrderItemForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyOrderItemForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyOrderItemForm> createState() => _MyOrderItemFormState(formAction);
}

class _MyOrderItemFormState extends State<_MyOrderItemForm> {
  final FormAction? formAction;
  late OrderItemFormBloc _myFormBloc;

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _soldPriceController = TextEditingController();
  String? _product;

  _MyOrderItemFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<OrderItemFormBloc>(context);
    _amountController.addListener(_onAmountChanged);
    _appIdController.addListener(_onAppIdChanged);
    _soldPriceController.addListener(_onSoldPriceChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<OrderItemFormBloc, OrderItemFormState>(
        builder: (context, state) {
      if (state is OrderItemFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is OrderItemFormLoaded) {
        _amountController.text = state.value!.amount.toString();
        _appIdController.text = state.value!.appId.toString();
        _soldPriceController.text = state.value!.soldPrice.toString();
        if (state.value!.product != null) {
          _product = state.value!.product!.documentID;
        } else {
          _product = "";
        }
      }
      if (state is OrderItemFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Amount',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _amountController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is AmountOrderItemFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Price',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _soldPriceController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is SoldPriceOrderItemFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'App')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'App ID',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _appIdController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is AppIdOrderItemFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Product')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "products",
              value: _product,
              trigger: (value, privilegeLevel) => _onProductSelected(value),
              optional: false),
        );

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is OrderItemFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<OrderItemListBloc>(context)
                                .add(UpdateOrderItemList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              amount: state.value!.amount,
                              appId: state.value!.appId,
                              soldPrice: state.value!.soldPrice,
                              product: state.value!.product,
                            )));
                          } else {
                            BlocProvider.of<OrderItemListBloc>(context)
                                .add(AddOrderItemList(
                                    value: OrderItemModel(
                              documentID: state.value!.documentID,
                              amount: state.value!.amount,
                              appId: state.value!.appId,
                              soldPrice: state.value!.soldPrice,
                              product: state.value!.product,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onAmountChanged() {
    _myFormBloc.add(ChangedOrderItemAmount(value: _amountController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedOrderItemAppId(value: _appIdController.text));
  }

  void _onSoldPriceChanged() {
    _myFormBloc
        .add(ChangedOrderItemSoldPrice(value: _soldPriceController.text));
  }

  void _onProductSelected(String? val) {
    setState(() {
      _product = val;
    });
    _myFormBloc.add(ChangedOrderItemProduct(value: val));
  }

  @override
  void dispose() {
    _amountController.dispose();
    _appIdController.dispose();
    _soldPriceController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, OrderItemFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
