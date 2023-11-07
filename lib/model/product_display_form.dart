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

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';

import 'package:eliud_pkg_shop/model/product_display_list_bloc.dart';
import 'package:eliud_pkg_shop/model/product_display_list_event.dart';
import 'package:eliud_pkg_shop/model/product_display_model.dart';
import 'package:eliud_pkg_shop/model/product_display_form_bloc.dart';
import 'package:eliud_pkg_shop/model/product_display_form_event.dart';
import 'package:eliud_pkg_shop/model/product_display_form_state.dart';

class ProductDisplayForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final ProductDisplayModel? value;
  final ActionModel? submitAction;

  ProductDisplayForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the ProductDisplayForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<ProductDisplayFormBloc>(
        create: (context) => ProductDisplayFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseProductDisplayFormEvent(value: value)),
        child: MyProductDisplayForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<ProductDisplayFormBloc>(
        create: (context) => ProductDisplayFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseProductDisplayFormNoLoadEvent(value: value)),
        child: MyProductDisplayForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update ProductDisplay'
                      : 'Add ProductDisplay'),
          body: BlocProvider<ProductDisplayFormBloc>(
            create: (context) => ProductDisplayFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseProductDisplayFormEvent(value: value)
                : InitialiseNewProductDisplayFormEvent())),
            child: MyProductDisplayForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyProductDisplayForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyProductDisplayForm({required this.app, this.formAction, this.submitAction});

  @override
  State<MyProductDisplayForm> createState() =>
      _MyProductDisplayFormState(formAction);
}

class _MyProductDisplayFormState extends State<MyProductDisplayForm> {
  final FormAction? formAction;
  late ProductDisplayFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addToBasketTextController =
      TextEditingController();
  String? _shop;

  _MyProductDisplayFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ProductDisplayFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _addToBasketTextController.addListener(_onAddToBasketTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ProductDisplayFormBloc, ProductDisplayFormState>(
        builder: (context, state) {
      if (state is ProductDisplayFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is ProductDisplayFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _descriptionController.text = state.value!.description.toString();
        _addToBasketTextController.text =
            state.value!.addToBasketText.toString();
        if (state.value!.shop != null) {
          _shop = state.value!.shop!.documentID;
        } else {
          _shop = "";
        }
      }
      if (state is ProductDisplayFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(ActionField(
            widget.app, state.value!.buyAction, _onBuyActionChanged));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "shops",
              value: _shop,
              trigger: (value, privilegeLevel) => _onShopSelected(value),
              optional: false),
        );

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
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DocumentIDProductDisplayFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionProductDisplayFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Add to basket text',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _addToBasketTextController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is AddToBasketTextProductDisplayFormError
                        ? state.message
                        : null,
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
                .groupTitle(widget.app, context, 'Conditions')));

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
                        if (state is ProductDisplayFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<ProductDisplayListBloc>(context)
                                .add(UpdateProductDisplayList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              itemDetailBackground:
                                  state.value!.itemDetailBackground,
                              addToBasketText: state.value!.addToBasketText,
                              buyAction: state.value!.buyAction,
                              shop: state.value!.shop,
                              background: state.value!.background,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<ProductDisplayListBloc>(context)
                                .add(AddProductDisplayList(
                                    value: ProductDisplayModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              itemDetailBackground:
                                  state.value!.itemDetailBackground,
                              addToBasketText: state.value!.addToBasketText,
                              buyAction: state.value!.buyAction,
                              shop: state.value!.shop,
                              background: state.value!.background,
                              conditions: state.value!.conditions,
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

  void _onDocumentIDChanged() {
    _myFormBloc.add(
        ChangedProductDisplayDocumentID(value: _documentIDController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(
        ChangedProductDisplayDescription(value: _descriptionController.text));
  }

  void _onAddToBasketTextChanged() {
    _myFormBloc.add(ChangedProductDisplayAddToBasketText(
        value: _addToBasketTextController.text));
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
    _descriptionController.dispose();
    _addToBasketTextController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, ProductDisplayFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
