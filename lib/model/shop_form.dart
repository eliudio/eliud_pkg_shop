/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_form.dart
                       
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

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';

import 'package:eliud_pkg_shop/model/shop_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_model.dart';
import 'package:eliud_pkg_shop/model/shop_form_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_form_event.dart';
import 'package:eliud_pkg_shop/model/shop_form_state.dart';

class ShopForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final ShopModel? value;
  final ActionModel? submitAction;

  ShopForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the ShopForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<ShopFormBloc>(
        create: (context) => ShopFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseShopFormEvent(value: value)),
        child: MyShopForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<ShopFormBloc>(
        create: (context) => ShopFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseShopFormNoLoadEvent(value: value)),
        child: MyShopForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Shop'
                      : 'Add Shop'),
          body: BlocProvider<ShopFormBloc>(
            create: (context) => ShopFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseShopFormEvent(value: value)
                : InitialiseNewShopFormEvent())),
            child: MyShopForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyShopForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyShopForm({required this.app, this.formAction, this.submitAction});

  @override
  State<MyShopForm> createState() => _MyShopFormState(formAction);
}

class _MyShopFormState extends State<MyShopForm> {
  final FormAction? formAction;
  late ShopFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _shortDescriptionController =
      TextEditingController();
  final TextEditingController _currencyController = TextEditingController();

  _MyShopFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ShopFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _shortDescriptionController.addListener(_onShortDescriptionChanged);
    _currencyController.addListener(_onCurrencyChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ShopFormBloc, ShopFormState>(builder: (context, state) {
      if (state is ShopFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is ShopFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _descriptionController.text = state.value!.description.toString();
        _shortDescriptionController.text =
            state.value!.shortDescription.toString();
        _currencyController.text = state.value!.currency.toString();
      }
      if (state is ShopFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

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
                    state is DocumentIDShopFormError ? state.message : null,
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
                    state is DescriptionShopFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Short Description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _shortDescriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is ShortDescriptionShopFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Currency',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _currencyController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is CurrencyShopFormError ? state.message : null,
                hintText: null));

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
                        if (state is ShopFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<ShopListBloc>(context)
                                .add(UpdateShopList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              shortDescription: state.value!.shortDescription,
                              currency: state.value!.currency,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<ShopListBloc>(context)
                                .add(AddShopList(
                                    value: ShopModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              shortDescription: state.value!.shortDescription,
                              currency: state.value!.currency,
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
    _myFormBloc.add(ChangedShopDocumentID(value: _documentIDController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedShopDescription(value: _descriptionController.text));
  }

  void _onShortDescriptionChanged() {
    _myFormBloc.add(
        ChangedShopShortDescription(value: _shortDescriptionController.text));
  }

  void _onCurrencyChanged() {
    _myFormBloc.add(ChangedShopCurrency(value: _currencyController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    _shortDescriptionController.dispose();
    _currencyController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, ShopFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
