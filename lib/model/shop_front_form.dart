/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

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

import 'package:eliud_pkg_shop/model/shop_front_list_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_front_list_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_model.dart';
import 'package:eliud_pkg_shop/model/shop_front_form_bloc.dart';
import 'package:eliud_pkg_shop/model/shop_front_form_event.dart';
import 'package:eliud_pkg_shop/model/shop_front_form_state.dart';


class ShopFrontForm extends StatelessWidget {
  FormAction formAction;
  ShopFrontModel? value;
  ActionModel? submitAction;

  ShopFrontForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<ShopFrontFormBloc >(
            create: (context) => ShopFrontFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add(InitialiseShopFrontFormEvent(value: value)),
  
        child: MyShopFrontForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<ShopFrontFormBloc >(
            create: (context) => ShopFrontFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add(InitialiseShopFrontFormNoLoadEvent(value: value)),
  
        child: MyShopFrontForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update ShopFront' : 'Add ShopFront'),
        body: BlocProvider<ShopFrontFormBloc >(
            create: (context) => ShopFrontFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseShopFrontFormEvent(value: value) : InitialiseNewShopFrontFormEvent())),
  
        child: MyShopFrontForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyShopFrontForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyShopFrontForm({this.formAction, this.submitAction});

  _MyShopFrontFormState createState() => _MyShopFrontFormState(this.formAction);
}


class _MyShopFrontFormState extends State<MyShopFrontForm> {
  final FormAction? formAction;
  late ShopFrontFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _shop;
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _cardElevationController = TextEditingController();
  final TextEditingController _cardAxisSpacingController = TextEditingController();
  String? _itemCardBackground;
  int? _viewSelectedRadioTile;
  int? _scrollDirectionSelectedRadioTile;


