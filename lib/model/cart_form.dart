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

import 'package:eliud_pkg_shop/model/cart_list_bloc.dart';
import 'package:eliud_pkg_shop/model/cart_list_event.dart';
import 'package:eliud_pkg_shop/model/cart_model.dart';
import 'package:eliud_pkg_shop/model/cart_form_bloc.dart';
import 'package:eliud_pkg_shop/model/cart_form_event.dart';
import 'package:eliud_pkg_shop/model/cart_form_state.dart';

class CartForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final CartModel? value;
  final ActionModel? submitAction;

  CartForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the CartForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<CartFormBloc>(
        create: (context) => CartFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseCartFormEvent(value: value)),
        child: MyCartForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<CartFormBloc>(
        create: (context) => CartFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseCartFormNoLoadEvent(value: value)),
        child: MyCartForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Cart'
                      : 'Add Cart'),
          body: BlocProvider<CartFormBloc>(
            create: (context) => CartFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseCartFormEvent(value: value)
                : InitialiseNewCartFormEvent())),
            child: MyCartForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyCartForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyCartForm({required this.app, this.formAction, this.submitAction});

  @override
  State<MyCartForm> createState() => _MyCartFormState(formAction);
}

class _MyCartFormState extends State<MyCartForm> {
  final FormAction? formAction;
  late CartFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _checkoutTextController = TextEditingController();
  String? _shop;

  _MyCartFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<CartFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _checkoutTextController.addListener(_onCheckoutTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<CartFormBloc, CartFormState>(builder: (context, state) {
      if (state is CartFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is CartFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _titleController.text = state.value!.title.toString();
        _descriptionController.text = state.value!.description.toString();
        _checkoutTextController.text = state.value!.checkoutText.toString();
        if (state.value!.shop != null) {
          _shop = state.value!.shop!.documentID;
        } else {
          _shop = "";
        }
      }
      if (state is CartFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(ActionField(widget.app, state.value!.openProductAction,
            _onOpenProductActionChanged));

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
                validator: (_) =>
                    state is DocumentIDCartFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'title',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _titleController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is TitleCartFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DescriptionCartFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Checkout text',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _checkoutTextController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is CheckoutTextCartFormError ? state.message : null,
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
                .groupTitle(widget.app, context, 'Checkout Action')));

        children.add(ActionField(
            widget.app, state.value!.checkoutAction, _onCheckoutActionChanged));

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
                .groupTitle(widget.app, context, 'Continue Shopping Action')));

        children.add(ActionField(widget.app, state.value!.backToShopAction,
            _onBackToShopActionChanged));

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
                .groupTitle(widget.app, context, 'Shop')));

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
                .groupTitle(widget.app, context, 'Item Image Background')));

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
                .groupTitle(widget.app, context, 'Item Detail Background')));

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
                .groupTitle(widget.app, context, 'Checkout Action')));

        children.add(ActionField(
            widget.app, state.value!.checkoutAction, _onCheckoutActionChanged));

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
                        if (state is CartFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<CartListBloc>(context)
                                .add(UpdateCartList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              description: state.value!.description,
                              checkoutText: state.value!.checkoutText,
                              shop: state.value!.shop,
                              itemImageBackground:
                                  state.value!.itemImageBackground,
                              itemDetailBackground:
                                  state.value!.itemDetailBackground,
                              checkoutAction: state.value!.checkoutAction,
                              backToShopAction: state.value!.backToShopAction,
                              openProductAction: state.value!.openProductAction,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<CartListBloc>(context)
                                .add(AddCartList(
                                    value: CartModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              description: state.value!.description,
                              checkoutText: state.value!.checkoutText,
                              shop: state.value!.shop,
                              itemImageBackground:
                                  state.value!.itemImageBackground,
                              itemDetailBackground:
                                  state.value!.itemDetailBackground,
                              checkoutAction: state.value!.checkoutAction,
                              backToShopAction: state.value!.backToShopAction,
                              openProductAction: state.value!.openProductAction,
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
    _myFormBloc.add(ChangedCartDocumentID(value: _documentIDController.text));
  }

  void _onTitleChanged() {
    _myFormBloc.add(ChangedCartTitle(value: _titleController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedCartDescription(value: _descriptionController.text));
  }

  void _onCheckoutTextChanged() {
    _myFormBloc
        .add(ChangedCartCheckoutText(value: _checkoutTextController.text));
  }

  void _onShopSelected(String? val) {
    setState(() {
      _shop = val;
    });
    _myFormBloc.add(ChangedCartShop(value: val));
  }

  void _onCheckoutActionChanged(value) {
    _myFormBloc.add(ChangedCartCheckoutAction(value: value));
  }

  void _onBackToShopActionChanged(value) {
    _myFormBloc.add(ChangedCartBackToShopAction(value: value));
  }

  void _onOpenProductActionChanged(value) {
    _myFormBloc.add(ChangedCartOpenProductAction(value: value));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _checkoutTextController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, CartFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
