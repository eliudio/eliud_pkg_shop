/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'cart_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'product_model.dart';

@immutable
abstract class CartItemFormEvent extends Equatable {
  const CartItemFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewCartItemFormEvent extends CartItemFormEvent {
}


class InitialiseCartItemFormEvent extends CartItemFormEvent {
  final CartItemModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseCartItemFormEvent({this.value});
}

class InitialiseCartItemFormNoLoadEvent extends CartItemFormEvent {
  final CartItemModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseCartItemFormNoLoadEvent({this.value});
}

class ChangedCartItemDocumentID extends CartItemFormEvent {
  final String value;

  ChangedCartItemDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemDocumentID{ value: $value }';
}

class ChangedCartItemAmount extends CartItemFormEvent {
  final String value;

  ChangedCartItemAmount({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemAmount{ value: $value }';
}

class ChangedCartItemAppId extends CartItemFormEvent {
  final String value;

  ChangedCartItemAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemAppId{ value: $value }';
}

class ChangedCartItemProduct extends CartItemFormEvent {
  final String value;

  ChangedCartItemProduct({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCartItemProduct{ value: $value }';
}