  _MyShopFrontFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ShopFrontFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _sizeController.addListener(_onSizeChanged);
    _cardElevationController.addListener(_onCardElevationChanged);
    _cardAxisSpacingController.addListener(_onCardAxisSpacingChanged);
    _viewSelectedRadioTile = 0;
    _scrollDirectionSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ShopFrontFormBloc, ShopFrontFormState>(builder: (context, state) {
      if (state is ShopFrontFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is ShopFrontFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.title != null)
          _titleController.text = state.value!.title.toString();
        else
          _titleController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.shop != null)
          _shop= state.value!.shop!.documentID;
        else
          _shop= "";
        if (state.value!.size != null)
          _sizeController.text = state.value!.size.toString();
        else
          _sizeController.text = "";
        if (state.value!.cardElevation != null)
          _cardElevationController.text = state.value!.cardElevation.toString();
        else
          _cardElevationController.text = "";
        if (state.value!.cardAxisSpacing != null)
          _cardAxisSpacingController.text = state.value!.cardAxisSpacing.toString();
        else
          _cardAxisSpacingController.text = "";
        if (state.value!.itemCardBackground != null)
          _itemCardBackground= state.value!.itemCardBackground!.documentID;
        else
          _itemCardBackground= "";
        if (state.value!.view != null)
          _viewSelectedRadioTile = state.value!.view!.index;
        else
          _viewSelectedRadioTile = 0;
        if (state.value!.scrollDirection != null)
          _scrollDirectionSelectedRadioTile = state.value!.scrollDirection!.index;
        else
          _scrollDirectionSelectedRadioTile = 0;
      }
      if (state is ShopFrontFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDShopFrontFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitleShopFrontFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionShopFrontFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Size', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _sizeController, keyboardType: TextInputType.number, validator: (_) => state is SizeShopFrontFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Card Elevation', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _cardElevationController, keyboardType: TextInputType.number, validator: (_) => state is CardElevationShopFrontFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Card Axis Spacing', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _cardAxisSpacingController, keyboardType: TextInputType.number, validator: (_) => state is CardAxisSpacingShopFrontFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Action After Buy')
                ));

        children.add(

                ActionField(AccessBloc.currentAppId(context), state.value!.buyAction, _onBuyActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Open product action')
                ));

        children.add(

                ActionField(AccessBloc.currentAppId(context), state.value!.openProductAction, _onOpenProductActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Shop')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "shops", value: _shop, trigger: _onShopSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'View')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _viewSelectedRadioTile, 'Slider', 'Slider', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionView(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _viewSelectedRadioTile, 'Grid', 'Grid', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionView(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Item Card Background')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _itemCardBackground, trigger: _onItemCardBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Item Detail Background')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Add to Cart Background')
                ));

        children.add(

                RgbField("Add To Cart Color", state.value!.addToCartColor, _onAddToCartColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Scroll Direction')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _scrollDirectionSelectedRadioTile, 'Horizontal', 'Horizontal', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionScrollDirection(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _scrollDirectionSelectedRadioTile, 'Vertical', 'Vertical', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionScrollDirection(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Conditions')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is ShopFrontFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<ShopFrontListBloc>(context).add(
                          UpdateShopFrontList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              description: state.value!.description, 
                              shop: state.value!.shop, 
                              size: state.value!.size, 
                              cardElevation: state.value!.cardElevation, 
                              cardAxisSpacing: state.value!.cardAxisSpacing, 
                              itemCardBackground: state.value!.itemCardBackground, 
                              addToCartColor: state.value!.addToCartColor, 
                              view: state.value!.view, 
                              scrollDirection: state.value!.scrollDirection, 
                              buyAction: state.value!.buyAction, 
                              openProductAction: state.value!.openProductAction, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<ShopFrontListBloc>(context).add(
                          AddShopFrontList(value: ShopFrontModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              description: state.value!.description, 
                              shop: state.value!.shop, 
                              size: state.value!.size, 
                              cardElevation: state.value!.cardElevation, 
                              cardAxisSpacing: state.value!.cardAxisSpacing, 
                              itemCardBackground: state.value!.itemCardBackground, 
                              addToCartColor: state.value!.addToCartColor, 
                              view: state.value!.view, 
                              scrollDirection: state.value!.scrollDirection, 
                              buyAction: state.value!.buyAction, 
                              openProductAction: state.value!.openProductAction, 
                              conditions: state.value!.conditions, 
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

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedShopFrontDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedShopFrontAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedShopFrontTitle(value: _titleController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedShopFrontDescription(value: _descriptionController.text));
  }


  void _onShopSelected(String? val) {
    setState(() {
      _shop = val;
    });
    _myFormBloc.add(ChangedShopFrontShop(value: val));
  }


  void _onSizeChanged() {
    _myFormBloc.add(ChangedShopFrontSize(value: _sizeController.text));
  }


  void _onCardElevationChanged() {
    _myFormBloc.add(ChangedShopFrontCardElevation(value: _cardElevationController.text));
  }


  void _onCardAxisSpacingChanged() {
    _myFormBloc.add(ChangedShopFrontCardAxisSpacing(value: _cardAxisSpacingController.text));
  }


  void _onItemCardBackgroundSelected(String? val) {
    setState(() {
      _itemCardBackground = val;
    });
    _myFormBloc.add(ChangedShopFrontItemCardBackground(value: val));
  }


  void _onAddToCartColorChanged(value) {
    _myFormBloc.add(ChangedShopFrontAddToCartColor(value: value));
    
  }


  void setSelectionView(int? val) {
    setState(() {
      _viewSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedShopFrontView(value: toShopFrontView(val)));
  }


  void setSelectionScrollDirection(int? val) {
    setState(() {
      _scrollDirectionSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedShopFrontScrollDirection(value: toScrollDirection(val)));
  }


  void _onBuyActionChanged(value) {
    _myFormBloc.add(ChangedShopFrontBuyAction(value: value));
    
  }


  void _onOpenProductActionChanged(value) {
    _myFormBloc.add(ChangedShopFrontOpenProductAction(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _sizeController.dispose();
    _cardElevationController.dispose();
    _cardAxisSpacingController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, ShopFrontFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AccessBloc.currentAppId(context)));
  }
  

}



